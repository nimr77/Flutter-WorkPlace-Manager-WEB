import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:my_work_manager/Util/APIUtils.dart';
import 'package:shared_preferences/shared_preferences.dart';

///This class is for Firebase AUTH
///[Contains] Login/Logout,Singin,AutoLogin
///[note] each Methods return's a True or False
class MyFirebaseAuth {
  static FirebaseAuth _myAuth = FirebaseAuth.instance;

  ///This will handle the User Login
  static Future<bool> login(String email, String password) async {
    try {
      var myAuthRes = await _myAuth.signInWithEmailAndPassword(
          email: email, password: password);

      if (myAuthRes.user.emailVerified) {
        // save the token
        var uid = _myAuth.currentUser.uid;
        var res = await http.get(MyAPIUtil.GetTokenForUser + '?uid=$uid');
        var idToken = res.body;
        var spr = await SharedPreferences.getInstance();
        await spr.setString('token', idToken);
      } else {
        await _myAuth.signOut();
        return false;
      }
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<bool> sendEmailV(String email, String password) async {
    try {
      var myAuthRes = await _myAuth.signInWithEmailAndPassword(
          email: email, password: password);
      await myAuthRes.user.sendEmailVerification();
      await _myAuth.signOut();
      return true;
    } catch (e) {
      return false;
    }
  }

  ///this will handle the user sign up
  static Future<bool> signUp(String email, String password, String name) async {
    try {
      var myAuthRes = await _myAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      await myAuthRes.user.updateProfile();
      await myAuthRes.user.sendEmailVerification();

      await _myAuth.signOut();
      return true;
    } catch (e) {
      print("Error in creating user" + e);
      return false;
    }
  }

  ///This will handle the logout
  static Future<bool> logout() async {
    try {
      // MyUser.me = null;
      var spr = await SharedPreferences.getInstance();
      await spr.remove('token');
      await _myAuth.signOut();
      // MyLogoutController.initAllData();
      return true;
    } catch (e) {
      print("Error logout(): " + e.toString());
      return false;
    }
  }

  ///This is the auto Login and it will load the user from the database
  ///if done then its true else then its false
  static Future<bool> autoLogin() async {
    try {
      var spr = await SharedPreferences.getInstance();
      var stringToken = spr.getString('token');
      final auth = await _myAuth.signInWithCustomToken(stringToken);
      final me = auth.user;
      // await MyUserActions.loadUserData(me.email);
      if (me.isAnonymous) return false;
      return true;
    } catch (e) {
      return false;
    }
  }

  ///This will get if the user been validated
  static bool checkIfUserBeenValidated() => _myAuth.currentUser.emailVerified;

  ///This to reset the email
  static Future<bool> sendResetPassword(String email) async {
    await _myAuth.sendPasswordResetEmail(email: email);
    return true;
  }

  static Future<bool> changeEmail(String email) async {
    ///[TODO]
    return true;
  }

  ///this will handle the user sign up
  // static Future<bool> createUser(
  //     String email, String password, String name) async {
  //   try {
  //     var sender = MyValidatorString.RemoveDot(MyUser.me.userEmail);
  //     var res = await http.get(MyAPIUtil.CreateUser +
  //         '?senderEmail=$sender&email=$email&name=$name&password=$password');
  //     Map body = jsonDecode(res.body);
  //     if (body['status']) {
  //       String uuid = body['uuid'];
  //       var usr =
  //           MyUser(id: uuid, userName: name, userEmail: email, active: true);
  //       usr.myUsersRole = MyUsersRole(
  //           canEditFood: false,
  //           canEditFormula: false,
  //           canEditResturent: false,
  //           canEditResturnets: false,
  //           isAdmin: false);
  //       MyUser.allMyUsers.add(usr);
  //       await MyUserActions.addUser(MyUser.allMyUsers.last);
  //       return true;
  //     } else {
  //       return false;
  //     }
  //   } catch (e) {
  //     print("Error in creating user " + e.toString());
  //     return false;
  //   }
  // }
}
