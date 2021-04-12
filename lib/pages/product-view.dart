import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:opencommerce/main.dart';
import 'package:opencommerce/models/model.dart';
import 'package:opencommerce/product-add-edit.dart';

class ProductView extends StatefulWidget {
  final Product product;

  ProductView(this.product);

  @override
  _ProductViewState createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.product.name}"),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProductAddEdit(widget.product)),
              );
              setState(() {});
            },
          ),

          ///CartIcon()
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Image.network(
              widget.product.imageUrl,
              height: 300.0,
            ),
            Divider(height: 10, color: Colors.black,),
            Text(
              widget.product.name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              widget.product.inStock ? 'In-Stock' : 'Out of stock',
              style: TextStyle(
                  color: widget.product.inStock ? Colors.green : Colors.red, fontSize: 20),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(widget.product.description, style: TextStyle(fontSize: 22, fontStyle: FontStyle.italic),),

            Spacer(),
            Text("₹${widget.product.price}", style: TextStyle(fontSize: 20),),
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Builder(
                  builder: (context) => ElevatedButton(
                      onPressed: () {
                        cart.products.add(widget.product);
                        Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text('${widget.product.name} added to the cart'),
                          duration: Duration(seconds: 5),
                        ));
                      },
                      child: Text('Add to Cart')),
                ),
                ElevatedButton(onPressed: () {}, child: Text('Buy')),
              ],
            ),
            Spacer()
          ],
        ),
      ),
    );
  }
}
