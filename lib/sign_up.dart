import 'package:flutter/material.dart';

class signUp extends StatefulWidget {
  const signUp({Key? key}) : super(key: key);

  @override
  _signUpState createState() => _signUpState();
}
TextEditingController nameController = TextEditingController();
TextEditingController passwordController = TextEditingController();
class _signUpState extends State<signUp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
              title: Text(
                'Sign Up',
                style: TextStyle(fontSize: 46, color: Colors.orange),
              ),
              centerTitle: true,
              leading: IconButton(
                onPressed: () {

                },
                icon: Icon(Icons.arrow_forward),
              ),
              backgroundColor: Colors.blueAccent),
          body: Center(
            child: Column(
              children: [
                // Container(
                //     height: 180,
                //     child: Center(
                //         child: Text(
                //           "SignUp",
                //           style: TextStyle(fontSize: 80, color: Colors.pink),
                //         ))),

                Container(
                    child: Column(
                      children: [

                        Container(
                            decoration: BoxDecoration(color: Colors.lightBlue.withOpacity(0.2)),
                            child: TextField(
                              controller: nameController,
                              decoration: InputDecoration(
                                  fillColor: Colors.orange,
                                  hintText: "your nuckname",
                                  hintStyle: TextStyle(color: Colors.pinkAccent)),
                            )),


                        Container(
                            decoration: BoxDecoration(color: Colors.lightBlue.withOpacity(0.2)),
                            child: TextField( obscureText: true,
                              obscuringCharacter: '*',
                              controller: passwordController,
                              decoration: InputDecoration(hintText: "your passwors", hintStyle: TextStyle(color: Colors.pinkAccent)),
                            ))
                      ],
                    )),
                SizedBox(
                  width: 80,
                  height: 40,
                  child: RaisedButton(
                    color: Colors.pink,
                    child: Text("Login"),
                    elevation: 8,
                    onPressed: () {


                    },
                  ),
                )
              ],
            ),
          ),
        ));


  }
}
