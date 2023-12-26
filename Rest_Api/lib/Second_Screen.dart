import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  List<Photos> photolist = [];

  Future <List<Photos>> getPhotos() async{
      final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));
      var data = jsonDecode(response.body.toString());

      if(response.statusCode == 200)
        {
          for(Map i in data)
            {
                photolist.add(Photos(title: i['title'], url: i['url']));
            }
          return photolist;
        }
      else
        {
          return photolist;
        }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Model Api Fetching"),
      ),
      body: Expanded(
        child: FutureBuilder(future: getPhotos(), builder: (context, snapshot){
          return ListView.builder(
              itemCount: photolist.length,
              itemBuilder: (context, index){
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(snapshot.data![index].url.toString()),
                ),
                title: Text(photolist[index].title),
              );
          });
        }),
      )
    );
  }
}
class Photos{
  String title, url;
  Photos({required this.title, required this.url});
}
