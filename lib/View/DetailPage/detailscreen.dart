import 'package:flutter/material.dart';
import 'package:stock_scan_parser/Model/Products/product.dart';

class DetailScreen extends StatefulWidget {
  final ProductModel productModel;
  const DetailScreen({Key? key, required this.productModel}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  String red = 'red';
  Map<String, Color> abcd = {};
  @override
  Widget build(BuildContext context) {
    final String clr = widget.productModel.color.toString();
    if (clr != red) {
      abcd = {"color": Colors.green};
    } else {
      abcd = {"color": Colors.red};
    }
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            shrinkWrap: true,
            // crossAxisAlignment: CrossAxisAlignment.start,
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
                  style: TextStyle(
                    color: abcd["color"],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  height: 200,
                  child: ListView.builder(
                    itemCount: widget.productModel.criteria!.length,
                    itemBuilder: (BuildContext context, int index) {
                      final crt = widget.productModel.criteria;
                      return ListView(
                        shrinkWrap: true,
                        children: [
                          Text(
                            crt![index].text.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              // fontWeight: FontWeight.bold,
                              fontSize: 18,
                              letterSpacing: 0,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            "and",
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
