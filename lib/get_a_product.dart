import 'package:carmel_project/dist.dart';
import 'package:flutter/material.dart';
import 'server.dart';


TextEditingController radiusController = TextEditingController();
TextEditingController productController = TextEditingController();
TextEditingController decriptionController = TextEditingController();
LocationService pos = LocationService();

class get_a_product extends StatelessWidget {
  const get_a_product({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Get A Product"),
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              children: [
                Text("Radius: "),
                Container(
                  child: TextField(
                    controller: radiusController,
                  ),
                  width: 200,
                )
              ],
            ),
            Row(
              children: [
                Text("Product: "),
                Container(
                  child: TextField(
                    controller: productController,
                  ),
                  width: 200,
                )
              ],
            ),
            Row(
              children: [
                Text("Description: "),
                Container(
                  child: TextField(
                    controller: decriptionController,
                  ),
                  width: 200,
                )
              ],
            ),
            SizedBox(
              height: 80,
            ),
            SizedBox(
                width: 80,
                height: 40,
                child: ElevatedButton(
                    child: Text("Submit"),
                    onPressed: () {
                      pos.checkGps();
                      print("1111111111111111111111111");
                      print(pos.lat);
                      print("1111111111111111111111111");
                      print(pos.long);
                      createProduct(radiusController.text, productController.text, decriptionController.text, pos.lat, pos.long);
                    }))
          ],
        ),
      ),
    );
  }
}
