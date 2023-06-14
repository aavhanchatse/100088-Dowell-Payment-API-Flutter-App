// To parse this JSON data, do
//
//     final paymentModel = paymentModelFromJson(jsonString);

import 'dart:convert';

PaymentModel paymentModelFromJson(String str) =>
    PaymentModel.fromJson(json.decode(str));

String paymentModelToJson(PaymentModel data) => json.encode(data.toJson());

class PaymentModel {
  String? approvalUrl;

  PaymentModel({
    this.approvalUrl,
  });

  factory PaymentModel.fromJson(Map<String, dynamic> json) => PaymentModel(
        approvalUrl: json["approval_url"],
      );

  Map<String, dynamic> toJson() => {
        "approval_url": approvalUrl,
      };
}
