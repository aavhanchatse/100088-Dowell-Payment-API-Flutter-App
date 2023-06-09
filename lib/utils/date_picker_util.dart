import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wifiqrcode/app_constants/constants.dart';

class DatePickerUtil {
  static Future<DateTime?> getMaterialDatePicker(
      [bool? showFuture = false]) async {
    DateTime? date = await showDatePicker(
        context: Get.context!,
        initialDate: showFuture == true
            ? DateTime.now()
            : DateTime(DateTime.now().year - 8),
        firstDate: DateTime(1900),
        lastDate: showFuture == true
            ? DateTime(2050)
            : DateTime(DateTime.now().year - 8),
        initialEntryMode: DatePickerEntryMode.calendar,
        initialDatePickerMode: DatePickerMode.day,
        builder: (context, child) {
          return Theme(
            data: ThemeData.light().copyWith(
              primaryColor: Constants.primaryColor,
              colorScheme: ColorScheme.light(primary: Constants.primaryColor),
              buttonTheme:
                  const ButtonThemeData(textTheme: ButtonTextTheme.primary),
            ),
            child: child!,
          );
        });

    return date;
  }
}
