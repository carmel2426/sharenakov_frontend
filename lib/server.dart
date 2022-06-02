import 'package:carmel_project/product.dart';
import 'package:dio/dio.dart';
Dio dio = Dio();
String baseUrl = "https://vm120.hisham.ru/";

var loginUri = baseUrl + "login";

Future<String> login(String name, String password) async {
  final response = await dio.post(loginUri, data: {
    "name": name,
    "password": password,
  });
  print(response);
  return response.data;
}

var signupUri = baseUrl + "signUp";

Future createData(String name, String password, String number, String latitude, String longtitude) async {
  final response = await dio.post(signupUri, data: {
    "name": name,
    "password": password,
    "number": number,
    'latitude': latitude,
    'longtitude': longtitude
  });
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

Future<String> getProducts() async {
  print("1111111111111111111111111");
  final response = await Dio().get(productUrl2, queryParameters: {
  });

  return response.data.toString();
}

var product8Uri = baseUrl + "get_number";

Future get_Number(String name) async {
  final response = await dio.post(product8Uri, data: {
    "name": name,
  });
  print(response);
  return response.data;
}
