part of constants;

/// all endpoint api
class ApiPath {
  // static const ENVIRONMENT = "devo";
  static const baseURL = "https://100088.pythonanywhere.com";
  // // static const baseURL = "https://a4ce-103-198-165-141.in.ngrok.io";

  // static const TERMS_CONDITION =
  //     "http://app.pinktree-admin-panels.com.alotechnow.com/terms-and-conditions";
  // static const PRIVACY_POLICY =
  //     "http://app.pinktree-admin-panels.com.alotechnow.com/privacy-policy";

  // static const SUPPORT_EMAIL = "support@pinktree.co";

  static const initializeStripePayment = "/api/stripe/initialize";
  static const verifyStripePayment = "/api/verify/payment/stripe";
  // static const makePayment = "/api/team/paypal";
}
