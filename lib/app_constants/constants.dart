import 'package:flutter/material.dart';
import 'package:wifiqrcode/utils/hex_color_util.dart';

class Constants {
  static Color primaryColor = HexColor('29CD70');
  static Color secondaryColor = HexColor('BFF5A9');

  static Color pageBackgroundLight = HexColor('FFFFFF');

  static Color textColor = HexColor('000000');
  static Color textWhite = HexColor('ffffff');

  static Color textGrey = const Color(0xFF9A9A9A);

  static Color black = HexColor('000000');
  static Color white = HexColor('ffffff');

  static Color green1 = HexColor('6EC421');
  static Color red1 = HexColor('FA4848');
  static Color red2 = HexColor('FC0000');

  static Color shadowColor2 = HexColor('BFBFD3');

  static Color primaryGrey = HexColor('989899');
  static Color primaryGrey2 = HexColor('D9D9D9');
  static Color primaryGreyLight = HexColor('CCCDCC');
  static Color primaryGreyExtraLight = HexColor('F3F5F9');

  static Color primaryBorderColor = HexColor('F3F0F4');

  static Color primaryInputBgColor = HexColor('F8F9F8');

  static Color primarySwitchBgColor = HexColor('F1F0F3');
  static Color primaryDarkSwitchBgColor = HexColor('EAEBEC');

  static const TERMS_CONDITION = 'https://qrcode.reviews/';
  static const PRIVACY_POLICY = 'https://qrcode.reviews/';

  static const PLAY_STORE_LINK =
      "https://play.google.com/store/apps/details?id=com.wifiqrcode";

  static const Duration placeholderFadeInDuration = Duration(milliseconds: 250);

  static const String noImage = "assets/icons/no_image.jpeg";

  //devo
  static const baseURL = "http://13.127.182.122:9955/";
  static const ENVIRONMENT = 'devo';

  //endpoints
  // static const String login = "mobileUser/mobileUserLogin";
  // static const String logoutUser = "mobileUser/logout";
}
