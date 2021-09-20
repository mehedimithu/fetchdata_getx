import 'dart:math';
import 'package:http/http.dart' as http;
import '../model.dart';

class ApiService {
  static var client = http.Client();
  static Future<List<ProductModel>> fetchProducts() async {
    final response = await client.get(Uri.parse(
        'https://makeup-api.herokuapp.com/api/v1/products.json?brand=marienatie'));
    if (response.statusCode == 200) {
      print(response.body);
      var jsonString = response.body;
      return productModelFromJson(jsonString);
    } else {
      print(response.statusCode.toString());
    }
    throw Exception(e);
  }
}
