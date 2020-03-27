/// Home Page class
///
/// This class contains methods and layout for Home page.
///
/// Imports:
///   MyColor constant class with all colors
///   Cloud_firestore for connection to the firebase
///   ScreenUtil class for respnsive desing
///   Routes
///   Database connections
///
/// Authors: Sena Cikic, Danis Preldzic, Adi Cengic, Jusuf Elfarahati
/// Tech387 - T2
/// Feb, 2020

import 'dart:async';
import 'dart:io';
import 'package:fillproject/components/checkIfIsFirstTime.dart';
import 'package:fillproject/components/constants/fontsConstants.dart';
import 'package:fillproject/components/constants/myColor.dart';
import 'package:fillproject/components/constants/myText.dart';
import 'package:fillproject/components/myAlertDialog.dart';
import 'package:fillproject/components/mySnackbar.dart';
import 'package:fillproject/components/pageRouteBuilderAnimation.dart';
import 'package:fillproject/firebaseMethods/firebaseCrud.dart';
import 'package:fillproject/firebaseMethods/firebaseSignIn.dart';
import 'package:fillproject/home/homePage.dart';
import 'package:fillproject/localization/appLanguage.dart';
import 'package:fillproject/localization/app_localizations.dart';
import 'package:fillproject/routes/routeArguments.dart';
import 'package:fillproject/routes/routeConstants.dart';
import 'package:fillproject/utils/screenUtils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:random_string/random_string.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageScreen extends StatefulWidget {
  @override
  _LanguageScreenState createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  bool isLoggedIn = false;
  String name = '', username;
  String selectedLanguageCode, selectedLanguage;
  var appLanguage;

  @override
  void initState() {
    super.initState();
    Check().isChecking();
    autoLogIn(context, isLoggedIn);
    getLanguage();
  }

  @override
  Widget build(BuildContext context) {
    appLanguage = Provider.of<AppLanguage>(context);
    Constant().responsive(context);
    return Scaffold(
      backgroundColor: MyColor().black,
      body: Builder(
        builder: (context) => WillPopScope(
          onWillPop: _onWillPop,
          child: Center(
            child: Container(
              margin: EdgeInsets.only(top: ScreenUtil.instance.setWidth(220.0)),
              child: Column(
                children: <Widget>[
                  Center(
                      child: Text(
                    MyText().headline,
                    style: TextStyle(
                        fontSize: ScreenUtil.instance.setSp(70.0),
                        color: MyColor().white,
                        fontFamily: roboto),
                  )),
                  Container(
                      margin: EdgeInsets.only(
                          top: ScreenUtil.instance.setWidth(120.0)),
                      child: Text(
                        MyText().subtitle,
                        style: TextStyle(
                            fontSize: ScreenUtil.instance.setSp(23.0),
                            color: MyColor().white),
                        textAlign: TextAlign.center,
                      )),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: new BorderRadius.circular(33.5),
                        border: Border.all(width: 1, color: MyColor().white),
                        color: selectedLanguage == 'Arabic'
                            ? MyColor().white
                            : MyColor().black),
                    width: ScreenUtil.instance.setWidth(316.0),
                    height: ScreenUtil.instance.setHeight(67.0),
                    margin: EdgeInsets.only(
                        top: ScreenUtil.instance.setWidth(27.0),
                        bottom: ScreenUtil.instance.setWidth(15.0),
                        left: ScreenUtil.instance.setWidth(49.0),
                        right: ScreenUtil.instance.setWidth(49.0)),
                    child: RaisedButton(
                        color: selectedLanguage == 'Arabic'
                            ? MyColor().white
                            : MyColor().black,
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(33.5),
                        ),
                        onPressed: () {
                          setState(() {
                            appLanguage.changeLanguage(Locale("bs"));
                            selectedLanguage = 'Arabic';
                          });
                          Timer(Duration(seconds: 1), () {
                            Navigator.of(context).push(
                              CardAnimationTween(
                                widget: SignUp(),
                              ),
                            );
                          });
                        },
                        child: Text(
                          AppLocalizations.of(context)
                              .translate('arabic'),
                          style: TextStyle(
                              color: selectedLanguage == 'Arabic'
                                  ? MyColor().black
                                  : MyColor().white),
                        )),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: new BorderRadius.circular(33.5),
                        border: Border.all(width: 2, color: MyColor().white),
                        color: selectedLanguage == 'English'
                            ? MyColor().white
                            : MyColor().black),
                    width: ScreenUtil.instance.setWidth(316.0),
                    height: ScreenUtil.instance.setHeight(67.0),
                    margin: EdgeInsets.only(
                        bottom: ScreenUtil.instance.setWidth(33.0),
                        left: ScreenUtil.instance.setWidth(49.0),
                        right: ScreenUtil.instance.setWidth(49.0)),
                    child: RaisedButton(
                        color: selectedLanguage == 'English'
                            ? MyColor().white
                            : MyColor().black,
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(33.5),
                        ),
                        onPressed: () {
                          setState(() {
                            appLanguage.changeLanguage(Locale("en"));
                            selectedLanguage = 'English';
                          });
                          Timer(Duration(seconds: 2), () {
                            Navigator.of(context).push(
                              CardAnimationTween(
                                widget: SignUp(),
                              ),
                            );
                          });
                        },
                        child: Text(
                          AppLocalizations.of(context)
                              .translate('english'),
                          style: TextStyle(
                              color: selectedLanguage == 'English'
                                  ? MyColor().black
                                  : MyColor().white),
                        )),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  ///Method for fetching last selected language in order to continue
  ///
  ///with the same language after opening the application again
  getLanguage() async {
    var prefs = await SharedPreferences.getInstance();
    selectedLanguageCode = prefs.getString('language_code');
    if (selectedLanguageCode == 'en') {
      setState(() {
        selectedLanguage = 'English';
      });
      appLanguage.changeLanguage(Locale("en"));
    } else {
      setState(() {
        selectedLanguage = 'Arabic';
      });
      appLanguage.changeLanguage(Locale("bs"));
    }
  }

  onPressed(BuildContext context) async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        username = randomAlphaNumeric(5);
        FirebaseCrud().createUser('', '', username, '', 0, 1);
        loginUser();
        FirebaseSignIn().signInAnonymously(username);
        Timer(Duration(milliseconds: 800), () {
          Navigator.of(context).pushNamed(NavBar,
              arguments: PasswordArguments(
                  email: '', password: '', phone: '', username: username));
        });
      }
    } on SocketException catch (_) {
      MySnackbar()
          .showSnackbar(MyText().checkConnection, context, MyText().snackUndo);
    }
  }

  exitApp() {
    exit(0);
  }

  Future<bool> _onWillPop() async {
    return showDialog(
          context: context,
          builder: (context) => MyAlertDialog(
              title: MyText().willQuestion,
              content: MyText().willQuestion1,
              yes: MyText().willYes,
              notifyParent: exitApp,
              no: MyText().willNo),
        ) ??
        true;
  }

  void autoLogIn(BuildContext context, bool isLoggedIn) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String userId = prefs.getString('username');
    if (userId != null) {
      setState(() {
        isLoggedIn = true;
        username = userId;
      });

      Navigator.of(context).pushNamed(NavBar,
          arguments: PasswordArguments(
              email: '', password: '', phone: '', username: username));
      return;
    }
  }

  //duplanje koda i implementacija funckije ovdje zbog setState-a
  Future<Null> loginUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('username', username);
    setState(() {
      username = username;
      isLoggedIn = true;
    });
  }
}
