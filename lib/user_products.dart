import 'package:carmel_project/your_products_model.dart';
import 'package:flutter/material.dart';
import 'server.dart';
import 'package:carmel_project/server.dart';
import 'post_model.dart';

class user_products extends StatelessWidget {
  const user_products({Key? key}) : super(key: key);

  string_to_list(String s) {
    s = s.replaceAll("[", "");
    s = s.replaceAll("]", "");
    // s = s.replaceAll(",", ".");
    List s2 = s.split("}");
    return s2;
  }

  // products.toString() != "[]"
  Products_list() async {
    String x = await user_products2();
    List products = string_to_list(x);
    List<Widget> requests = [];
    print(products.length > 1);
    int i = 1;
    while (products.length > 1) {
      if (i == 2) {
        String z = products.removeAt(0);
        List q = z.split(",");
        String id = q[i - 1].toString().split(":")[1];
        String name_get_product = q[i ].toString().split(":")[1];
        String name_give_product = q[i + 1].toString().split(":")[1];
        String product = q[i + 2].toString().split(":")[1];
        String s = name_get_product + name_give_product + product;
        requests.add(user_product(product_text: s, Id: id, name: name_give_product));
      }
      if (i != 2) {
        String z = products.removeAt(0);
        List q = z.split(",");
        String id = q[i - 1].toString().split(":")[1];
        String name_get_product = q[i].toString().split(":")[1];
        String name_give_product = q[i + 1].toString().split(":")[1];
        String product = q[i + 2].toString().split(":")[1];
        String s = name_get_product + name_give_product + product;
        requests.add(user_product(product_text: s , Id: id, name: name_give_product));
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
                      'Users Confirm',
                      style: TextStyle(fontSize: 32, color: Colors.orange),
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

////onPressed: () async{
//                         var m = await user_products2();
//                         print(m.toString());
//                       },
