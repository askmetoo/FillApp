import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fillproject/components/constants/fontsConstants.dart';
import 'package:fillproject/components/constants/myColor.dart';
import 'package:fillproject/components/myAlertDialog.dart';
import 'package:fillproject/firebaseMethods/firebaseCrud.dart';
import 'package:fillproject/globals.dart';
import 'package:fillproject/localization/app_localizations.dart';
import 'package:fillproject/routes/routeArguments.dart';
import 'package:fillproject/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SurveyChoices extends StatefulWidget {
  final PasswordArguments arguments;
  final String choice1, username, branching, branchingChoice;
  final Function() notifyParent, complete;
  final String title;
  final DocumentSnapshot doc;

  SurveyChoices({
    this.arguments,
    this.branching,
    this.branchingChoice,
    this.choice1,
    this.notifyParent,
    this.complete,
    this.username,
    this.title,
    this.doc,
  });

  @override
  _YesNoSurveyChoicesState createState() => _YesNoSurveyChoicesState();
}

class _YesNoSurveyChoicesState extends State<SurveyChoices> {

  @override
  void initState() {
    super.initState();
    isTapped = false;
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      children: <Widget>[
        Container(
          key: ValueKey(widget.title),
          margin: EdgeInsets.only(top: ScreenUtil.instance.setWidth(20.0)),
          width: ScreenUtil.instance.setWidth(303.0),
          height: ScreenUtil.instance.setWidth(58.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(29)),
              color: MyColor().white),
          child: RaisedButton(
              key: UniqueKey(),
              hoverColor: isTapped ? MyColor().white : MyColor().black,
              color: isTapped ? MyColor().white : MyColor().black,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(28.0),
              ),
              child: Text(widget.choice1,
                  style: TextStyle(
                      color: isTapped ? MyColor().black : MyColor().white,
                      fontWeight: FontWeight.w700,
                      fontFamily: arabic,
                      fontStyle: FontStyle.normal,
                      fontSize: ScreenUtil.instance.setSp(18.0)),
                  textAlign: TextAlign.center),
              onPressed: () => isSummary
                  ? null
                  : {
                      if (counterSurvey == 0)
                        {
                          setState(() {
                            isTapped = true;
                          }),
                          counterSurvey = 1,
                          Timer(Duration(milliseconds: 200), () {
                            onPressed();
                          }),
                          Timer(Duration(milliseconds: 600), () {
                            counterSurvey = 0;
                          }),
                        }
                    }),
        ),
      ],
    );
  }

  onPressed() {
    setState(() {
      isTapped = false;
    });
    FirebaseCrud().updateListOfUsernamesAnswersSurvey(
        widget.doc, context, widget.username, widget.choice1, widget.title);
    offlineAnswers.add(widget.choice1);

    if (widget.branching == 'yes') {
      if (widget.choice1 == widget.branchingChoice) {
        FirebaseCrud().updateListOfUsernamesThatGaveAnswersSurvey(
            widget.doc, context, widget.username);
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) {
            return MyAlertDialog(
                title: AppLocalizations.of(context).translate('thisSurveyIsNotCompatible'),
                content: AppLocalizations.of(context).translate('youWillBeRedirected'),
                no: '',
                yes: AppLocalizations.of(context).translate('ok'),
                notifyParent: widget.complete);
          },
        );
      } else {
        widget.notifyParent();
      }
    } else {
      widget.notifyParent();
    }
  }
}
