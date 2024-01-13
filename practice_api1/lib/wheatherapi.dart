import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class WheatherApi extends StatefulWidget {
  const WheatherApi({super.key});

  @override
  State<WheatherApi> createState() => _WheatherApiState();
}

class _WheatherApiState extends State<WheatherApi> {
  String apiKey = "82c00ea7ec5c62272efafd8445a55f0f";
  String cityName = "Junagadh";
  String apiUrl = "https://api.openweathermap.org/data/2.5/weather?q=Bantva&units=metric&appid=f4fb97add8b17081c254c0dd45b04cf3";
  List apidata = [];
  Future<void> getData() async{
    final response = await http.get(Uri.parse(apiUrl));
    bool dataAdded = false;
    if(response.statusCode == 200 && !dataAdded)
      {
          if(apidata.isEmpty && !dataAdded)
            {
              apidata.add(jsonDecode(response.body.toString()));
              dataAdded = true;
            }
      }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text("Wheather App"),
    ),
    body: Expanded(
      child: FutureBuilder( future : getData(), builder: (context, snapshot){
        if(snapshot.connectionState == ConnectionState.waiting)
          {
            return CircularProgressIndicator();
          }
        else {
          return ListView.builder(
              itemCount: apidata.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("${apidata[index]['weather'][0]['main']}"),
                  subtitle: Text("${apidata[index]['main']['temp']}°C"),
                );
              });
        }
      }),
    ),
    );
  }
}
