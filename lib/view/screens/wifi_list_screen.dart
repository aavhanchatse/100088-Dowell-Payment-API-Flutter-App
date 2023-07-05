import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wifi_scan/wifi_scan.dart';
import 'package:wifiqrcode/app_constants/constants.dart';
import 'package:wifiqrcode/models/payment_model.dart';
import 'package:wifiqrcode/repo/payment_repo.dart';
import 'package:wifiqrcode/utils/appbar_util.dart';
import 'package:wifiqrcode/utils/default_snackbar_util.dart';
import 'package:wifiqrcode/utils/internet_util.dart';
import 'package:wifiqrcode/utils/progress_dialog.dart';
import 'package:wifiqrcode/utils/size_config.dart';
import 'package:wifiqrcode/view/common_widgets/gradient_bottom_up_widget.dart';
import 'package:wifiqrcode/view/common_widgets/heading_widget.dart';
import 'package:wifiqrcode/view/screens/credentials_screen.dart';

class WifiListScreen extends StatefulWidget {
  const WifiListScreen({super.key});

  @override
  State<WifiListScreen> createState() => _WifiListScreenState();
}

class _WifiListScreenState extends State<WifiListScreen> {
  bool loading = true;
  bool shouldCheckCan = true;
  List<WiFiAccessPoint> accessPoints = <WiFiAccessPoint>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _getScannedResults();
  }

  Future<void> _startScan() async {
    // check if "can" startScan
    if (shouldCheckCan) {
      // check if can-startScan
      final can = await WiFiScan.instance.canStartScan();
      // if can-not, then show error
      if (can != CanStartScan.yes) {
        if (mounted) SnackBarUtil.showSnackBar("Cannot start scan: $can");
        return;
      }
    }

    // call startScan API
    final result = await WiFiScan.instance.startScan();
    if (mounted) SnackBarUtil.showSnackBar("startScan: $result");
    // reset access points.
    setState(() => accessPoints = <WiFiAccessPoint>[]);
  }

  Future<void> _getScannedResults() async {
    if (await _canGetScannedResults(context)) {
      // get scanned results
      final results = await WiFiScan.instance.getScannedResults();

      accessPoints = results;
      loading = false;
      setState(() {});
    }
  }

  Future<bool> _canGetScannedResults(BuildContext context) async {
    if (shouldCheckCan) {
      // check if can-getScannedResults
      final can = await WiFiScan.instance.canGetScannedResults();
      // if can-not, then show error
      if (can != CanGetScannedResults.yes) {
        if (mounted) {
          SnackBarUtil.showSnackBar("Cannot get scanned results: $can");
        }
        accessPoints = <WiFiAccessPoint>[];
        return false;
      }
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarUtil.commonAppBar(showBackButton: false),
      body: Stack(
        children: [
          const GradientBottomUpWidget(),
          SingleChildScrollView(
            child: Column(
              children: [
                const HeadingWidget(
                  title: 'Available Wifi Network',
                  subtitle: 'Select one to create QR Code',
                ),
                SizedBox(height: 4.w),
                ElevatedButton(
                  onPressed: () {
                    _makePayment();
                  },
                  child: const Text("Make Payment Api Call"),
                ),
                // loading == true
                //     ? Center(
                //         child: CircularProgressIndicator(
                //             color: Constants.primaryColor),
                //       )
                //     : accessPoints.isEmpty
                //         ? const Center(
                //             child: Text("No Wifi Network Available"),
                //           )
                //         : _listView(),
                // SizedBox(height: 8.w),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _listView() {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.w),
      itemCount: accessPoints.length,
      itemBuilder: (context, index) {
        final WiFiAccessPoint item = accessPoints[index];

        return _listItem(item);
      },
      separatorBuilder: (context, index) {
        return SizedBox(height: 4.w);
      },
    );
  }

  Widget _listItem(WiFiAccessPoint item) {
    final title = item.ssid.isNotEmpty ? item.ssid : "**NA**";

    return InkWell(
      onTap: () {
        Get.to(() => const CredentialsScreen());
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 0.8.h, horizontal: 3.w),
        decoration: BoxDecoration(
          color: Constants.white,
          borderRadius: BorderRadius.circular(2.h),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 15,
              offset: const Offset(-5, 5), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 6.h,
                      width: 0.6.w,
                      decoration: BoxDecoration(
                          color: Constants.primaryColor,
                          borderRadius: BorderRadius.circular(2.h)),
                    ),
                    SizedBox(
                      width: 3.w,
                    ),
                    Container(
                      width: 5.h,
                      height: 5.h,
                      decoration: BoxDecoration(
                        color: Constants.primaryGreyExtraLight,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Image.asset(
                        'assets/icons/wifi_icon.png',
                        scale: 5,
                      ),
                    ),
                    SizedBox(
                      width: 6.w,
                    ),
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 1.6.t,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const Icon(
                  Icons.chevron_right,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _makePayment() async {
    ProgressDialog.showProgressDialog(context);
    final isInternet = await InternetUtil.isInternetConnected();

    if (isInternet) {
      try {
        Map<String, String>? headers = const {
          'Content-Type': 'application/json',
          'Authorization': 'Api-Key sgwF6fcb.RJKV99CLmI8TPM6op4SiZN9PukDJRU2p'
        };
        Map payload = {"price": 34, "product": "Workflow AI"};

        final PaymentModel? result =
            await PaymentRepo().makePayment(payload, headers);

        Get.back();

        if (result != null) {
          launchUrl(Uri.parse(result.approvalUrl ?? ""));
        }
      } catch (error) {
        Get.back();
        SnackBarUtil.showSnackBar('Something went wrong');
        debugPrint('error: $error');
      }
    } else {
      Get.back();
      SnackBarUtil.showSnackBar('internet_not_available'.tr);
    }
  }
}
