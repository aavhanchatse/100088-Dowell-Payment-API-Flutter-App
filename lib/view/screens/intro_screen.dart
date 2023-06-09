import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wifiqrcode/app_constants/constants.dart';
import 'package:wifiqrcode/utils/size_config.dart';
import 'package:wifiqrcode/utils/storage_manager.dart';
import 'package:wifiqrcode/view/common_widgets/gradient_bottom_up_widget.dart';
import 'package:wifiqrcode/view/common_widgets/splash_screen_widget.dart';
import 'package:wifiqrcode/view/screens/wifi_list_screen.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController controller = PageController();
  int currentIndex = 0;

  List<Widget> pageViewWidgets = const [
    SplashScreenWidget(
      image: 'assets/images/splash/splash_1.png',
      title: 'Create',
      description: 'Create QR Code for your Wifi\n& share it with your friends',
    ),
    SplashScreenWidget(
      image: 'assets/images/splash/splash_2.png',
      title: 'Scan',
      description:
          'Users can scan your QR Code\n& connect without entering\nthe credentials',
    ),
    SplashScreenWidget(
      image: 'assets/images/splash/splash_3.png',
      title: 'Disclaimer',
      description: 'Read the Disclaimer before\ncontinuing',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const GradientBottomUpWidget(),
          Column(
            children: [
              _pageView(),
              _pageIndicator(),
              SizedBox(height: 10.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _skipButton(),
                    _nextButton(),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _pageView() {
    return SizedBox(
      height: 74.h,
      width: 100.w,
      child: PageView.builder(
        itemCount: pageViewWidgets.length,
        controller: controller,
        physics: const BouncingScrollPhysics(),
        onPageChanged: (int value) {
          currentIndex = value;
          setState(() {});
        },
        itemBuilder: (context, index) {
          return pageViewWidgets[index];
        },
      ),
    );
  }

  Widget _pageIndicator() {
    return AnimatedSmoothIndicator(
      activeIndex: currentIndex,
      count: pageViewWidgets.length,
      effect: SwapEffect(
        dotHeight: 1.h,
        dotWidth: 1.h,
        activeDotColor: Constants.primaryColor,
        spacing: 2.w,
      ),
    );
  }

  Widget _nextButton() {
    return ElevatedButton(
      onPressed: _nextSplash,
      style: ElevatedButton.styleFrom(
        backgroundColor: Constants.primaryColor,
        fixedSize: const Size(50, 50),
        shape: const CircleBorder(),
      ),
      child: const Icon(Icons.arrow_forward),
    );
  }

  Widget _skipButton() {
    return TextButton(
      onPressed: _skip,
      child: Text(
        'Skip',
        style: TextStyle(
          color: Constants.black,
          fontSize: 16,
        ),
      ),
    );
  }

  void _nextSplash() {
    if (currentIndex == pageViewWidgets.length - 1) {
      setStorageValue();
      Get.offAll(() => const WifiListScreen());
    } else {
      controller.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.ease);
    }
  }

  void _skip() {
    setStorageValue();
    Get.offAll(() => const WifiListScreen());
  }

  void setStorageValue() {
    var box = StorageManager();
    box.setInroScreenValue();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }
}
