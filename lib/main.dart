import 'package:flutter/material.dart';
import 'package:udemy_project/ListView.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Weather',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu),
          ),
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.settings))],
        ),
        body: MyListView(),
      ),
    );
  }
}

Widget _buildBody() {
  return SingleChildScrollView(
    child: Column(
      children: [
        _headerImage(),
        SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _weatherDescription(),
                const Divider(),
                _temperature(),
                const Divider(),
                _temperatureForecast(),
                const Divider(),
                _footerRatings(),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Image _headerImage() {
  return const Image(
      image: NetworkImage(
          'https://avatars.mds.yandex.net/i?id=e4a3e5a32ff8f2289082c04f1db90eec_l-5293988-images-thumbs&n=13'),
      fit: BoxFit.cover);
}

Column _weatherDescription() {
  return const Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(
        'Tuesday - May 22',
        style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
      ),
      Divider(),
      Text(
        '##################################################################',
        style: TextStyle(color: Colors.black),
      )
    ],
  );
}

Row _temperature() {
  return const Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Column(
        children: [
          Icon(Icons.sunny, color: Colors.yellow),
        ],
      ),
      SizedBox(width: 16.0),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                '15C',
                style: TextStyle(color: Colors.deepPurple),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                'Kazakhstan, Astana',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ],
      )
    ],
  );
}

Widget _temperatureForecast() {
  return Wrap(
    spacing: 10.0,
    children: List.generate(8, (int index) {
      return Chip(
        label: Text(
          '${index + 20}°C',
          style: const TextStyle(fontSize: 15.0),
        ),
        avatar: const Icon(Icons.wb_cloudy, color: Colors.blue),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
          side: const BorderSide(color: Colors.grey),
        ),
        backgroundColor: Colors.grey.shade300,
      );
    }),
  );
}

Row _footerRatings(){
  var stars = Row(
    children: [
      Icon(Icons.star, size: 15.0, color: Colors.yellow.shade600),
      Icon(Icons.star, size: 15.0, color: Colors.yellow.shade600),
      Icon(Icons.star, size: 15.0, color: Colors.yellow.shade600),
      Icon(Icons.star, size: 15.0, color: Colors.yellow.shade600),
      Icon(Icons.star, size: 15.0, color: Colors.yellow.shade600),
    ],
  );
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      const Text('##################' , style: TextStyle(fontSize: 15.0)),
      stars
    ],
  );
}
