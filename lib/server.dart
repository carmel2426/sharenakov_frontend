import 'package:carmel_project/product.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

var loginUri = "http://127.0.0.1:5000/login";


Future check_exist_database(String name, String password) async {
  final response = await Dio().get(loginUri);
}
var signupUri = "http://127.0.0.1:5000/signup";

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

String productUrl = "http://127.0.0.1:5000/product";

Future createProduct(String radius, String product, String description,
    String latitude, String longtitude) async {
  final response = await http.post(Uri.parse(productUrl), body: {
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

Future<List<ProductModel>> getProducts() async {
  final response = await Dio().get(productUrl);
  List<ProductModel> products = (response.data as List<dynamic>).map((e) => ProductModel.fromMap(e)).toList();
  return products;
}
