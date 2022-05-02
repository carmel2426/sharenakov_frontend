import 'package:carmel_project/product.dart';
import 'package:carmel_project/server.dart';
import 'package:flutter/material.dart';
import 'package:latlng/latlng.dart';
import 'package:objectid/objectid.dart';
import 'add_a_product.dart';

class give_a_product extends StatefulWidget {
  const give_a_product({Key? key}) : super(key: key);

  @override
  _give_a_productState createState() => _give_a_productState();
}

class _give_a_productState extends State<give_a_product> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Give a product"),
        ),

        body: FutureBuilder<List<ProductModel>>(
          future: getProducts(),
          builder: (context, snapshot) {
            if (snapshot.hasError || !snapshot.hasData) {
              return CircularProgressIndicator();
            }

            List<ProductModel> products = snapshot.data!;
            return Column(
              children: products.map((e) => Product(product: e)).toList(),
            );
          },
        )
    );
  }
}
