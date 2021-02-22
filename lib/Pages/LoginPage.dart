import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_work_manager/Auth/MyFirebaseAuth.dart';
import 'package:my_work_manager/Style/MyTextStyle.dart';
import 'package:my_work_manager/Util/GeneralUtil.dart';
import 'package:my_work_manager/Widgets/DashboardWidgets.dart';
import 'package:my_work_manager/Widgets/InputWidgets.dart';
import 'package:my_work_manager/Widgets/MyButtons.dart';
import 'package:my_work_manager/Widgets/ShapStyle1.dart';
import 'package:my_work_manager/Widgets/SnackBars.dart';
import 'package:my_work_manager/generated/l10n.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailCont = TextEditingController();
  TextEditingController passwordCont = TextEditingController();
  TextEditingController nameCont = TextEditingController();
  TextEditingController password2Cont = TextEditingController();
  final loginForm = GlobalKey<FormState>();
  final signupForm = GlobalKey<FormState>();
  final scafKey = GlobalKey<ScaffoldState>();
  double op = 1;
  bool switchTo = false;
  static bool loading = false;
  void signUpLoginSwitcher() {
    setState(() {
      op = 0;
      Future.delayed(Duration(milliseconds: 450), () {
        switchTo = !switchTo;
      });
      Future.delayed(Duration(milliseconds: 500), () {
        setState(() {
          op = 1;
        });
      });
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scafKey,
      body: Stack(
        children: [
          MyShapeSyle1(Colors.black54.withOpacity(0.6).value,
              "assets/Images/coverLogin.jpg"),
          // Align(
          //     alignment: Alignment.topCenter,
          //     child: Container(
          //       height: MyUtil.getContextHeight(context) * 0.1 <= 50
          //           ? MyUtil.getContextHeight(context) * 0.1
          //           : 50,
          //       child: MyAppBar.myAppBar(this,
          //           myColor: Colors.white.withOpacity(0.7)),
          //     )),

          //Fill page size
          AnimatedOpacity(
            duration: Duration(milliseconds: 400),
            onEnd: () {
              setState(() {});
            },
            opacity: op,
            child: !switchTo
                ? Center(
                    child: MyCardWidget(
                        Text(
                          S.current.loginTitle,
                          textScaleFactor: 0.7,
                          style: MyTextStyle.simpleTitleTextStyle(
                              myColor: Colors.black87),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 6,
                              child: Form(
                                key: loginForm,
                                child: AutofillGroup(
                                  child: Scrollbar(
                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          MyInputWidget.formInputBoxStand(
                                              emailCont, S.current.userEmail,
                                              autoFillHints: [
                                                AutofillHints.email
                                              ]),
                                          MyInputWidget.formPasswordBox(
                                            passwordCont,
                                            S.current.userPassword,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                      child: SimpleActionButton(
                                    isLoading: loading,
                                    onTap: () async {
                                      setState(() {
                                        loading = true;
                                      });
                                      if (loginForm.currentState.validate()) {
                                        var isValidate =
                                            await MyFirebaseAuth.login(
                                                emailCont.text,
                                                passwordCont.text);
                                        if (!isValidate) {
                                          MySnackBars.showSnackMessage(
                                            scafKey,
                                            S.current.errorUserNotValid,
                                          );
                                          //     onOK: () {
                                          //   MyFirebaseAuth.sendEmailV(
                                          //       emailCont.text,
                                          //       passwordCont.text);
                                          // });
                                        }
                                      }
                                      setState(() {
                                        loading = false;
                                      });
                                    },
                                    elevation: 0,
                                    myColor: Colors.blue,
                                    child: Text(
                                      S.current.login,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  )),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: FlatButton(
                                          color: Colors.transparent,
                                          onPressed: () async {
                                            var v = await MyFirebaseAuth
                                                .sendResetPassword(
                                                    emailCont.text);
                                            if (v) {
                                              MySnackBars.showSnackMessage(
                                                  scafKey,
                                                  S.current
                                                      .resetPasswordMessage,
                                                  backgroundColor: Colors.blue);
                                            } else {
                                              // reset password error
                                            }
                                          },
                                          child:
                                              Text(S.current.forgetPassword)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: FlatButton(
                                  color: Colors.transparent,
                                  onPressed: signUpLoginSwitcher,
                                  child: Text(S.current.dontHaveAccount)),
                            )
                          ],
                        ),
                        MyUtil.getContextHeight(context) * 0.5 > 300
                            ? 300
                            : MyUtil.getContextHeight(context) * 0.5,
                        MyUtil.getContextWidth(context) * 0.5),
                  )
                //Signup
                : Center(
                    child: MyCardWidget(
                        Text(
                          S.current.signupTitle,
                          textScaleFactor: 0.8,
                          style: MyTextStyle.simpleTitleTextStyle(
                              myColor: Colors.black87),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 6,
                              child: Form(
                                key: signupForm,
                                child: AutofillGroup(
                                  child: Scrollbar(
                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          MyInputWidget.formInputBoxStand(
                                              nameCont,
                                              S.current.firstName +
                                                  " and " +
                                                  S.current.lastName,
                                              autoFillHints: [
                                                AutofillHints.newUsername
                                              ]),
                                          MyInputWidget.formInputBoxStand(
                                              emailCont, S.current.userEmail,
                                              autoFillHints: [
                                                AutofillHints.email
                                              ]),
                                          MyInputWidget.formPasswordBox(
                                            passwordCont,
                                            S.current.userPassword,
                                          ),
                                          MyInputWidget.formPasswordBox(
                                              password2Cont,
                                              S.current.user2Password,
                                              secondPassword: passwordCont)
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                      child: SimpleActionButton(
                                    elevation: 0,
                                    myColor: Colors.blue,
                                    onTap: () async {
                                      setState(() {
                                        loading = true;
                                      });
                                      if (signupForm.currentState.validate()) {
                                        var isValidate =
                                            await MyFirebaseAuth.signUp(
                                                emailCont.text,
                                                passwordCont.text,
                                                nameCont.text);
                                        if (!isValidate) {
                                          MySnackBars.showSnackMessage(
                                              scafKey, S.current.errorInSignup,
                                              forSecond: 10);
                                        } else {
                                          MySnackBars.showSnackMessage(scafKey,
                                              S.current.checkYourEmailInbox,
                                              backgroundColor: Colors.green,
                                              forSecond: 3);
                                          this.signUpLoginSwitcher();
                                        }
                                      }
                                      setState(() {
                                        loading = false;
                                      });
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        S.current.signup,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  )),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: FlatButton(
                                          color: Colors.transparent,
                                          onPressed: signUpLoginSwitcher,
                                          child: Text(S.current.doHaveAccount)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        MyUtil.getContextHeight(context) * 0.7 > 445
                            ? 445
                            : MyUtil.getContextHeight(context) * 0.7,
                        MyUtil.getContextWidth(context) * 0.5),
                  ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              "${S.of(context).version}  ${MyAppInformation.version}",
              style: Theme.of(context).textTheme.caption,
            ),
          )
        ],
      ),
    );
  }
}

class MyAppInformation {
  static String version = "1.0.0";
}
