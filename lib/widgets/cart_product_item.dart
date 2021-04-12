import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:opencommerce/models/model.dart';
import 'package:opencommerce/pages/pages.dart';

class CartItem extends StatelessWidget {
  final Product product;
  Function onRemove;

  CartItem(this.product, this.onRemove);

  set dis(value) => product.price  = value;
  set disVal(val) => product.discount = val;
  get dis => product.price-(product.price*product.discount/100);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          margin: EdgeInsets.all(20),
          color: Colors.red,
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 2,
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> ProductView(product)));
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              product.name ?? '',
                              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "₹${product.price}",
                              style: TextStyle(fontSize: 20),
                              textAlign: TextAlign.start,
                            )
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      child: Image.network(
                        product.imageUrl,
                        fit: BoxFit.fitWidth,
                      ),
                    )
                  ],
                ),
                Divider(color: Colors.black, thickness: 1,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: Text("Add to WishList"),
                    ),
                    ElevatedButton(onPressed: onRemove, child: Text("Remove")),
                  ],
                ),
              ],
            ),
          ),
        ),
        Card(
          margin: EdgeInsets.all(20),
          color: Colors.cyanAccent,
          shadowColor: Colors.blue,
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "PRICE DETAILS",
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Divider(thickness: 2, color: Colors.black),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Price",
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          "₹${product.price}",
                          style: TextStyle(fontSize: 20),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Discount",
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          "-${product.discount}%",
                          style: TextStyle(fontSize: 20),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Delivery Charge",
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          "₹${0}",
                          style: TextStyle(fontSize: 20),
                        )
                      ],
                    ),
                  ],
                ),
                Divider(thickness: 1, color: Colors.black),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total Amount",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text(
                      "₹${dis}",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    )
                  ],
                ),
                Divider(thickness: 2, color: Colors.black),
                Row(
                  children: [
                    Text(
                      "Paisa laya?",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
