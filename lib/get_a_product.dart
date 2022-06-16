import 'package:carmel_project/dist.dart';
import 'package:carmel_project/home_page.dart';
import 'package:flutter/material.dart';
import 'server.dart';


TextEditingController radiusController = TextEditingController();
TextEditingController productController = TextEditingController();
TextEditingController decriptionController = TextEditingController();
LocationService pos = LocationService();
final key = GlobalKey<FormState>();
Future navigateToHomePage(context) async {
  Navigator.pop(context);
  Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
}
class get_a_product extends StatelessWidget {
  const get_a_product({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Get A Product"),
      ),
      body: Center(
        child: Form(
          key: key,
          child: Column(
            children: [
              Row(
                children: [
                  Text("Radius: "),
                  Container(
                    child: TextFormField(
                      validator: (value) {
                        if (value!.length == 0) {
                          return "your radius field is empty"; //print something
                        }
                        if (int.tryParse(value) == null) {
                          return "the radius must be digits";
                        }
                        return null;
                      },
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
                    child: TextFormField(
                    validator: (value) {
                      if (value!.length == 0) {
                        return "your product field is empty"; //print something
                      }
                    },
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
                        if(key.currentState!.validate()){
                        const snackBar = SnackBar(
                          content: Text('Yay! your product sent'),
                        );
                        navigateToHomePage(context);
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        pos.checkGps();
                        // if(double.parse(radiusController.text))
                        createProduct(radiusController.text, productController.text, decriptionController.text, pos.lat, pos.long);
                      }}))
            ],
          ),
        ),
      ),
    );
  }
}
