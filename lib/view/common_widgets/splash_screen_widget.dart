import 'package:flutter/material.dart';
import 'package:wifiqrcode/utils/size_config.dart';

class SplashScreenWidget extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const SplashScreenWidget(
      {Key? key,
      required this.image,
      required this.title,
      required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 7.h),
        Image.asset(
          image,
          width: 80.w,
          height: 50.h,
        ),
        SizedBox(height: 3.h),
        Text(
          title,
          style: TextStyle(
            fontSize: 2.5.t,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 2.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Text(
            description,
            style: TextStyle(
              fontSize: 1.8.t,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
