import 'package:carmel_project/product.dart';
import 'package:flutter/material.dart';
import 'alert_dialog.dart';
class Product extends StatelessWidget {
  Product({Key? key, required this.product_text}) : super(key: key);
  String product_text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(product_text),
        IconButton(
            onPressed: () {
              // vi = false;
            },
            icon: Icon(Icons.highlight_remove)),
        IconButton(
          onPressed: () {
            // var number = await get_Number(widget.product.nickname);
            // dialog(context, "Number", number.toString());
            // vi = false;
          },
          icon: Icon(Icons.check_circle_outline_rounded),
        ),
        IconButton(
          onPressed: () {
            // dialog(context, "Description", widget.product.description);
          },
          icon: Icon(Icons.help_outline),
        )
      ],
    );
  }


}