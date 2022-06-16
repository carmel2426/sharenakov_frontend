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
var user_existUri = baseUrl + "user_exist";

Future<bool> user_exist4(String name) async {
  final response = await dio.post(user_existUri, data: {
    "name": name,
  });
  print(response);
  return response.data;
}

String get_productUri = baseUrl + "get_product";

Future createProduct(String radius, String product, String description, String latitude, String longtitude) async {
  final response = await dio.post(get_productUri, data: {
    'radius': radius,
    'product': product,
    'description': description,
    'latitude': latitude,
    'longtitude': longtitude
  });
  print(response.data);
  return response.data;
}

String give_prdocutUri = baseUrl + "give_product";

Future<String> getProducts() async {
  final response = await Dio().get(give_prdocutUri, queryParameters: {
  }

  );
  return response.data.toString();
}

var get_numberUri = baseUrl + "get_number";

Future get_Number(String name) async {
  final response = await dio.post(get_numberUri, data: {
    "name": name,
  });
  print(response);
  return response.data;
}

var user_products_uri = baseUrl + "user_products";

Future<String> user_products2() async {
  final response = await Dio().get(user_products_uri, queryParameters: {
  }
  );
  return response.data.toString();
}

var verified_product_uri = baseUrl + "verified_product";
Future verified_product(String nickname, String description, String product_text) async {
  final response = await dio.post(verified_product_uri, data: {
    "name": nickname,
    "description": description,
    "product_text": product_text
  });
  print(response.data);
  return response.data;
}

var declined_product_uri = baseUrl + "declined_product";

Future declined_product(String Id) async {
  final response = await dio.post(declined_product_uri, data: {
    "Id": Id,
  });
  print(response.data);
  return response.data;
}

var delete_db_show_product_uri = baseUrl + "delete_db_show_product";

Future delete_db_show_product(String Id) async {
  final response = await dio.post(delete_db_show_product_uri, data: {
    "Id": Id,
  });
  print(response.data);
  return response.data;
}




