import 'package:flutter/material.dart';
import 'package:stock_scan_parser/Controller/api.dart';
import 'package:stock_scan_parser/Model/Products/product.dart';
import 'package:stock_scan_parser/View/DetailPage/detailscreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String red = 'red';
  Map<String, Color> abcd = {};
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: FutureBuilder<List<ProductModel>?>(
          future: apiServices(),
          // initialData: InitialData,
          builder: (BuildContext context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              final results = snapshot.data!;
              return ListView.builder(
                itemCount: results.length,
                itemBuilder: (BuildContext context, int index) {
                  final String clr = results[index].color.toString();
                  if (clr != red) {
                    abcd = {"color": Colors.green};
                  } else {
                    abcd = {"color": Colors.red};
                  }
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        ListTile(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (ctx) =>
                                    DetailScreen(productModel: results[index]),
                              ),
                            );
                          },
                          title: Text(
                            // ignore: avoid_dynamic_calls
                            results[index].name.toString(),
                            style: const TextStyle(color: Colors.white),
                          ),
                          subtitle: Text(
                            // ignore: avoid_dynamic_calls
                            results[index].tag.toString(),
                            style: TextStyle(color: abcd["color"]),
                          ),
                          leading: Icon(
                            Icons.circle,
                            color: Colors.grey.shade900,
                            size: 15,
                          ),
                        ),
                        const Text(
                          "...........................................................................................",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  );
                },
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
