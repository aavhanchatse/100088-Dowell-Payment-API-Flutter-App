import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:launch_review/launch_review.dart';
import 'package:wifiqrcode/app_constants/constants.dart';
import 'package:wifiqrcode/utils/appbar_util.dart';
import 'package:wifiqrcode/utils/default_snackbar_util.dart';
import 'package:wifiqrcode/utils/gesturedetector_util.dart';
import 'package:wifiqrcode/utils/size_config.dart';
import 'package:wifiqrcode/utils/style_utils.dart';
import 'package:wifiqrcode/view/common_widgets/gradient_bottom_up_widget.dart';
import 'package:wifiqrcode/view/common_widgets/heading_widget.dart';
import 'package:wifiqrcode/view/screens/email_screen.dart';

class QRCodeScreen extends StatefulWidget {
  const QRCodeScreen({super.key});

  @override
  State<QRCodeScreen> createState() => _QRCodeScreenState();
}

class _QRCodeScreenState extends State<QRCodeScreen> {
  final image = "assets/images/qr_code.png";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GestureDetectorUtil.onScreenTap();
      },
      child: Scaffold(
        appBar: AppBarUtil.commonAppBar(showBackButton: true),
        body: Stack(
          children: [
            const GradientBottomUpWidget(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: Column(
                children: [
                  const HeadingWidget(
                    title: 'Wifi Network 1',
                    showSubtitle: false,
                  ),
                  SizedBox(height: 12.w),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Image.asset(image),
                  ),
                  SizedBox(height: 6.w),
                  _codeIdWidget(),
                  const Spacer(),
                  _button(),
                  SizedBox(height: 4.w),
                  _button2(),
                  SizedBox(height: 2.w),
                  _rateButton(),
                  SizedBox(height: 4.w),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _rateButton() {
    return TextButton(
      onPressed: () {
        LaunchReview.launch(androidAppId: "com.wifiqrcode");
      },
      child: Text(
        'Rate Our App',
        style: TextStyle(
          color: Constants.black,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _codeIdWidget() {
    return Column(
      children: [
        Text(
          "QR Code ID",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 2.2.t,
          ),
        ),
        SizedBox(height: 2.w),
        Container(
          decoration: BoxDecoration(
            color: Constants.primaryInputBgColor,
            borderRadius: BorderRadius.circular(12),
            boxShadow: StyleUtil.primaryShadow(),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Text(
                "QWEFDFsasdf8345FASDF",
                style: TextStyle(
                  fontSize: 2.t,
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {
                  _copyToClipboard("QWEFDFsasdf8345FASDF");
                },
                icon: const Icon(Icons.copy),
              ),
              SizedBox(width: 4.w),
            ],
          ),
        ),
      ],
    );
  }

  Future<void> _copyToClipboard(String data) async {
    await Clipboard.setData(ClipboardData(text: data));

    SnackBarUtil.getToast("Copied to clipboard");
  }

  Widget _button() {
    return InkWell(
      onTap: () {
        Get.to(() => const EmailScreen());
      },
      child: Container(
        height: 7.h,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Constants.primaryColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          'Email QR Code',
          style: TextStyle(
            fontSize: 1.8.t,
            color: Constants.white,
          ),
        ),
      ),
    );
  }

  Widget _button2() {
    return InkWell(
      onTap: () {
        SnackBarUtil.getToast("Coming Soon");
      },
      child: Container(
        height: 7.h,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Constants.primaryColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          'Download QR Code',
          style: TextStyle(
            fontSize: 1.8.t,
            color: Constants.white,
          ),
        ),
      ),
    );
  }
}
