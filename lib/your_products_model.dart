import 'package:carmel_project/product.dart';
import 'package:carmel_project/server.dart';
import 'package:flutter/material.dart';
import 'alert_dialog.dart';
import 'server.dart';
class user_product extends StatefulWidget {
  user_product({Key? key, required this.product_text, required this.Id, required this.name}) : super(key: key);
  String product_text;
  String Id;
  String name;
  @override
  State<user_product> createState() => _user_productState();
}

class _user_productState extends State<user_product> {
  bool vi = true;
  @override
  Widget build(BuildContext context) {
    return Visibility(visible: vi,
      child: Row(
        children: [
          Text(widget.product_text),
          SizedBox(height: 38,),
          IconButton(
            onPressed: () async{
              var number = await get_Number(widget.name.toString());
              dialog(context, "Number", number.toString());
              delete_db_show_product(widget.Id);
              // verified_product(widget.Nickname, widget.Description, widget.product_text);
              // declined_product(widget.Id);
            },
            icon: Icon(Icons.check_circle_outline_rounded),
          ),


        ],
      ),
    );
  }
}