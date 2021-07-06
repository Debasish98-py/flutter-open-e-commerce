import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opencommerce/app/modules/product/product_model.dart';
import 'package:opencommerce/app/modules/product/views/product_view.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.search),
      onPressed: () {
        showSearch(context: context, delegate: _SearchBarDelegate());
      },
    );
  }
}

class _SearchBarDelegate extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          // close(context, null);
          query = "";
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back_ios),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Text(
        query,
        style: TextStyle(
            color: Colors.blue, fontWeight: FontWeight.w900, fontSize: 20),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return query.isEmpty
        ? Center(
            child: Text("Search Ploxxxx"),
          )
        : StreamBuilder<List<Product>>(
            stream: FirebaseFirestore.instance
                .collection("Products")
                .where("keywords", arrayContains: query)
                .snapshots()
                .map((snapShot) => snapShot.docs
                    .map((doc) => Product.fromMap(doc.data()))
                    .toList()),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return Text("Loading...");
              if (snapshot.connectionState != ConnectionState.waiting) {
                final List<Product> _pr = snapshot.data;
                return ListView.builder(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemCount: _pr.length,
                  itemBuilder: (context, index) {
                    var prd = _pr[index];
                    return ListTile(
                      leading: CircleAvatar(
                        radius: 25,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(prd.imageUrl),
                              ),
                            ),
                          ),
                        ),
                      ),
                      title: Text(
                        prd.shortName,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      subtitle: Text(
                        prd.shortName,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      onTap: () {
                        Get.to(() => ProductView(), arguments: prd);
                      },
                    );
                  },
                );
              } else {
                return Center(
                  child:
                      Text("Ploxx bro check your search, you kiddin' me rn?"),
                );
              }
            },
          );
  }
}
