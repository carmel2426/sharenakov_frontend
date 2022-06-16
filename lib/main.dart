import 'package:carmel_project/user_products.dart';
import 'package:flutter/material.dart';
import 'login.dart';
import 'light_theme.dart';
void main() {
  runApp(ShareNakov());
}
class ShareNakov extends StatefulWidget {
  @override
  State<ShareNakov> createState() => _ShareNakovState();
}

class _ShareNakovState extends State<ShareNakov> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: lightTheme,home: Login());
  }
}
