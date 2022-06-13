import 'package:carmel_project/server.dart';
import 'package:flutter/material.dart';
import 'alert_dialog.dart';
class Product extends StatefulWidget {
  Product({Key? key, required this.product_text, required this.Nickname, required this.Description, required this.Id}) : super(key: key);
  String product_text;
  String Nickname;
  String Description;
  String Id;
  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  bool vi = true;

  @override
  Widget build(BuildContext context) {
    return Visibility(visible: vi,
      child: Row(
        children: [
          Text(widget.product_text),
          IconButton(
              onPressed: () {
                declined_product(widget.Id);
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
              verified_product(widget.Nickname, widget.Description, widget.product_text);
              declined_product(widget.Id);
              vi = false;
              setState((){});
            },
            icon: Icon(Icons.check_circle_outline_rounded),
          ),
          IconButton(
            onPressed: () {
              dialog(context, "Description", widget.Description);
            },
            icon: Icon(Icons.help_outline),
          )
        ],
      ),
    );
  }
}