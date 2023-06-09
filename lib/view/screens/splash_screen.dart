import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wifiqrcode/utils/size_config.dart';
import 'package:wifiqrcode/utils/storage_manager.dart';
import 'package:wifiqrcode/view/common_widgets/gradient_top_down_widget.dart';
import 'package:wifiqrcode/view/screens/intro_screen.dart';
import 'package:wifiqrcode/view/screens/wifi_list_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final LOGO = "assets/images/logo/dowell_logo.png";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _checkLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const GradientTopDownWidget(),
          SizedBox(
            height: 100.h,
            width: 100.w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Image.asset(LOGO),
                ),
                Text(
                  'DO WELL\nWIFI QR CODE',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 2.t,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 2,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _checkLogin() {
    var box = StorageManager();

    bool? splashValue = box.getIntoScreenValue();

    Future.delayed(const Duration(seconds: 3), () {
      if (splashValue == true) {
        Get.offAll(
          () => const WifiListScreen(),
          transition: Transition.fade,
          duration: const Duration(milliseconds: 300),
        );
      } else {
        Get.offAll(
          () => const IntroScreen(),
          transition: Transition.fade,
          duration: const Duration(milliseconds: 300),
        );
      }
    });
  }
}
