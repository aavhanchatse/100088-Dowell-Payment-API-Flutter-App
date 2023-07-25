// To parse this JSON data, do
//
//     final verifyPaymentModel = verifyPaymentModelFromJson(jsonString);

import 'dart:convert';

VerifyPaymentModel verifyPaymentModelFromJson(String str) =>
    VerifyPaymentModel.fromJson(json.decode(str));

String verifyPaymentModelToJson(VerifyPaymentModel data) =>
    json.encode(data.toJson());

class VerifyPaymentModel {
  int? id;
  String? paymentId;
  String? sessionId;
  String? amount;
  String? currency;
  String? name;
  String? email;
  String? desc;
  DateTime? date;
  String? city;
  String? state;
  String? address;
  String? postalCode;
  String? countryCode;
  String? orderId;
  String? status;
  bool? mailSent;

  VerifyPaymentModel({
    this.id,
    this.paymentId,
    this.sessionId,
    this.amount,
    this.currency,
    this.name,
    this.email,
    this.desc,
    this.date,
    this.city,
    this.state,
    this.address,
    this.postalCode,
    this.countryCode,
    this.orderId,
    this.status,
    this.mailSent,
  });

  factory VerifyPaymentModel.fromJson(Map<String, dynamic> json) =>
      VerifyPaymentModel(
        id: json["id"],
        paymentId: json["payment_id"],
        sessionId: json["session_id"],
        amount: json["amount"],
        currency: json["currency"],
        name: json["name"],
        email: json["email"],
        desc: json["desc"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        city: json["city"],
        state: json["state"],
        address: json["address"],
        postalCode: json["postal_code"],
        countryCode: json["country_code"],
        orderId: json["order_id"],
        status: json["status"],
        mailSent: json["mail_sent"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "payment_id": paymentId,
        "session_id": sessionId,
        "amount": amount,
        "currency": currency,
        "name": name,
        "email": email,
        "desc": desc,
        "date":
            "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "city": city,
        "state": state,
        "address": address,
        "postal_code": postalCode,
        "country_code": countryCode,
        "order_id": orderId,
        "status": status,
        "mail_sent": mailSent,
      };
}
