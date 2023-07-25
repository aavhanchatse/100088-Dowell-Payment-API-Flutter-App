// To parse this JSON data, do
//
//     final paymentModel = paymentModelFromJson(jsonString);

import 'dart:convert';

PaymentModel paymentModelFromJson(String str) =>
    PaymentModel.fromJson(json.decode(str));

String paymentModelToJson(PaymentModel data) => json.encode(data.toJson());

class PaymentModel {
  String? approvalUrl;
  String? paymentId;

  PaymentModel({
    this.approvalUrl,
    this.paymentId,
  });

  factory PaymentModel.fromJson(Map<String, dynamic> json) => PaymentModel(
        approvalUrl: json["approval_url"],
        paymentId: json["payment_id"],
      );

  Map<String, dynamic> toJson() => {
        "approval_url": approvalUrl,
        "payment_id": paymentId,
      };
}
