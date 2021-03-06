import 'dart:convert';

import 'package:flutter_challenge/projects/muebleria_app/models/product.dart';
import 'package:http/http.dart' as http;

// Fetch our Products from API
Future<List<Product>> fetchProducts() async {
  String apiUrl =
      "https://5f210aa9daa42f001666535e.mockapi.io/api/products";
  Uri apiUri = Uri.parse(apiUrl);

  final response = await http.get(apiUri);

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    List<Product> products = (json.decode(response.body) as List)
        .map((data) => Product.fromJson(data))
        .toList();
    // Return list of products
    return products;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load');
  }
}