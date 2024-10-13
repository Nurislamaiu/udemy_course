import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:udemy_project/offices.dart';

class WorkHttpJson extends StatefulWidget {
  const WorkHttpJson({super.key});

  @override
  State<WorkHttpJson> createState() => _WorkHttpJsonState();
}

class _WorkHttpJsonState extends State<WorkHttpJson> {
  late Future<OfficesList> officesList;

  @override
  void initState() {
    super.initState();
    officesList = getOfficesList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<OfficesList>(
      future: officesList,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
              itemCount: snapshot.data?.offices?.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text('${snapshot.data?.offices?[index].name}'),
                    subtitle: Text('${snapshot.data?.offices?[index].address}'),
                    leading: Image.network(
                        '${snapshot.data?.offices?[index].image}'),
                    isThreeLine: true,
                  ),
                );
              });
        } else if (snapshot.hasError) {
          return const Text('Error');
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
