import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:stock_scan_parser/Model/product/product.dart';

Future<List<Product>> apiServices() async {
  final _response = await http
      .get(Uri.parse("https://mobile-app-challenge.herokuapp.com/data"));
  // print(_response.statusCode);
  final bodyy = jsonDecode(_response.body);
  var result = bodyy as List;
  print("yyyyyyyyyyyyyyyy");

  final a =
      result.map((e) => Product.fromJson(e as Map<String, dynamic>)).toList();
  return a;
}
