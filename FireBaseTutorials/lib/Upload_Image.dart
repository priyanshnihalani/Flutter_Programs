import 'dart:io';
import 'dart:math';

import 'package:firebase_tutorials/widgets/round_button.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_database/firebase_database.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UploadImage extends StatefulWidget {
  const UploadImage({super.key});

  @override
  State<UploadImage> createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  File? _image;

  final databaseref = FirebaseDatabase.instance.ref('Post');

  firebase_storage.FirebaseStorage storage = firebase_storage.FirebaseStorage.instance;
  Future getGalleryImage() async{
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if(pickedImage != null)
      {
          setState(() {
            _image = File(pickedImage.path);
          });
      }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Upload Image To The Firebase"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: InkWell(
                onTap: (){
                  getGalleryImage();
                },
                child: Container(
                  height: 200,
                  width: 200,
                  child: _image != null ? Image.file(_image!.absolute):Icon(Icons.image),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black
                    )
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            RoundButton(data: "Upload Image", press: () async{
              firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance.ref('/foldername'+'1234');
              firebase_storage.UploadTask uploadtask = ref.putFile(_image!.absolute);

              await Future.value(uploadtask);
              var newUrl = await ref.getDownloadURL();
              String id = DateTime.now().millisecond.toString();
              databaseref.child('1').set({
                'id' : id,
                'title' : newUrl.toString()
              }).then((value) => Fluttertoast.showToast(msg: "Uploaded")).onError((error, stackTrace) => Fluttertoast.showToast(msg: e.toString()));
            })
          ],
        ),
      ),
    );
  }

  }


