import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opencommerce/app/modules/payment/payment_controller.dart';
import '../cart/controller/cart_controller.dart';
import '../product/product_model.dart';
import '../profile/controller/profile_controller.dart';

class CheckoutView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var totalAmount = Get.arguments.toString();
    return Scaffold(
      appBar: AppBar(
        title: Text("CheckOut"),
        backgroundColor: Colors.orange,
      ),
      body: SafeArea(
        child: Container(
          child: GetBuilder<CartController>(
            init: CartController(),
            builder: (cart) => ListView(
              children: [
                GetBuilder<UserProfileController>(
                  init: UserProfileController(),
                  builder: (pr) => pr.isBusy
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : pr.profile != null
                          ? Container(
                              padding: EdgeInsets.all(8),
                              child: ListView(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Delivery Address:',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600)),
                                    ],
                                  ),
                                  Divider(
                                    color: Colors.blue,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Address:'),
                                      Text(pr.profile.addressLine ?? " ",
                                          maxLines: 3,
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600)),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('City:'),
                                      Text(pr.profile.city ?? " ",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600)),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('State:'),
                                      Text(pr.profile.state ?? " ",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600)),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('LandMark:'),
                                      Text(pr.profile.landmark ?? " ",
                                          maxLines: 2,
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600)),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('PIN:'),
                                      Text(pr.profile.pin ?? " ",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600)),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Phone Number:'),
                                      Text(pr.profile.mobileNumber ?? ' ',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600))
                                    ],
                                  ),
                                ],
                              ),
                            )
                          : null,
                ),
                Divider(
                  color: Colors.blue,
                ),
                ListView.builder(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: cart.products.length,
                  itemBuilder: (BuildContext context, int index) {
                    Product product = cart.products[index];
                    return Card(
                      margin: EdgeInsets.all(5),
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  flex: 2,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        product.shortName ?? '',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        'Seller:',
                                        style: TextStyle(
                                          color: Colors.grey,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        'Rating:',
                                        style: TextStyle(
                                          color: Colors.grey,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 12,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "₹${product.price}",
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            textAlign: TextAlign.start,
                                          ),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Text(
                                            "-₹${product.discount}",
                                            style: TextStyle(
                                              color: Colors.green,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 12,
                                      ),
                                      Text(
                                        'Delivery by:',
                                        style: TextStyle(
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Container(
                                    height: 100,
                                    width: 120,
                                    child: Image.network(
                                      product.imageUrl,
                                      fit: BoxFit.scaleDown,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: GetBuilder<PaymentController>(
        init: PaymentController(),
        builder: (pay) => BottomAppBar(
          color: Colors.orange,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                child: Text(
                  "₹ $totalAmount\n   To Pay",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                height: 60,
                child: GestureDetector(
                  child: Container(
                    child: Center(
                      child: Text(
                        "Proceed To Pay",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.indigo),
                      ),
                    ),
                  ),
                  onTap: () async{
                    await pay.getOrderId();
                    await pay.getOptions();
                    pay.openPayment();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
