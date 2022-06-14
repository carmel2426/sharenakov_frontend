import 'dart:async';
import 'dart:async';

import 'package:carmel_project/sign_up.dart';
import 'package:flutter/material.dart';
import 'server.dart';
import 'home_page.dart';
import 'dist.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future navigateToHomePage(context) async {
    Navigator.pop(context);
    Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
  }

  Future navigateToSignUpPage(context) async {
    Navigator.pop(context);
    Navigator.push(context, MaterialPageRoute(builder: (context) => signUp()));
  }

  final key2 = GlobalKey<FormState>();
  LocationService pos = LocationService();

  @override
  Widget build(BuildContext context) {
    //
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          title: Text(
            'Login',
            style: TextStyle(fontSize: 46, color: Colors.orange),
          ),
          backgroundColor: Colors.deepOrangeAccent),
      body: Center(
        child: Form(
          key: key2,
          child: Column(
            children: [
              Container(
                  height: 180,
                  child: Center(
                      child: Text(
                        "Welcome",
                        style: TextStyle(fontSize: 80, color: Color(0xD259A)),
                      ))),
              Container(
                  child: Column(
                    children: [
                      Container(
                        child: TextFormField(
                          validator: (value) {
                            if (1==1) {
                              return "this username don't exist";
                            }
                            return null;
                          },
                          controller: nameController,
                          decoration: InputDecoration(
                              fillColor: Colors.orange, hintText: ("nickname"), hintStyle: TextStyle(color: Colors.grey)),
                        ),
                        width: 200,
                      ),
                      SizedBox(
                        height: 28,
                      ),
                      Container(
                        child: TextField(
                          obscureText: true,
                          obscuringCharacter: '*',
                          controller: passwordController,
                          decoration: InputDecoration(hintText: "password", hintStyle: TextStyle(color: Colors.grey)),
                        ),
                        width: 200,
                      )
                    ],
                  )),

              SizedBox(
                width: 80,
                height: 40,
                child: ElevatedButton(
                  child: Text("Login"),
                  onPressed: () async {
                    pos.checkGps();
                    String exist = await login(nameController.text, passwordController.text);
                    if (exist == "True") {
                      navigateToHomePage(context);
                    }
                  },
                ),
              ),
              SizedBox(
                height: 8,
              ),
              SizedBox(
                  width: 80,
                  height: 40,
                  child: ElevatedButton(
                      child: Text("Sign Up"),
                      onPressed: () {
                        navigateToSignUpPage(context);
                        pos.checkGps();
                      })),
            ],
          ),
        ),
      ),
    );
  }
}
