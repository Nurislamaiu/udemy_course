import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WordHttp extends StatefulWidget {
  const WordHttp({super.key});

  @override
  State<WordHttp> createState() => _WordHttpState();
}

class _WordHttpState extends State<WordHttp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }
}

Future<http.Response> getData() async {
  const url = "https://about.google/static/data/locations.json";
  return await http.get(Uri.parse(url));
}

void loadData() {
  getData().then((response) {
    if (response.statusCode == 200) {
      print(response.body);
    } else {
      print(response.statusCode);
    }
  }).catchError((error) {
    debugPrint(error.toString());
  });
}
