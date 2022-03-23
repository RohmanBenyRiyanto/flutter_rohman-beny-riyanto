import 'package:flutter/material.dart';
import 'package:ptaktikum_section_14/task2.dart';
import 'package:scroll_app_bar/scroll_app_bar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ListViewPage extends StatefulWidget {
  const ListViewPage({Key? key}) : super(key: key);

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  @override
  Widget build(BuildContext context) {
    final controller = ScrollController();

    var apiUrl = Uri.parse('https://reqres.in/api/users?per_page=20');

    Future<List<dynamic>> _fecthDataUsers() async {
      var result = await http.get(apiUrl);
      return json.decode(result.body)['data'];
    }

    return Scaffold(
      appBar: ScrollAppBar(
        controller: controller, // Note the controller here
        title: const Text(
          "Reqres.in API Listview",
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const GridViewPage()));
        },
        child: const Icon(Icons.arrow_forward_ios_rounded),
        tooltip: 'Lihat GridView',
      ),
      body: FutureBuilder<List<dynamic>>(
        future: _fecthDataUsers(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                controller: controller,
                padding: const EdgeInsets.all(12.0),
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    key: const ValueKey('list'),
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundImage:
                          NetworkImage(snapshot.data[index]['avatar']),
                    ),
                    title: Text(snapshot.data[index]['first_name'] +
                        " " +
                        snapshot.data[index]['last_name']),
                    subtitle: Text(snapshot.data[index]['email']),
                  );
                });
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
