import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wheather_api/WheatherModel.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Future<WheatherModel> getWheather() async{
    final response = await http.get(Uri.parse("https://archive-api.open-meteo.com/v1/archive?latitude=52.52&longitude=13.41&start_date=2023-12-12&end_date=2023-12-26&hourly=temperature_2m"));
    var data = jsonDecode(response.body.toString());
    print(response.body);
    if(response.statusCode == 200)
      {
        return WheatherModel.fromJson(data);
      }
    else
      {
        return throw Exception("Something Went Wrong");
      }
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Expanded(
        child: FutureBuilder(future: getWheather(), builder: (context, snapshot){
          if(snapshot.hasData)
            {
              return ListView.builder(
                  itemCount: snapshot.data!.timezone!.length,
                  itemBuilder: (context, index){
                    return ListTile(
                      title: Text(snapshot.data!.timezone!.toString()),
                    );
                  });
            }
          else
            {
              return Text(snapshot.hasError.toString());
            }


      }),
          )
    );
  }
}
