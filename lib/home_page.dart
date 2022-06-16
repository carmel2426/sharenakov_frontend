import 'package:carmel_project/user_products.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'get_a_product.dart';
import 'give_a_product.dart';
import 'alert_dialog.dart';
import 'dist.dart';

LocationService pos = LocationService();

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'Start',
            style: TextStyle(fontSize: 46, color: Colors.orangeAccent),
          ),
          actions: [
            PopupMenuButton(
                color: Colors.yellowAccent,
                elevation: 20,
                enabled: true,
                onSelected: (value) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => user_products()));
                },
                itemBuilder:(context) => [
                  PopupMenuItem(
                    child: Text("Your Products"),
                    value: "Your Products",
                  ),
                ]
            )
          ],
          centerTitle: true,
          backgroundColor: Colors.deepOrange),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center,children: [

        Container(
            child: Column(children: [
          Container(
              decoration: BoxDecoration(color: Colors.lightBlue.withOpacity(0)),
              child: ElevatedButton(
                child: Text("   Give a product   "),
                onPressed: () async {
                  //navigate to give a product
                  Navigator.push(context, MaterialPageRoute(builder: (context) => give_product()));
                  await pos.checkGps();
                },
              )),
          SizedBox(
            height: 28,
          ),
          Container(
              decoration: BoxDecoration(color: Colors.lightBlue.withOpacity(0)),
              child: ElevatedButton(
                child: Text("request a Product"),
                onPressed: () async {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => get_a_product()));
                  await pos.checkGps();
                },
              )),
              SizedBox(height: 388,)
        ]))
      ])),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          dialog(context, "Give/Request", "Give - you can give a product to the other users "
              "Request - you can request for a product from the other users");
        },
        child: Icon(Icons.help_outline),
        backgroundColor: Colors.deepOrange,
      ),
    );
  }
}
