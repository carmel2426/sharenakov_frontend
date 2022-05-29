import 'package:flutter/material.dart';
import 'server.dart';
import 'home_page.dart';

class signUp extends StatefulWidget {
  const signUp({Key? key}) : super(key: key);

  @override
  _signUpState createState() => _signUpState();
}

Future navigateToHomePage(context) async {
  Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
}

class _signUpState extends State<signUp> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  final key = GlobalKey<FormState>();

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
                  height: 180,
                  child: Column(
                    children: [
                      Container(
                        child: TextField(
                          controller: nameController,
                          decoration: InputDecoration(
                              fillColor: Colors.orange,
                              hintText: ("nickname"),
                              hintStyle: TextStyle(color: Colors.grey)),
                        ),
                        width: 200,
                      ),
                      SizedBox(
                        height: 28,
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
                        height: 38,
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
                height: 40,
              ),
              SizedBox(
                width: 80,
                height: 40,
                child: ElevatedButton(
                  child: Text("Sign Up"),
                  onPressed: () {
                    if (key.currentState!.validate()) {
                      print(nameController.text);
                      print(passwordController.text);
                      print(numberController.text);
                      createData(nameController.text, passwordController.text, numberController.text);
                      navigateToHomePage(context);
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
