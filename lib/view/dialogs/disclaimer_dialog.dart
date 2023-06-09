import 'package:flutter/material.dart';
import 'package:wifiqrcode/utils/size_config.dart';

class DisclaimerDialog extends StatelessWidget {
  const DisclaimerDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 4.w),
        width: 400,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 1.h),
            Text(
              "Disclaimer",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 2.t, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 2.5.h),
            const Text(
              "Do Well may collect certain identifiable information (personal information) about you when you visit our application.\nExamples of personal information we collect may include your name, address, phone number and email address.",
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 2.5.h),
          ],
        ),
      ),
    );
  }
}
