
import 'package:carmel_project/product.dart';
import 'package:carmel_project/server.dart';
import 'package:flutter/material.dart';
import 'package:latlng/latlng.dart';
import 'package:objectid/objectid.dart';
import 'add_a_product.dart';
import 'dist.dart';

class GiveProduct extends StatefulWidget {
  const GiveProduct({Key? key}) : super(key: key);

  @override
  _GiveProductState createState() => _GiveProductState();
}

class _GiveProductState extends State<GiveProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Give a product"),
        ),
        body: FutureBuilder<List<ProductModel>>(
          future: () async {
            LocationService service = LocationService();
            await service.checkGps();
            print("SERVICE fds fuiosdbui  $service");
            return await getProducts(service.lat, service.long);
          }(),
          builder: (context, snapshot) {
            if (snapshot.hasError || !snapshot.hasData) {
              return CircularProgressIndicator();
            }

            List<ProductModel> products = snapshot.data!;
            print(products);
            return Column(
              children: products.map((e) => Product(product: e)).toList(),
            );
          },
        ));
  }
}
