import 'dart:convert';

import 'package:wifiqrcode/app_constants/constants.dart';
import 'package:wifiqrcode/models/payment_model.dart';
import 'package:wifiqrcode/utils/api_methods.dart';

class PaymentRepo {
  final API _api = API();

  Future<PaymentModel?> makePayment(
      Map payLoad, Map<String, String> headers) async {
    final response =
        await _api.postMethod(ApiPath.makePayment, payLoad, headers);

    Map<String, dynamic> map = (jsonDecode(response.body));

    if (map['approval_url'] != null) {
      return PaymentModel.fromJson(map);
    }
    return null;
    // return SuperResponse.fromJson(map);
  }
}
