import 'dart:convert';

import 'package:wifiqrcode/app_constants/constants.dart';
import 'package:wifiqrcode/models/payment_model.dart';
import 'package:wifiqrcode/models/verify_payment_mode.dart';
import 'package:wifiqrcode/utils/api_methods.dart';

class PaymentRepo {
  final API _api = API();

  Future<PaymentModel?> makePayment(
      Map payLoad, Map<String, String> headers) async {
    final response = await _api.postMethod(
      ApiPath.initializeStripePayment,
      // "${ApiPath.initializeStripePayment}/fd510288-6994-433d-8642-80a39f493b2e",
      payLoad,
      headers,
    );

    Map<String, dynamic> map = (jsonDecode(response.body));

    if (map['approval_url'] != null) {
      return PaymentModel.fromJson(map);
    }
    return null;
    // return SuperResponse.fromJson(map);
  }

  Future<VerifyPaymentModel?> verifyPayment(
      Map payLoad, Map<String, String> headers) async {
    final response = await _api.postMethod(
      ApiPath.verifyStripePayment,
      payLoad,
      headers,
    );

    Map<String, dynamic> map = (jsonDecode(response.body));

    Map<String, dynamic>? data = map['data'];

    if (data != null) {
      return VerifyPaymentModel.fromJson(data);
    }
    return null;
  }
}
