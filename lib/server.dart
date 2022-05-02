import 'dart:convert';

import 'package:carmel_project/product.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

var loginUri = "http://10.0.2.2:5000/login";

Dio dio = Dio();

Future login(String name, String password) async {
  final response = await dio.post(loginUri, data: jsonEncode({
    "name": name,
    "password": password,
  }));
  print(response);
  return response.data;
}

var signupUri = "http://10.0.2.2:5000/signup";

Future createData(String name, String password) async {
  final response = await http
      .post(Uri.parse(signupUri), body: {'name': name, 'password': password});
  try {
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  } catch (e) {}
}

String productUrl = "http://10.0.2.2:5000/product";

Future createProduct(String radius, String product, String description,
    String latitude, String longtitude) async {
  final response = await dio.post(productUrl, data: {
    'radius': radius,
    'product': product,
    'description': description,
    'latitude': latitude,
    'longtitude': longtitude
  });
  try {
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  } catch (e) {}
  print(response);
}

Future<List<ProductModel>> getProducts(String latitude, String longitude) async {
  final response = await Dio().get(productUrl + "?latitude=$latitude&longitude=$longitude");
  List<ProductModel> products = (response.data as List<dynamic>)
      .map((e) => ProductModel.fromMap(e))
      .toList();
  return products;
}
