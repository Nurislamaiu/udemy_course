import 'package:flutter/material.dart';

class MyListView extends StatelessWidget {
  const MyListView({super.key});

  @override
  Widget build(BuildContext context) {
    return _DinamycListView();
  }
}

Widget _StatListView() {
  return ListView(
    padding: EdgeInsets.all(8.0),
    children: [
      ListTile(
        title: Text('Sun'),
        subtitle: Text('Today Clear'),
        leading: Icon(Icons.wb_sunny),
        trailing: Icon(Icons.keyboard_arrow_right),
      ),
      ListTile(
        title: Text('Cloudy'),
        subtitle: Text('Today Cloudy'),
        leading: Icon(Icons.wb_cloudy),
        trailing: Icon(Icons.keyboard_arrow_right),
      ),
      ListTile(
        title: Text('Snow'),
        subtitle: Text('Today Snow'),
        leading: Icon(Icons.snowing),
        trailing: Icon(Icons.keyboard_arrow_right),
      ),
    ],
  );
}

Widget _DinamycListView() {
  final List<ListItem> items = List<ListItem>.generate(
      1000,
          (i) => i % 6 == 0
          ? HeadingItem('Heading $i')
          : MessageItem('Sender $i', 'Message body $i'));
  return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        if(item is HeadingItem){
          return ListTile(
            title: Text(item.heading, style: Theme.of(context).textTheme.headlineLarge),
          );
        }else if(item is MessageItem){
          return ListTile(
            title: Text(item.sender),
            subtitle: Text(item.body),
            leading: const Icon(Icons.insert_photo, color: Colors.red),
            trailing: const Icon(Icons.keyboard_arrow_right),
          );
        }
        return null;
        // return Card(
        //   child: ListTile(
        //     title: Text('${items[index]}'),
        //   ),
        // );
      });
}


abstract class ListItem {}

class HeadingItem implements ListItem {
  final String heading;

  HeadingItem(this.heading);
}

class MessageItem implements ListItem {
  final String sender;
  final String body;

  MessageItem(this.sender, this.body);
}
