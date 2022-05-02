import 'package:flutter/material.dart';
import 'package:latlng/latlng.dart';
import 'package:objectid/objectid.dart';

class Product extends StatelessWidget {
  final ProductModel product;

  const Product({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 8,
        ),
        Text(product.name),
        SizedBox(
          width: 4,
        ),
        Text(product.radius + " km"),
        SizedBox(
          width: 4,
        ),
        IconButton(onPressed: () {}, icon: Icon(Icons.highlight_remove)),
        SizedBox(
          width: 4,
        ),
        IconButton(
          onPressed: () {

          },
          icon: Icon(Icons.check_circle_outline_rounded),
        )
      ],
    );
  }
}


class ProductModel {
  final LatLng location;
  final ObjectId id;
  final String description;
  final String name;
  final String radius;

//<editor-fold desc="Data Methods">

  const ProductModel({
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
          location == other.location &&
          id == other.id &&
          description == other.description &&
          name == other.name &&
          radius == other.radius);

  @override
  int get hashCode =>
      location.hashCode ^
      id.hashCode ^
      description.hashCode ^
      name.hashCode ^
      radius.hashCode;

  @override
  String toString() {
    return 'ProductModel{' +
        ' location: $location,' +
        ' id: $id,' +
        ' description: $description,' +
        ' name: $name,' +
        ' radius: $radius,' +
        '}';
  }

  ProductModel copyWith({
    LatLng? location,
    ObjectId? id,
    String? description,
    String? name,
    String? radius,
  }) {
    return ProductModel(
      location: location ?? this.location,
      id: id ?? this.id,
      description: description ?? this.description,
      name: name ?? this.name,
      radius: radius ?? this.radius,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'loc': [location.latitude, location.longitude],
      '_id': this.id.hexString,
      'description': this.description,
      'product': this.name,
      'radius': this.radius,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      location: LatLng(map['loc']['coordinates'][0], map['loc']['coordinates'][1]),
      id: ObjectId.fromHexString(map['_id']),
      description: map['description'] as String,
      name: map['product'] as String,
      radius: map['radius'] as String,
    );
  }

//</editor-fold>
}