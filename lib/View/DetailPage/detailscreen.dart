import 'package:flutter/material.dart';
import 'package:stock_scan_parser/Model/Products/product.dart';

class DetailScreen extends StatefulWidget {
  final ProductModel productModel;
  DetailScreen({Key? key, required this.productModel}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  tileColor: Colors.lightBlue[800],
                  title: Text(
                    // ignore: avoid_dynamic_calls
                    widget.productModel.name.toString(),
                    style: const TextStyle(color: Colors.white),
                  ),
                  subtitle: Text(
                    // ignore: avoid_dynamic_calls
                    widget.productModel.tag.toString(),
                    style: const TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  widget.productModel.criteria!.first.text.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    // fontWeight: FontWeight.bold,
                    fontSize: 18,
                    letterSpacing: 0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
