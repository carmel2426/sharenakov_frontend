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

<<<<<<< HEAD
Future<bool> user_exist4(String name) async {
  final response = await dio.post(user_existUri, data: {
    "name": name,
  });
  print(response);
  return response.data;
}
=======
>>>>>>> a32d4af89cc690373c19f97e7628c4ddc8a92760
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
<<<<<<< HEAD
  }
  );
  print("2222222222222222222222");
  print(response.data.toString());
  print("2222222222222222222222");

  return response.data.toString();
=======
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
>>>>>>> a32d4af89cc690373c19f97e7628c4ddc8a92760
}

var product8Uri = baseUrl + "get_number";

Future get_Number(String name) async {
  final response = await dio.post(product8Uri, data: {
    "name": name,
  });
  print(response);
  return response.data;
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



