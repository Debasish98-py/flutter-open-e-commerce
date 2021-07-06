import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:opencommerce/app/modules/cart/service/cart_service.dart';
import 'package:opencommerce/app/modules/product/product_model.dart';
import 'package:opencommerce/app/modules/product/views/home_page.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:http/http.dart' as http;

class PaymentController extends GetxController {
  Razorpay _razorpay = Razorpay();
  var totalAmount = Get.arguments;
  var _orderID;

  paymentEvent() {
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void onInit() {
    _product.bindStream(CartService().getCartStream());
    paymentEvent();
    super.onInit();
  }

  var options;

  getOptions() {
    options = {
      'key': 'rzp_test_AlKpdLiGioPHU2',
      'amount': totalAmount * 100,
      'name': 'E-Mart',
      'order_id': _orderID,
      'currency': 'INR',
    };
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    _paymentId = response.paymentId;
    await addToOrder();
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

  Future<String> getOrderId() async {
    var authn = 'Basic ' +
        base64Encode(
            utf8.encode('rzp_test_AlKpdLiGioPHU2:JKSByESgtCcnsa3lpq2v1dtA'));

    var headers = {
      'content-type': 'application/json',
      'Authorization': authn,
    };

    var data = {
      'amount': totalAmount * 100,
      'currency': "INR",
      'payment_capture': 1,
    };

    var res = await http.post(Uri.parse("https://api.razorpay.com/v1/orders"),
        headers: headers, body: jsonEncode(data));
    if (res.statusCode != 200)
      throw Exception('http.post error: statusCode= ${res.statusCode}');
    print('ORDER ID response => ${res.body}');

    return _orderID = jsonDecode(res.body)['id'].toString();
  }

  openPayment() {
    _razorpay.open(options);
  }

  var user = FirebaseAuth.instance.currentUser;
  Rx<List<Product>> _product = Rx<List<Product>>([]);

  List<Product> get products => _product.value;
  var pr;
  var _paymentId;

  Future addToOrder() async{
    try {
      if (user != null) {
        final collection = FirebaseFirestore.instance.collection("Order");
        List<Map> _products = [];
        products.forEach((element) {
          Map _product = element.toMap();
          _products.add(_product);
        });
        collection.doc(_paymentId).set({
          _orderID: _products,
        });
      }
    } catch (e) {
      Get.snackbar("Error", "Something went wrong");
    }
  }
}
