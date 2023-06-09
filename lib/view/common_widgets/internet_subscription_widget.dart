import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wifiqrcode/app_constants/constants.dart';

class NoInternetSubscriptionWidget extends StatefulWidget {
  const NoInternetSubscriptionWidget({super.key});

  @override
  _NoInternetSubscriptionWidgetState createState() =>
      _NoInternetSubscriptionWidgetState();
}

class _NoInternetSubscriptionWidgetState
    extends State<NoInternetSubscriptionWidget> {
  late StreamSubscription _subscription;
  double _height = 0.0;
  Color _color = Colors.red;

  @override
  initState() {
    super.initState();

    _subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        _height = 0.0;
        _color = Constants.green1;
        setState(() {});
      } else {
        _color = Constants.red1;
        _height = 50.0;
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        elevation: 6.0,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          height: _height,
          color: _color,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text("could_not_connect_to_internet".tr,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Constants.white,
                      fontSize: 13,
                      fontWeight: FontWeight.normal)),
            ),
          ),
        ),
      ),
    );
  }

  @override
  dispose() {
    super.dispose();
    _subscription.cancel();
  }
}
