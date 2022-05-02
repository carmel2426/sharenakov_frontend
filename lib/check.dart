import 'package:flutter/material.dart';

class Check extends StatefulWidget {
  const Check({Key? key}) : super(key: key);

  @override
  _CheckState createState() => _CheckState();
}
class _CheckState extends State<Check> {

  @override

  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
                title: Text(
                  'Login',
                  style: TextStyle(fontSize: 46, color: Colors.orange),


                ),
                centerTitle: true,
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back),

                ),





                backgroundColor: Colors.green),
            body: Center(
                child: Column(children: [
                  Container(
                      height: 180,
                      child: Center(
                          child: Text(
                            "Give",
                            style: TextStyle(fontSize: 80, color: Colors.green),


                          ))),
                  Container(
                      child: Column(children: [
                        Container(
                            decoration: BoxDecoration(color: Colors.lightBlue.withOpacity(0.2)),
                            child: RaisedButton(child: Text("hiii"),onPressed: (){

                            },
                            )),
                        Container(
                            decoration: BoxDecoration(color: Colors.lightBlue.withOpacity(0.2)),
                            child: RaisedButton(onPressed: (){
                              Navigator.pop(context);
                            },))




                      ]))

                ]))));
  }
}
