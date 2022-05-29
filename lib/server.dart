import 'dart:convert';

import 'package:carmel_project/post_model.dart';
import 'package:carmel_project/product.dart';
import 'package:dio/dio.dart';

// import 'package:http/http.dart' as http;
// import 'package:http/http.dart';
String baseUrl = "https://vm120.hisham.ru/";

var loginUri = baseUrl + "login";

Dio dio = Dio();

Future<String> login(String name, String password) async {
  final response = await dio.post(loginUri, data: {
    "name": name,
    "password": password,
  });
  print(response);
  return response.data;
}

var signupUri = baseUrl + "signUp";

Future createData(String name, String password, String number) async {
  final response = await dio.post(signupUri, data: {"name": name, "password": password, "number": number});
  print(response);
  return response.data;
}

String productUrl = baseUrl + "get_product";

Future createProduct(String radius, String product, String description, String latitude, String longtitude) async {
  final response = await dio.post(productUrl, data: {
    'radius': radius,
    'product': product,
    'description': description,
    'latitude': latitude,
    'longtitude': longtitude
  });

  return response.data;
}

String productUrl2 = baseUrl + "give_product";

Future<List<ProductModel>> getProducts(String latitude, String longitude) async {
  final response = await Dio().get(productUrl2, queryParameters: {
    "latitude": latitude,
    "longtitude": longitude
  });
  List<ProductModel> products = (response.data as List<dynamic>).map((e) => ProductModel.fromMap(e)).toList();
  print(products);
  return products;
}

var product8Uri = baseUrl + "get_number";

Future get_Number(String name) async {
  final response = await dio.post(product8Uri, data: {
    "name": name,
  });
  print(response);
  return response.data;
}
