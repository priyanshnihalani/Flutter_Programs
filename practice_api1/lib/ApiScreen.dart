import 'dart:convert';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'Model/PostModel.dart';
class ApiScreen extends StatefulWidget {
  const ApiScreen({super.key});

  @override
  State<ApiScreen> createState() => _ApiScreenState();
}

class _ApiScreenState extends State<ApiScreen> {
  List<PostModel> postModel = [];
  Future <List<PostModel>> getData()async{
    final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    var data = jsonDecode(response.body.toString());
    if(response.statusCode == 200)
      {
          for(Map i in data)
            {
              postModel.add(PostModel.fromJson(i));
            }
          return postModel;
      }
    else {
      return postModel;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fetching Api from Server"),
      ),
      body: Expanded(
        child: FutureBuilder(future: getData(), builder: (context, snapshot){
          if(!snapshot.hasData)
            {
                return const Text("Loading...");
            }
          else
            {
                return ListView.builder(
                    itemCount: postModel.length,
                    itemBuilder: (context, index){
                    return ListTile(
                      title: Text(postModel[index].title.toString()),
                      subtitle: Text(postModel[index].body.toString()),
                    );
                });
            }
        }),
      ),
    );
  }
}
