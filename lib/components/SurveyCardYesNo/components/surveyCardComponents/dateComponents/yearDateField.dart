import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fillproject/components/SurveyCardYesNo/components/labelContainer.dart';
import 'package:fillproject/components/SurveyCardYesNo/components/surveyCardComponents/submitButton.dart';
import 'package:fillproject/components/constants/myColor.dart';
import 'package:fillproject/components/constants/myText.dart';
import 'package:fillproject/components/emptyCont.dart';
import 'package:fillproject/firebaseMethods/firebaseCrud.dart';
import 'package:fillproject/globals.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

String userAnswer;
bool fieldColor1 = false;
TextEditingController yearController = TextEditingController(text: '');
String selectedYear;

class YearDateField extends StatefulWidget {
  final String username;
  final Function notifyParent;
  final DocumentSnapshot doc;
  final String title;
  String year;
  YearDateField(
      {Key key,
      this.title,
      this.notifyParent,
      this.username,
      this.year,
      this.doc})
      : super(key: key);

  @override
  _YearDateFieldState createState() => _YearDateFieldState();
}

class _YearDateFieldState extends State<YearDateField> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Column(
        key: ValueKey(widget.title),
        children: <Widget>[
          Column(
            children: <Widget>[
              LabelContainer(
                  text: MyText().year, leftMargin: 0.0, containerWidth: 300.0),
              Container(
                width: ScreenUtil.instance.setWidth(327.0),
                height: ScreenUtil.instance.setWidth(61.0),
                margin: EdgeInsets.only(top: ScreenUtil.instance.setWidth(5.0)),
                child: TextFormField(
                  readOnly: true,
                  textAlign: TextAlign.center,
                  onTap: () => isSummary
                      ? null
                      : showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return GestureDetector(
                              onTap: () {
                                if (selectedYear == null) {
                                  selectedYear = '1';
                                }
                                widget.year = selectedYear;
                                yearController.text = widget.year;
                                Navigator.pop(context);
                              },
                              child: Container(
                                  height: ScreenUtil.instance.setHeight(265.0),
                                  child: _buildItemPicker(context)),
                            );
                          }),
                  enableSuggestions: false,
                  style: TextStyle(color: Colors.black),
                  controller: yearController,
                  decoration: InputDecoration(
                    hasFloatingPlaceholder: false,
                    contentPadding: new EdgeInsets.symmetric(
                        vertical: 20.0, horizontal: 20.0),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(33.5)),
                      borderSide: BorderSide(
                        color: fieldColor1 ? MyColor().error : MyColor().black,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(33.5)),
                      borderSide: BorderSide(
                        color: fieldColor1 ? MyColor().error : MyColor().black,
                      ),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(33.5)),
                      borderSide: BorderSide(
                        color: MyColor().error,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(33.5)),
                      borderSide: BorderSide(
                        color: MyColor().error,
                      ),
                    ),
                  ),
                  obscureText: false,
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: ScreenUtil.instance.setWidth(3.0)),
            child: fieldColor1
                ? Text(
                    MyText().emptyFieldSnack,
                    style: TextStyle(color: MyColor().error),
                  )
                : Text(''),
          ),
          isSummary
              ? EmptyContainer()
              : SubmitButton(onPressedFunction: onPressed, isImage: false)
        ],
      ),
    );
  }

  onPressed(BuildContext context) {
    if (yearController.text.length == 0) {
      setState(() {
        fieldColor1 = true;
      });
      Timer(Duration(seconds: 3), () {
        setState(() {
          fieldColor1 = false;
        });
      });
    } else {
      setState(() {
        fieldColor1 = false;
      });
      userAnswer = yearController.text;
      FirebaseCrud().updateListOfUsernamesAnswersSurvey(
          widget.doc, context, widget.username, userAnswer, widget.title);
      widget.notifyParent();
      selectedYear = '2020';
    }
  }

  Widget _buildItemPicker(BuildContext context) {
    List<dynamic> items = [];
    items.removeRange(0, items.length);
    for (int i = 2020; i >= 1900; i--) {
      items.add(i.toString());
    }

    return CupertinoPicker(
      itemExtent: 45.0,
      onSelectedItemChanged: (index) {
        selectedYear = items[index];
        widget.year = selectedYear;
      },
      looping: true,
      useMagnifier: true,
      magnification: 1.2,
      children: List<Widget>.generate(items.length, (index) {
        return Container(
            alignment: Alignment.center,
            child: Text(
              items[index],
              style: TextStyle(fontSize: ScreenUtil.instance.setSp(25.0)),
            ));
      }),
    );
  }
}