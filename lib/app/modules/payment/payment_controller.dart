import 'package:get/get.dart';
import 'package:opencommerce/app/modules/product/views/home_page.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentController extends GetxController {
  Razorpay _razorpay = Razorpay();
  var totalAmount = Get.arguments;

  paymentEvent() {
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void onInit() {
    paymentEvent();
    super.onInit();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    print(response.paymentId);
    Get.to(() => HomePage());
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print("ABCDEFGHIJKLMNOPQRSTUVWXYZ");
    print('Payment Failed');
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    print("ABCDEFGHIJKLMNOPQRSTUVWXYZ");
    print('Payment Wallet');
  }

  var options;

  @override
  void onReady() {
    // TODO: implement onReady
    options = {
      'key': 'rzp_test_AlKpdLiGioPHU2',
      'amount': totalAmount * 100,
      'name': 'E-Mart',
      // 'prefill': {
      //   'contact': profile.profile.phoneNumber,
      //   'email': profile.profile.emailId,
      // }
    };

    super.onReady();
  }

  openPayment() {
    _razorpay.open(options);
  }
}
