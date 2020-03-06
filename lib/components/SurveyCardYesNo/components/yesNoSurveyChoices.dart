import 'dart:async';

import 'package:fillproject/components/constants/myColor.dart';
import 'package:fillproject/globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class YesNoSurveyChoices extends StatefulWidget {
  final String choice1;
   final Function() notifyParent;
  YesNoSurveyChoices({this.choice1, this.notifyParent});

  @override
  _YesNoSurveyChoicesState createState() => _YesNoSurveyChoicesState();
}

class _YesNoSurveyChoicesState extends State<YesNoSurveyChoices> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: ScreenUtil.instance.setWidth(30.0)),
          width: ScreenUtil.instance.setWidth(303.0),
          height: ScreenUtil.instance.setWidth(58.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(29)),
              color: MyColor().white),
          child: RaisedButton(
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
                    fontFamily: "LoewNextArabic",
                    fontStyle: FontStyle.normal,
                    fontSize: 18.0),
                textAlign: TextAlign.center),
            onPressed: () {
              setState(() {
                isTapped = true;
              });
              Timer(Duration(milliseconds: 200), () {
                onPressed();
              });
            },
          ),
        ),
      ],
    );
  }

  onPressed() {
    setState(() {
      isTapped = false;
    });
    widget.notifyParent();
  }
}