import 'package:flutter/material.dart';
import 'server.dart';
import 'home_page.dart';
import 'dist.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  LocationService pos = LocationService();

  Future navigateToLoginPage(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    //
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'Login',
            style: TextStyle(fontSize: 46, color: Colors.orange),
          ),
          backgroundColor: Colors.deepOrangeAccent),
      body: Center(
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
                  child: TextField(
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
              height: 38,
            ),
            SizedBox(
              width: 80,
              height: 40,
              child: ElevatedButton(
                child: Text("Login"),
                onPressed: () {
                  navigateToLoginPage(context);
                  createData(nameController.text, passwordController.text, "555");
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
