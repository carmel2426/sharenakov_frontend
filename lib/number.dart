import 'package:carmel_project/alert_dialog.dart';
import 'package:flutter/material.dart';

class number extends StatelessWidget {
  number({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //
    return Scaffold(
        appBar: AppBar(
            title: Text(
              'Number',
              style: TextStyle(fontSize: 46, color: Colors.orange),
            ),
            backgroundColor: Colors.deepOrangeAccent),
        body: SizedBox(
          child: ElevatedButton(
            child: Text("number"),
            onPressed: () {
              dialog(context, "The Number", "555");
            },
          ),
        ));
  }
}
