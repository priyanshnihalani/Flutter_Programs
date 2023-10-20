import 'package:firebase_tutorials/widgets/round_button.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:fluttertoast/fluttertoast.dart';
class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  bool loading = false;
  final databaseref = FirebaseDatabase.instance.ref("Post");
  TextEditingController postController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Post"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            SizedBox(height: 30),
            TextFormField(
              controller: postController,
              maxLines: 4,
              decoration: InputDecoration(
                alignLabelWithHint: true,
                labelText: "Add Message",
                hintText: "write what's in your mind...",
                border: OutlineInputBorder()
              ),
            ),
            SizedBox(height: 30),
            loading ? CircularProgressIndicator():RoundButton(data: "Add Message", press: (){
              setState(() {
                loading = true;
              });
              String id = DateTime.now().millisecond.toString();
                  databaseref.child(id).set({
                    'id' : id,
                    'message' : postController.text.toString()
                  }).then((value) { Fluttertoast.showToast(msg: "Data Inserted Successfully");
                    setState(() {
                      loading = false;
                    });
                  }).onError((error, stackTrace) { Fluttertoast.showToast(msg: error.toString());
                  setState(() {
                    loading = false;
                  });});
            })
          ],
        ),
      ),
    );
  }
}
