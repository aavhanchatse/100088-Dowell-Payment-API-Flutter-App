import 'package:flutter/material.dart';
import 'package:wifiqrcode/app_constants/constants.dart';

class GradientBottomUpWidget extends StatelessWidget {
  const GradientBottomUpWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Constants.white,
            Constants.secondaryColor,
          ],
        ),
      ),
    );
  }
}
