import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:wifiqrcode/utils/size_config.dart';

import '../app_constants/constants.dart';

class SnackBarUtil {
  static getToast(String text) {
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.SNACKBAR,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black54,
      textColor: Colors.white,
    );
  }

  static showSnackBar(String text, {Widget? actionButton, Color? color}) {
    Get.showSnackbar(GetSnackBar(
      duration: const Duration(milliseconds: 2000),
      borderRadius: 16.0,
      margin: EdgeInsets.all(4.w),
      // boxShadows: CommonStyle.primaryShadowLight(),
      backgroundColor: Constants.primaryColor,
      animationDuration: const Duration(milliseconds: 500),
      mainButton: actionButton,
      messageText: Text(
        text,
        style: TextStyle(
          color: Constants.textColor,
        ),
      ),
    ));
  }
}
