import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:scroll_app_bar/scroll_app_bar.dart';

class GridViewPage extends StatelessWidget {
  const GridViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = ScrollController();
    bool? isList = true;
    var apiUrl = Uri.parse('https://reqres.in/api/users?per_page=30');

    Future<List<dynamic>> _fecthDataUsers() async {
      var result = await http.get(apiUrl);
      return json.decode(result.body)['data'];
    }

    return Scaffold(
      appBar: ScrollAppBar(
        controller: controller, // Note the controller here
        title: const Text(
          "Reqres.in API GridView",
        ),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: _fecthDataUsers(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
              controller: controller,
              padding: const EdgeInsets.all(10),
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return GridCard(
                  avatar: NetworkImage(snapshot.data[index]['avatar']),
                  firstname: snapshot.data[index]['first_name'],
                  lastname: snapshot.data[index]['first_name'],
                  email: snapshot.data[index]['email'],
                );
              },
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.0,
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

class GridCard extends StatelessWidget {
  var avatar;
  var firstname;
  var lastname;
  var email;

  GridCard({
    Key? key,
    required this.avatar,
    required this.firstname,
    required this.lastname,
    required this.email,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5.0),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.pink,
      ),
      child: Column(
        children: <Widget>[
          CircleAvatar(
            radius: 30,
            backgroundImage: avatar,
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  'Name : $firstname $lastname',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16.0),
                ),
              ),
            ],
          ),
          Expanded(
            child: Text(
              'email : $email',
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 12.0),
            ),
          ),
        ],
      ),
    );
  }
}
