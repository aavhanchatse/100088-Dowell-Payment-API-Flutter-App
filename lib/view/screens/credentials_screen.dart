import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wifiqrcode/app_constants/constants.dart';
import 'package:wifiqrcode/utils/appbar_util.dart';
import 'package:wifiqrcode/utils/gesturedetector_util.dart';
import 'package:wifiqrcode/utils/size_config.dart';
import 'package:wifiqrcode/utils/style_utils.dart';
import 'package:wifiqrcode/view/common_widgets/custom_text_field.dart';
import 'package:wifiqrcode/view/common_widgets/gradient_bottom_up_widget.dart';
import 'package:wifiqrcode/view/common_widgets/heading_widget.dart';
import 'package:wifiqrcode/view/dialogs/disclaimer_dialog.dart';
import 'package:wifiqrcode/view/screens/qr_code_screen.dart';

class CredentialsScreen extends StatefulWidget {
  const CredentialsScreen({super.key});

  @override
  State<CredentialsScreen> createState() => _CredentialsScreenState();
}

class _CredentialsScreenState extends State<CredentialsScreen> {
  final _formKey = GlobalKey<FormState>();

  final List<String> _list = [
    "WPA/WPA2",
    "WEP",
  ];

  String? _password;
  String? _encryption;
  bool viewPassword = true;

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
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const HeadingWidget(
                      title: 'Wifi Network 1',
                      subtitle: 'Enter Wifi Credentials',
                    ),
                    SizedBox(height: 8.w),
                    _passwordField(),
                    SizedBox(height: 4.w),
                    _encryptionWidget(),
                    const Spacer(),
                    _disclaimerButton(),
                    SizedBox(height: 4.w),
                    _button(),
                    SizedBox(height: 4.w),
                    _termsAndCondiWidget(),
                    SizedBox(height: 6.w),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _disclaimerButton() {
    return TextButton(
      onPressed: () {
        _disclaimerDialog();
      },
      child: Text(
        'Disclaimer',
        style: TextStyle(
          color: Constants.black,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _termsAndCondiWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'By continuing, you agree to our',
          style: TextStyle(
            color: Constants.textGrey,
            fontWeight: FontWeight.w500,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                launchUrl(Uri.parse(Constants.TERMS_CONDITION));
              },
              child: Text(
                'Terms & Conditions',
                style: TextStyle(
                  color: Constants.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Text(
              ' and ',
              style: TextStyle(
                color: Constants.textGrey,
                fontWeight: FontWeight.w500,
              ),
            ),
            InkWell(
              onTap: () {
                launchUrl(Uri.parse(Constants.PRIVACY_POLICY));
              },
              child: Text(
                'Privacy Policy',
                style: TextStyle(
                  color: Constants.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  void _disclaimerDialog() {
    showCupertinoDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return const DisclaimerDialog();
        });
  }

  Widget _button() {
    return InkWell(
      onTap: () {
        _createQRCode();
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
          'Create QR Code',
          style: TextStyle(
            fontSize: 1.8.t,
            color: Constants.white,
          ),
        ),
      ),
    );
  }

  void _createQRCode() {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    Get.to(() => const QRCodeScreen());
  }

  Widget _passwordField() {
    return CustomTextField(
      keyboardType: TextInputType.name,
      textCapitalization: TextCapitalization.words,
      onChanged: (String value) {
        _password = value.trim();
        setState(() {});
      },
      obscureText: viewPassword,
      validator: (String? value) {
        if (value!.trim().isEmpty) {
          return "Enter valid password";
        }
        return null;
      },
      labelText: 'Password',
      // prefixIcon: Padding(
      //   padding: const EdgeInsets.symmetric(horizontal: 16),
      //   child: Image.asset(
      //     'assets/icons/password_icon.png',
      //     height: 6.w,
      //   ),
      // ),
      suffixIcon: Padding(
        padding: EdgeInsets.only(right: 4.w),
        child: IconButton(
          icon: Icon(
            viewPassword == true ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: () {
            viewPassword = !viewPassword;
            setState(() {});
          },
        ),
      ),
    );
  }

  Widget _encryptionWidget() {
    return DropdownButtonHideUnderline(
      child: DropdownButtonFormField<String>(
        isExpanded: true,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: StyleUtil.primaryDropDownDecoration(
          labelText: "Encryption",
        ),
        menuMaxHeight: 300.0,
        dropdownColor: Constants.primaryInputBgColor,
        borderRadius: BorderRadius.circular(10),
        value: _encryption,
        icon: const Icon(
          Icons.arrow_drop_down,
          color: Colors.black,
        ),
        items: _list.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        validator: (String? value) {
          if (value == null) {
            return "Select Encryption";
          }
          return null;
        },
        onChanged: (String? newValue) {
          _encryption = newValue!;
        },
      ),
    );
  }
}
