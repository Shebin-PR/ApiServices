import 'package:flutter/material.dart';
import 'package:stock_scan_parser/Controller/api_services.dart';

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
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text("HomeScreen"),
          centerTitle: true,
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () async {
              final result = await getApiServices();
              print(result.name);
            },
            child: const Text("Press here"),
          ),
        ),
      ),
    );
  }
}
