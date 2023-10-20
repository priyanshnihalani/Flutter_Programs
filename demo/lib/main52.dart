import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main()
{
  runApp(Preference());
}

class Preference extends StatelessWidget
{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      title: "Shared Preference",
      theme: ThemeData(
        primarySwatch: Colors.indigo
      ),
      home: Shared(),
    );
  }
}

class Shared extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => SharePrefer();
}
class SharePrefer extends State<Shared>{
  var data = TextEditingController();
  var value = "Null";
  @override
  void initState() {
    super.initState();
    getValue();
  }
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shared Preferences"),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: data,
                decoration: InputDecoration(
                  label: Text("Enter Data"),
                  border: OutlineInputBorder()
                ),
              ),
              SizedBox(height: 40),
              ElevatedButton(onPressed: () async{
                var savedata = data.text;
                var pref = await SharedPreferences.getInstance();
                pref.setString("data", savedata);
              }, child: Text("Save")),
              SizedBox(height: 20),
              Text("Saved Value is: $value")
            ],
          ),
        ),
      )
    );
  }

  void getValue() async{
    var pref = await SharedPreferences.getInstance();

    var getValue = pref.getString("data");
    value = getValue ?? "No Data is saved";

    setState(() {

    });
  }
}