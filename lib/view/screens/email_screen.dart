import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:wifiqrcode/app_constants/constants.dart';
import 'package:wifiqrcode/utils/appbar_util.dart';
import 'package:wifiqrcode/utils/default_snackbar_util.dart';
import 'package:wifiqrcode/utils/gesturedetector_util.dart';
import 'package:wifiqrcode/utils/size_config.dart';
import 'package:wifiqrcode/view/common_widgets/custom_text_field.dart';
import 'package:wifiqrcode/view/common_widgets/gradient_bottom_up_widget.dart';
import 'package:wifiqrcode/view/common_widgets/heading_widget.dart';

class EmailScreen extends StatefulWidget {
  const EmailScreen({super.key});

  @override
  State<EmailScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
  final _formKey = GlobalKey<FormState>();

  final image = "assets/images/qr_code.png";

  String? _name;
  String? _email;
  String? _subject;
  String? _content;

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
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const HeadingWidget(
                        title: 'Email QR Code',
                        subtitle: "Wifi Network 1",
                      ),
                      SizedBox(height: 12.w),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25.w),
                        child: Image.asset(image),
                      ),
                      SizedBox(height: 8.w),
                      _nameField(),
                      SizedBox(height: 4.w),
                      _emailField(),
                      SizedBox(height: 4.w),
                      _subjectField(),
                      SizedBox(height: 4.w),
                      _contentField(),
                      SizedBox(height: 8.w),
                      _button(),
                      SizedBox(height: 4.w),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _nameField() {
    return CustomTextField(
      keyboardType: TextInputType.name,
      textCapitalization: TextCapitalization.words,
      onChanged: (String value) {
        _name = value.trim();
        setState(() {});
      },
      validator: (String? value) {
        if (value!.trim().isEmpty) {
          return "Enter valid name";
        }
        return null;
      },
      labelText: 'Name',
      prefixIcon: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Image.asset(
          'assets/icons/name.png',
          height: 6.w,
        ),
      ),
    );
  }

  Widget _emailField() {
    return CustomTextField(
      keyboardType: TextInputType.emailAddress,
      onChanged: (String value) {
        _email = value.trim();
        setState(() {});
      },
      validator: (value) =>
          EmailValidator.validate(value) ? null : "Enter valid email",
      labelText: 'Email',
      prefixIcon: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Image.asset(
          'assets/icons/email.png',
          height: 6.w,
        ),
      ),
    );
  }

  Widget _subjectField() {
    return CustomTextField(
      keyboardType: TextInputType.name,
      onChanged: (String value) {
        _subject = value.trim();
        setState(() {});
      },
      validator: (String? value) {
        if (value!.trim().isEmpty) {
          return "Enter valid subject";
        }
        return null;
      },
      labelText: 'Subject',
      prefixIcon: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Image.asset(
          'assets/icons/subject.png',
          height: 6.w,
        ),
      ),
    );
  }

  Widget _contentField() {
    return CustomTextField(
      keyboardType: TextInputType.name,
      onChanged: (String value) {
        _content = value.trim();
        setState(() {});
      },
      maxLines: 4,
      validator: (String? value) {
        if (value!.trim().isEmpty) {
          return "Enter valid content";
        }
        return null;
      },
      labelText: 'Content',
      prefixIcon: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Image.asset(
          'assets/icons/content.png',
          height: 6.w,
        ),
      ),
    );
  }

  Widget _button() {
    return InkWell(
      onTap: () {
        if (!_formKey.currentState!.validate()) {
          return;
        }
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
          'Email QR Code',
          style: TextStyle(
            fontSize: 1.8.t,
            color: Constants.white,
          ),
        ),
      ),
    );
  }
}
