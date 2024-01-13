  import 'dart:convert';
  import 'package:flutter/material.dart';
  import 'package:http/http.dart' as http;

  class ApiScreen2 extends StatefulWidget {
    const ApiScreen2({super.key});

    @override
    State<ApiScreen2> createState() => _ApiScreen2State();
  }

  class _ApiScreen2State extends State<ApiScreen2> {
    var data;
    Future<void> getData() async
    {
        final response  = await http.get(Uri.parse("https://dev-dji056x20fgho0j.api.raw-labs.com/json-programming-heroes"));


        if(response.statusCode == 200)
          {
            data = jsonDecode(response.body.toString());
          }
        else
          {
            Future.error("Something went wrong...");
          }
    }
    @override
    Widget build(BuildContext context) {
      return  Scaffold(
        appBar: AppBar(
          title: const Text("Practice Api 2"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
              child: FutureBuilder(future: getData(), builder: (context, snapshot){
                if(snapshot.connectionState == ConnectionState.waiting)
                  {
                    return const Center(child: CircularProgressIndicator());
                  }
                else {
                    return ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index){
                          return ListTile(
                            title: Text("Hero Name: ${data[index]['hero_name']}"),
                            subtitle: Text("SuperPower: ${data[index]['hero_superpower']}"),
                          );
                        });
                  }

              }),
            ),
          ],
        ),
      );
    }
  }
