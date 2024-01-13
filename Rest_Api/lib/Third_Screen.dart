import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Models/UserModel.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  List<UserModel> user = [];
  Future<List<UserModel>> getData() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map i in data) {
        user.add(UserModel(name: i['name']));
      }
      return user;
    } else {
      return user;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Complex Model"),
      ),
      body: Expanded(
        child: FutureBuilder(
            future: getData(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const CircularProgressIndicator();
              } else {
                return ListView.builder(
                    itemCount: user.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: const Text("Name"),
                        subtitle: Text(snapshot.data![index].name.toString()),
                      );
                    });
              }
            }),
      ),
    );
  }
}
