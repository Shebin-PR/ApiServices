import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:stock_scan_parser/Model/Products/product.dart';

Future<List<ProductModel>> apiServices() async {
  final _response = await http
      .get(Uri.parse("https://mobile-app-challenge.herokuapp.com/data"));
  // print(_response.statusCode);
  final bodyy = jsonDecode(_response.body);
  final result = bodyy as List;

  final a =
      result.map((e) => ProductModel.fromJson(e as Map<String, dynamic>)).toList();
  return a;
}
