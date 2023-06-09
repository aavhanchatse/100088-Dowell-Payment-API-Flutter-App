import 'package:flutter/material.dart';
import 'package:wifiqrcode/app_constants/constants.dart';
import 'package:wifiqrcode/utils/size_config.dart';

class HeadingWidget extends StatelessWidget {
  final String title;
  final String? subtitle;
  final bool? showSubtitle;

  const HeadingWidget({
    super.key,
    this.showSubtitle = true,
    this.subtitle,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 2.5.t,
              ),
            ),
            if (showSubtitle == true) ...[
              SizedBox(height: 2.w),
              Text(
                subtitle ?? "",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Constants.textGrey,
                ),
              ),
            ],
          ],
        ),
      ],
    );
  }
}
