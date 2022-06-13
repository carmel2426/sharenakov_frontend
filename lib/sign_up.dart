import 'package:carmel_project/login%20(2).dart';
import 'package:flutter/material.dart';
import 'server.dart';
import 'home_page.dart';
import 'dist.dart';

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
                height: 180,
              ),
              Container(
                  height: 220,
                  child: Column(
                    children: [
                      Container(
                        child: TextField(
                          // validator: (value),
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
                height: 80,
              ),
              SizedBox(
                width: 80,
                height: 40,
                child: ElevatedButton(
                  child: Text("Sign Up"),
                  onPressed: () async {
                    var user_exist2 = await user_exist4(nameController.text);
                    if (key.currentState!.validate() && user_exist2 != true) {
                      createData(nameController.text, passwordController.text, numberController.text, pos.lat, pos.long);
                      navigateToHomePage(context);
                      print("*************************************************");
                    }


                  },
                ),
              ),
              // SizedBox(
              //   height: 80,
              // ),
              // SizedBox(
              //     width: 80,
              //     height: 40,
              //     child: ElevatedButton(
              //         child: Text("Login"),
              //         onPressed: () {
              //           navigateToLoginPage(context);
              //         }))
            ],
          ),
        ),
      ),
    );
  }
}
