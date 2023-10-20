import 'package:firebase_tutorials/widgets/round_button.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class AddFirestoreData extends StatefulWidget {
  const AddFirestoreData({super.key});

  @override
  State<AddFirestoreData> createState() => _AddFirestoreDataState();
}

class _AddFirestoreDataState extends State<AddFirestoreData> {
  bool loading = false;
  final fireStore = FirebaseFirestore.instance.collection("Users");
  TextEditingController postController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Firestore"),
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
              fireStore.doc(id).set({
              'message' : postController.text.toString(),
                'id' : id
                
              }).then((value){
                setState(() {
                  loading = false;
                });
              }).onError((error, stackTrace) {
                Fluttertoast.showToast(msg: error.toString());
              });
            })
          ],
        ),
      ),
    );
  }
}
