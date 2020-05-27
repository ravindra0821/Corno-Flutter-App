import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';


import '../colors.dart';

abstract class AlertOnOkClick {
  void onOkClickListener();
}

class GlobalUtil {
  static AlertOnOkClick alertOnOkClick;

  static final AuthKey = "authorization";
  static final UserId = "userId";
  static final RoleId = "3";
  static final DeviceId = "device_id";
  static final DeviceType = "device_type";
  static final QR_Code = "QR_Code";
  static final UserInfo = "User_info";
  // ^(?:[+0]9)?[0-9]{10}$

  static final Pattern emailPattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  static final Pattern passwordPattern =r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$';
  static Widget showToast(BuildContext context, String msg, Toast toastLength) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: toastLength,
        gravity: ToastGravity.TOP,
        timeInSecForIos: 1,
        backgroundColor: ColorConst.TEXT_GREY_COLOR,
        textColor: Colors.white,
        fontSize: 16.0);
  }

}
