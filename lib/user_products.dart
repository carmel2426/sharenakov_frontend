import 'package:carmel_project/your_products_model.dart';
import 'package:flutter/material.dart';
import 'server.dart';
import 'package:carmel_project/server.dart';


class user_products extends StatelessWidget {
  const user_products({Key? key}) : super(key: key);

  string_to_list(String s) {
    s = s.replaceAll("[", "");
    s = s.replaceAll("]", "");
    List s2 = s.split("}");
    return s2;
  }

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
                      'Approved Products',
                      style: TextStyle(fontSize: 23, color: Colors.orange),
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
