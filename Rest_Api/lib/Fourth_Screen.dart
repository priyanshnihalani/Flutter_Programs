import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FourthScreen extends StatefulWidget {
  const FourthScreen({super.key});

  @override
  State<FourthScreen> createState() => _FourthScreenState();
}

class _FourthScreenState extends State<FourthScreen> {
  var data;
  Future<void> getData() async
  {
    final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    if(response.statusCode == 200)
      {
        data = jsonDecode(response.body.toString());
      }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Complex data without Model"),
      ),
      body: Expanded(
        child: FutureBuilder(future: getData(), builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.waiting)
            {
                return Center(
                  child: CircularProgressIndicator(),
                );
            }
          else{
            return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index){
                return Card(
                  child: Column(
                    children: [
                      Text("Name:  ${data[index]['name']}"),
                      Text("Email: ${data[index]['email']}"),
                      Text("City: ${data[index]['address']['city']}")
                    ],
                  ),
                );
            });
          }
        }),
      ),
    );
  }
}
