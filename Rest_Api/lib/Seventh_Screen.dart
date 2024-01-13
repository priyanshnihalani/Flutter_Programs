import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SeventhScreen extends StatefulWidget {
  const SeventhScreen({super.key});

  @override
  State<SeventhScreen> createState() => _SeventhScreenState();
}

class _SeventhScreenState extends State<SeventhScreen> {
  File? image;
  final picker = ImagePicker();
  bool showspinner = false;

  Future getImage() async {
    final pickedFile = await picker.pickImage(
        source: ImageSource.gallery, imageQuality: 80);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      setState(() {});
    }
    else {
      print("No Image Selected");
    }
  }

  Future<void> upload() async {
    setState(() {
      showspinner = true;
    });
    var uri = Uri.parse("https://fakestoreapi.com/products");
    var request = http.MultipartRequest('POST', uri);

    var stream = http.ByteStream(image!.openRead());
    stream.cast();

    var length = await image!.length();
    var multiport = http.MultipartFile('image', stream, length);
    request.files.add(multiport);

    var response = await request.send();
    if (response.statusCode == 200) {
      print("Image Uploaded");
    }
    else
      print(Exception("Something Went Wrong"));
    setState(() {
      showspinner = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showspinner,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Upload Image using api"),
        ),
        body: Column(
          children: [
            Container(
              child: image == null ? Container(
                  child: GestureDetector(
                      onTap: () => getImage(),
                      child: const Center(child: Text("Pick an Image")))) :
              Center(
                child: Image.file(File(image!.path).absolute, height: 100,
                    width: 100,
                    fit: BoxFit.cover),
              ),
            ),
            ElevatedButton(onPressed: () {
              upload();
            }, child: Text("Upload Image"))
          ],
        ),
      ),
    );
  }
}
