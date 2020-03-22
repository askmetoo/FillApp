import 'package:fillproject/components/constants/myColor.dart';
import 'package:fillproject/components/constants/myText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubmitButton extends StatelessWidget {
  final Function onPressedFunction;
  SubmitButton({Key key, this.onPressedFunction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: ScreenUtil.instance.setWidth(316.0),
        height: ScreenUtil.instance.setHeight(50.0),
        margin: EdgeInsets.only(
            top: ScreenUtil.instance.setWidth(7.0),
            left: ScreenUtil.instance.setWidth(54.0),
            right: ScreenUtil.instance.setWidth(55.0)),
        child: RaisedButton(
          color: MyColor().black,
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(33.5),
          ),
          onPressed: () => onPressedFunction(context),
          child: Text(MyText().btnSubmit,
              style: TextStyle(
                  fontSize: ScreenUtil.instance.setSp(18.0),
                  color: MyColor().white)),
        ));
  }
}