import 'package:carmel_project/product.dart';
import 'package:carmel_project/server.dart';
import 'package:flutter/material.dart';
import 'dist.dart';
import 'post_model.dart';
import 'dart:convert';

class give_product extends StatefulWidget {
  @override
  State<give_product> createState() => _give_productState();
}

class _give_productState extends State<give_product> {
  string_to_list(String s) {
    s = s.replaceAll("[", "");
    s = s.replaceAll("]", "");
    // s = s.replaceAll(",", ".");
    List s2 = s.split("}");
    return s2;
  }
  // products.toString() != "[]"
  Products_list() async {
    String x = await getProducts();
    List products = string_to_list(x);
    List<Widget> requests = [];
    print(products);
    print(products.isNotEmpty);
    int i = 1;
    while (products.length > 1) {
      if (i == 2) {
        String z = products.removeAt(0);
        List q = z.split(",");
        print(q);
        String id = q[ 1 ].toString().split(":")[1];
        print("pppppppppppp");
        print(id);
        String name = q[ i ].toString().split(":")[1];
        String radius = q[ i + 1 ].toString().split(":")[1];
        String product = q[ i + 2 ].toString().split(":")[1];
        String description = q[ i + 3 ].toString().split(":")[1];
        String s = name + radius + product;
        print(s);
        requests.add(Product(product_text: s, Nickname: name, Description: description, Id: id,));
        print(products.length);
      }
      if (i != 2) {
        String z = products.removeAt(0);
        List q = z.split(",");
        String id = q[ 0 ].toString().split(":")[1];
        String name = q[ i ].toString().split(":")[1];
        String radius = q[ i + 1 ].toString().split(":")[1];
        String product = q[ i + 2 ].toString().split(":")[1];
        String description = q[ i + 3 ].toString().split(":")[1];
        String s = name + radius + product;
        print(s);
        requests.add(Product(product_text: s, Nickname: name, Description: description, Id: id,));
        print(products.length);
        i = 2;
      }
    }
    return requests;

  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Products_list(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
                appBar: AppBar(
                    title: Text(
                      'Product',
                      style: TextStyle(fontSize: 46, color: Colors.orange),
                    ),
                    backgroundColor: Colors.deepOrangeAccent),
                body: Center(
                    child: ListView(
                      children: snapshot.data as List<Widget>,
                    )));
          } else {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}

// }
// class _GiveProductState extends State<GiveProduct> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text("Give a product"),
//         ),
//         body: FutureBuilder<List<ProductModel>>(
//           future: () async {
//             LocationService service = LocationService();
//             await service.checkGps();
//             print("SERVICE fds fuiosdbui  $service");
//             return await getProducts(service.lat, service.long);
//           }(),
//           builder: (context, snapshot) {
//             if (snapshot.hasError || !snapshot.hasData) {
//               return CircularProgressIndicator();
//             }
//
//             List<ProductModel> products = snapshot.data!;
//             print(products);
//             return Column(
//               children: products.map((e) => Product(product: e)).toList(),
//             );
//           },
//         ));
//   }
