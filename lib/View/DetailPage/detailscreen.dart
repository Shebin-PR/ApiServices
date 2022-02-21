import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  final index;
  DetailScreen({Key? key, required this.index}) : super(key: key);

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
              children: [
                ListTile(
                  tileColor: Colors.lightBlue[800],
                  title: Text(
                    // ignore: avoid_dynamic_calls
                    widget.index.name.toString(),
                    style: const TextStyle(color: Colors.white),
                  ),
                  subtitle: Text(
                    // ignore: avoid_dynamic_calls
                    widget.index.tag.toString(),
                    style: const TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
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
