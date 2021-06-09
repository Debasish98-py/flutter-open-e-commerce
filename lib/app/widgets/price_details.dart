import 'package:flutter/material.dart';

class PriceDetails extends StatelessWidget {
  const PriceDetails({
    Key key,
    this.price,
  }) : super(key: key);

  final String price;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Price Details"),
      ),
      body: Card(
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
              Divider(height: 15, color: Colors.black),
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
                        price,
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
                        "Rs.${0}",
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
                        "Rs.${0}",
                        style: TextStyle(fontSize: 20),
                      )
                    ],
                  ),
                ],
              ),
              Divider(height: 15, color: Colors.black),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total Amount",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text(
                    price,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  )
                ],
              ),
              Divider(height: 15, color: Colors.black),
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
    );
  }
}
