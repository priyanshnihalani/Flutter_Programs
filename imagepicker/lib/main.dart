import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path/path.dart';

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

  File? _image;

  String _imagePath = '';

  @override
  void initState()
  {
    // TODO: implement initState
    super.initState();
    LoadImage();
  }
  void setImage() async{
    var set = await ImagePicker().pickImage(source: ImageSource.gallery);

    if(set != null){
      setState(() {
        _image = File(set.path);
      });
    }
  }
  void saveImageLocally(path) async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("imagepath", path);
  }
  void LoadImage() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      _imagePath = pref.getString("imagepath")!;
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Set Image"),
             InkWell(
                onTap: (){
                  setState(() {
                    setImage();
                  });
                },
                child: Container(
                    width: 200,
                    height: 200,
                    child: _imagePath != null ? CircleAvatar(backgroundImage: FileImage(File(_imagePath))) : CircleAvatar(backgroundImage: _image != null ? FileImage(_image!.absolute): null))) /*: CircleAvatar(backgroundImage: FileImage(_image!))*/,
            ElevatedButton(onPressed: (){
              saveImageLocally(_image!.path);

              }, child: Text("Save"))
          ],
        ),
      ),
    );
  }
}
