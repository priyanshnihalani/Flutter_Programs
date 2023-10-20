import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

void main(){
  runApp(SBar());
}
class SBar extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Image Picker",
      theme: ThemeData(
        primarySwatch: Colors.indigo
      ),
      home: SiVbar(),
    );
  }
}
class SiVbar extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => BottomBar();
}
class BottomBar extends State<SiVbar>{
  File? _image;
  Future getimage() async{
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if(image == null) return;

    final imageTemp = File(image.path);

    setState(() {
      this._image = imageTemp;
    });
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Picker", style: TextStyle(
            color: Colors.white, fontSize: 24, fontWeight: FontWeight.w600)),
        centerTitle: true,
      ),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _image != null ? Image.network("${_image!}", width: 200, height: 200): Image(image: AssetImage("assets/images/leo.jpg"), width: 250, height: 250),
            ElevatedButton(onPressed: () => getimage(), child: Text("Click From Camera"),),
            SizedBox(height: 30),
            ElevatedButton(onPressed: () => {}, child: Text("Pick From Gallery")),
          ],
        ),
      )
    );
  }
}