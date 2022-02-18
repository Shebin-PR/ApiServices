import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:stock_scan_parser/Model/product/product.dart';

Future<Product> getApiServices() async {
  final _response = await http
      .get(Uri.parse("https://mobile-app-challenge.herokuapp.com/data"));
  // print(_response.body);
  // ignore: unnecessary_statements
  final _bodyAsJson = jsonDecode(_response.body) as Map<String, dynamic>; 
  // print("hhhhhhhhh");
  // print(_bodyAsJson);
  final _data = Product.fromJson(_bodyAsJson);
  return _data;
}
