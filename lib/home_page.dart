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
            'Login',
            style: TextStyle(fontSize: 46, color: Colors.orangeAccent),
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
          ),
          backgroundColor: Colors.deepOrange),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center,children: [
        // Container(
        //     height: 180,
        //     child: Center(
        //         child: Text(
        //       "",
        //       style: TextStyle(fontSize: 80, color: Colors.green),
        //     ))),
        Container(
            child: Column(children: [
          Container(
              decoration: BoxDecoration(color: Colors.lightBlue.withOpacity(0.2)),
              child: ElevatedButton(
                child: Text("Give a product"),
                onPressed: () async {
                  //navigate to give a product
                  Navigator.push(context, MaterialPageRoute(builder: (context) => give_a_product()));
                  await pos.checkGps();
                  // getProducts();

                },
              )),
          SizedBox(
            height: 28,
          ),
          Container(
              decoration: BoxDecoration(color: Colors.lightBlue.withOpacity(0.2)),
              child: ElevatedButton(
                child: Text(" get a Product"),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => get_a_product()));
                  pos.checkGps();
                },
              )),
              SizedBox(height: 388,)
        ]))
      ])),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          dialog(context, "Give", "You can give a product");
        },
        child: Icon(Icons.help_outline),
        backgroundColor: Colors.deepOrange,
      ),
    );
  }
}
