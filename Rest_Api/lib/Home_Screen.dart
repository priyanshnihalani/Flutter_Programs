import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'Models/PostsModel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<PostsModel> postModel = [];
  Future<List<PostsModel>> getPostApi()async{
    final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    var data = jsonDecode(response.body.toString());
    if(response.statusCode == 200)
      {
          for(Map i in data)
            {
              postModel.add(PostsModel.fromJson(i));
            }
          return postModel;
      }
    else
      return postModel;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter API Tutorial"),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(future: getPostApi(), builder: (context, snapshot){
              if(!snapshot.hasData)
                {
                    return Text("Loading...");
                }
              else
                {
                    return ListView.builder(
                        itemCount: postModel.length,
                        itemBuilder: (context, index){
                        return ListTile(
                          subtitle: Text(postModel[index].body.toString()),
                          title: Text(postModel[index].title.toString()),
                        );
                    });
                }
            }),
          )
        ],
      )
    );
  }
}
