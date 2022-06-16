import 'package:carmel_project/login.dart';
import 'package:flutter/material.dart';
import 'server.dart';
import 'home_page.dart';
import 'dist.dart';
import 'package:location/location.dart';
class signUp extends StatefulWidget {
  const signUp({Key? key}) : super(key: key);

  @override
  _signUpState createState() => _signUpState();
}

Future navigateToHomePage(context) async {
  Navigator.pop(context);
  Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
}

Future navigateToLoginPage(context) async {
  Navigator.pop(context);
  Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
}

class _signUpState extends State<signUp> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  TextEditingController numberController = TextEditingController();
  final key = GlobalKey<FormState>();
  LocationService pos = LocationService();

  @override
  Widget build(BuildContext context) {
    //
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
            title: Text(
              'Sign Up',
              style: TextStyle(fontSize: 46, color: Colors.orange),
            ),
            backgroundColor: Colors.deepOrangeAccent),
        body: Center(
            child: Form(
          key: key,
          child: Column(
            children: [
              SizedBox(
                height: 110,
              ),
              Container(
                  height: 220,
                  child: Column(
                    children: [
                      Container(
                        child: TextFormField(
                          validator: (value) {
                            if (value!.length == 0) {
                              return "your nickname field is empty!"; //print something
                            }
                            return null;
                          },
                          controller: nameController,
                          decoration: InputDecoration(
                              fillColor: Colors.orange,
                              hintText: ("nickname"),
                              hintStyle: TextStyle(color: Colors.grey)),
                        ),
                        width: 200,
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      Container(
                        child: TextFormField(
                          validator: (value) {
                            if (value!.length < 8 || value.length > 18) {
                              return "password must be between 8 -18";
                            }
                            if (2 != 8) {
                              final regExp = RegExp('[A-Z]');
                              final upperCase = regExp.hasMatch(value);
                              if (upperCase == false) {
                                return "password must have uppercase";
                              }
                            }
                            if (2 != 8) {
                              final regExp = RegExp('[a-z]');
                              final lowerCase = regExp.hasMatch(value);
                              if (lowerCase == false) {
                                return "password must have lowercase";
                              }
                            }
                            return null;
                          },
                          obscureText: true,
                          obscuringCharacter: '*',
                          controller: passwordController,
                          decoration: InputDecoration(hintText: "password", hintStyle: TextStyle(color: Colors.grey)),
                        ),
                        width: 200,
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      Container(
                        child: TextFormField(
                          validator: (value) {
                            if (int.tryParse(value!) == null) {
                              return "the number must be digits";
                            }
                            if (value.length != 10) {
                              return "the number must be 10 digits";
                            }
                            return null;
                          },
                          controller: numberController,
                          decoration: InputDecoration(hintText: "number", hintStyle: TextStyle(color: Colors.grey)),
                        ),
                        width: 200,
                      )
                    ],
                  )),
              SizedBox(
                height: 0,
              ),
              SizedBox(
                width: 120,
                height: 40,
                child: ElevatedButton(
                    child: Text("Sign Up"),
                    onPressed: () async {
                      // if ( await pos.getLocationPermission() == null) {
                      //   var location = await Location().requestService();
                      //   if(location) {
                          // pos.checkGps();
                          var user_exist = await user_exist4(nameController.text);
                          if (key.currentState!.validate() && user_exist != true) {
                            createData(
                                nameController.text, passwordController.text, numberController.text, pos.lat, pos.long);
                            navigateToHomePage(context);
                            // }
                          // }
                        }

                        }
                      // }
                    ),
              ),
              SizedBox(
                height: 8,
              ),
              SizedBox(
                  width: 120,
                  height: 40,
                  child: ElevatedButton(
                      child: Text("Back to Login"),
                      onPressed: () async {
                        navigateToLoginPage(context);
                      })),
            ],
          ),
        )));
  }
}
