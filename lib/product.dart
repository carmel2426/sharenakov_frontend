import 'package:flutter/material.dart';
import 'package:latlng/latlng.dart';
import 'package:objectid/objectid.dart';
import 'number.dart';
import 'server.dart';
import 'alert_dialog.dart';

bool vi = true;

Future navigateToNumberPage(context) async {
  Navigator.push(context, MaterialPageRoute(builder: (context) => number()));
}

class Product extends StatefulWidget {
  final ProductModel product;

  const Product({Key? key, required this.product}) : super(key: key);

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: vi,
      child: Row(
        children: [
          SizedBox(
            width: 8,
          ),
          Text(widget.product.nickname),
          SizedBox(
            width: 8,
          ),
          Text(widget.product.name),
          SizedBox(
            width: 4,
          ),
          Text(widget.product.radius + " km"),
          SizedBox(
            width: 4,
          ),
          IconButton(
              onPressed: () {
                vi = false;
                setState(() {});
              },
              icon: Icon(Icons.highlight_remove)),
          SizedBox(
            width: 4,
          ),
          IconButton(
            onPressed: () async{
              var number = await get_Number(widget.product.nickname);
              print(number.runtimeType);
              print(number.toString());
              dialog(context, "Number", number.toString());
              vi = false;
              setState(() {});
            },
            icon: Icon(Icons.check_circle_outline_rounded),
          )
        ],
      ),
    );
  }
}

class ProductModel {
  final String nickname;
  final LatLng location;
  final ObjectId id;
  final String description;
  final String name;
  final String radius;

//<editor-fold desc="Data Methods">

  const ProductModel({
    required this.nickname,
    required this.location,
    required this.id,
    required this.description,
    required this.name,
    required this.radius,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductModel &&
          runtimeType == other.runtimeType &&
          nickname == other.runtimeType &&
          location == other.location &&
          id == other.id &&
          description == other.description &&
          name == other.name &&
          radius == other.radius);

  @override
  int get hashCode => nickname.hashCode ^ location.hashCode ^ id.hashCode ^ description.hashCode ^ name.hashCode ^ radius.hashCode;

  @override
  String toString() {
    return 'ProductModel{' +
        ' nickname: $nickname,' +
        ' location: $location,' +
        ' id: $id,' +
        ' description: $description,' +
        ' name: $name,' +
        ' radius: $radius,' +
        '}';
  }

  ProductModel copyWith({
    String? nickname,
    LatLng? location,
    ObjectId? id,
    String? description,
    String? name,
    String? radius,
  }) {
    return ProductModel(
      nickname: nickname ?? this.nickname,
      location: location ?? this.location,
      id: id ?? this.id,
      description: description ?? this.description,
      name: name ?? this.name,
      radius: radius ?? this.radius,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'nickname': this.nickname,
      'loc': [location.latitude, location.longitude],
      '_id': this.id.hexString,
      'description': this.description,
      'product': this.name,
      'radius': this.radius,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      nickname: map['name'] as String,
      location: LatLng(map['loc']['coordinates'][0], map['loc']['coordinates'][1]),
      id: ObjectId.fromHexString(map['_id']),
      description: map['description'] as String,
      name: map['product'] as String,
      radius: map['radius'] as String,
    );
  }

//</editor-fold>
}
