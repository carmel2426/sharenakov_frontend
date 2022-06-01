import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'get_a_product.dart';
import 'give_a_product.dart';
import 'server.dart';
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
          centerTitle: true,
          backgroundColor: Colors.deepOrange),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center,children: [

        Container(
            child: Column(children: [
          Container(
              decoration: BoxDecoration(color: Colors.lightBlue.withOpacity(0.2)),
              child: ElevatedButton(
                child: Text("Give a product"),
                onPressed: () async {
                  //navigate to give a product
                  Navigator.push(context, MaterialPageRoute(builder: (context) => GiveProduct()));
                  await pos.checkGps();
                  getProducts("32.2222", "32.2222");

                },
              )),
          SizedBox(
            height: 28,
          ),
          Container(
              decoration: BoxDecoration(color: Colors.lightBlue.withOpacity(0.2)),
              child: ElevatedButton(
                child: Text(" get a Product"),
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
          dialog(context, "Give/Get", "Give - you can give a product to the other users "
              "Get - you can ask for a product from the other users");
        },
        child: Icon(Icons.help_outline),
        backgroundColor: Colors.deepOrange,
      ),
    );
  }
}
