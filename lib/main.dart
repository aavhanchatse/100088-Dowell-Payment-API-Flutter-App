import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:uni_links/uni_links.dart';
import 'package:wifiqrcode/app_constants/themes.dart';
import 'package:wifiqrcode/localization/localization_service.dart';
import 'package:wifiqrcode/utils/size_config.dart';
import 'package:wifiqrcode/view/common_widgets/internet_subscription_widget.dart';
import 'package:wifiqrcode/view/screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  if (kReleaseMode) {
    debugPrint = (String? message, {int? wrapWidth}) {};
  }

  await GetStorage.init();
  runApp(const MyApp());
  _initDeepLinks();
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String localeLan = "en";

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return OrientationBuilder(
          builder: (BuildContext context2, Orientation orientation) {
        SizeConfig.init(constraints, orientation);

        return GetMaterialApp(
          title: "DoWell Wifi QR Code",
          useInheritedMediaQuery: true,
          builder: DevicePreview.appBuilder,
          theme: Themes.light,
          locale: Locale(localeLan),
          fallbackLocale: LocalizationService.fallbackLocale,
          translations: LocalizationService(),
          debugShowCheckedModeBanner: false,
          defaultTransition:
              GetPlatform.isIOS ? Transition.cupertino : Transition.rightToLeft,
          home: const Stack(
            children: [
              SplashScreen(),
              NoInternetSubscriptionWidget(),
            ],
          ),
        );
      });
    });
  }
}

// Handle the deep link when the app is resumed
void _handleDeepLink(Uri uri) {
  // You can handle the deep link here and navigate the user to the desired screen in your app.
  print('Deep link received: ${uri.toString()}');
  // https://wifiqrcode.app.link/
}

// Set up the deep link handler
void _initDeepLinks() {
  uriLinkStream.listen((Uri? uri) {
    _handleDeepLink(uri!);
  }, onError: (err) {
    print('Error handling deep link: $err');
  });
}
