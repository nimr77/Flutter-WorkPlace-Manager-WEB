import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:my_work_manager/Pages/HomePAge.dart';
import 'package:my_work_manager/Pages/LoginPage.dart';
import 'package:my_work_manager/generated/l10n.dart';
import 'package:page_transition/page_transition.dart';

import '../Auth/MyFirebaseAuth.dart';

class MyLoadingScreen extends StatefulWidget {
  static const String route = '/dashboard';
  static List<Future> loaders = [
    // MyLoadersAndMyReLoaders.loadCuisines(),
    // MyLoadersAndMyReLoaders.loadAddressFromDatabase(),
    // MyLoadersAndMyReLoaders.loadRestaurent(),
    // MyLoadersAndMyReLoaders.loadCategories(),
    // MyLoadersAndMyReLoaders.loadCategoriesFormula(),
    // MyLoadersAndMyReLoaders.loadFormula(),
    // MyLoadersAndMyReLoaders.loadExtra(),
    // MyLoadersAndMyReLoaders.loadExtraGroup(),
    // MyLoadersAndMyReLoaders.loadMyRoles(),
    // MyLoadersAndMyReLoaders.loadMyFood(),
    // MyLoadersAndMyReLoaders.loadCoupons(),
    // MyLoadersAndMyReLoaders.initStreamStickers(),
    // MyLoadersAndMyReLoaders.initStreamCartOrders(),
    // MyLoadersAndMyReLoaders.initIngredientsStreamers(),
    // Future(() => MyOrderStates.initStates())
  ];
  @override
  _MyLoadingScreenState createState() => _MyLoadingScreenState();
}

class _MyLoadingScreenState extends State<MyLoadingScreen> {
  GlobalKey<ScaffoldState> myKey;

  @override
  void initState() {
    myKey = GlobalKey<ScaffoldState>();
    initializeDateFormatting();

    Firebase.initializeApp().then((value) async {
      ///This should be the list of loaders
      ///Lets Start with the auto Login
      var v = await MyFirebaseAuth.autoLogin();
      if (!v)
        Navigator.pushReplacement(
            context, CupertinoPageRoute(builder: (context) => LoginPage()));
      else {
        await Future.wait(MyLoadingScreen.loaders);

        Navigator.pushReplacement(context,
            PageTransition(child: HomePage(), type: PageTransitionType.fade));
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: myKey,
      body: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'assets/img/logo.png',
                    width: 300,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 50),
                  CircularProgressIndicator(
                    valueColor:
                        AlwaysStoppedAnimation<Color>(Colors.deepOrange[800]),
                  ),
                ],
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
      ),
    );
  }
}
