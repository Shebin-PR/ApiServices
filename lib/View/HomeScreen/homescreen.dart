import 'package:flutter/material.dart';
import 'package:stock_scan_parser/Controller/api.dart';

import 'package:stock_scan_parser/View/DetailPage/detailscreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: FutureBuilder(
          future: apiServices(),
          // initialData: InitialData,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              final results = snapshot.data as List;
              return ListView.builder(
                itemCount: results.length,
                itemBuilder: (BuildContext context, int index) {
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
                                    DetailScreen(index: results[index]),
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
                            style: const TextStyle(color: Colors.green),
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
