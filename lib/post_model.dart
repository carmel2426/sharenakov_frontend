<<<<<<< HEAD
=======
import 'package:carmel_project/product.dart';
>>>>>>> a32d4af89cc690373c19f97e7628c4ddc8a92760
import 'package:carmel_project/server.dart';
import 'package:flutter/material.dart';
import 'alert_dialog.dart';
class Product extends StatefulWidget {
<<<<<<< HEAD
  Product({Key? key, required this.product_text, required this.Nickname, required this.Description, required this.Id}) : super(key: key);
  String product_text;
  String Nickname;
  String Description;
  String Id;
=======
  Product({Key? key, required this.product_text, required this.Nickname}) : super(key: key);
  String product_text;
  String Nickname;
>>>>>>> a32d4af89cc690373c19f97e7628c4ddc8a92760
  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  bool vi = true;

  @override
  Widget build(BuildContext context) {
    return Visibility(visible: vi,
<<<<<<< HEAD
      child: Row(
=======
    child: Row(
>>>>>>> a32d4af89cc690373c19f97e7628c4ddc8a92760
        children: [
          Text(widget.product_text),
          IconButton(
              onPressed: () {
<<<<<<< HEAD
                declined_product(widget.Id);
=======
>>>>>>> a32d4af89cc690373c19f97e7628c4ddc8a92760
                vi = false;
                setState((){});
              },
              icon: Icon(Icons.highlight_remove)),
          IconButton(
            onPressed: () async{
              print("...........................................");
              print(widget.product_text.toString());
              var number = await get_Number(widget.Nickname);
              print("...........................................");
              print(widget.Nickname);
              dialog(context, "Number", number.toString());
<<<<<<< HEAD
              verified_product(widget.Nickname, widget.Description, widget.product_text);
              declined_product(widget.Id);
              vi = false;
              setState((){});
=======
              vi = false;
>>>>>>> a32d4af89cc690373c19f97e7628c4ddc8a92760
            },
            icon: Icon(Icons.check_circle_outline_rounded),
          ),
          IconButton(
            onPressed: () {
<<<<<<< HEAD
              dialog(context, "Description", widget.Description);
=======
              dialog(context, "Description", "2222222222");
>>>>>>> a32d4af89cc690373c19f97e7628c4ddc8a92760
            },
            icon: Icon(Icons.help_outline),
          )
        ],
      ),
    );
  }
}