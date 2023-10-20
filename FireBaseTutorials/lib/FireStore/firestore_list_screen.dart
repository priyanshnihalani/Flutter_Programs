import 'package:firebase_tutorials/FireStore/add_firestore_data.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import '../Posts/add_post.dart';
import '../login_screen.dart';
class FireStoreScreen extends StatefulWidget {
  const FireStoreScreen({super.key});

  @override
  State<FireStoreScreen> createState() => _FireStoreScreenState();
}

class _FireStoreScreenState extends State<FireStoreScreen> {
  final auth = FirebaseAuth.instance;
  final ref = FirebaseDatabase.instance.ref('Post');
  final search = TextEditingController();
  final editController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text("FireStore"),
        actions: [
          IconButton(onPressed: () {
            auth.signOut().then((value) =>
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginScreen())));
          }, icon: Icon(Icons.logout_sharp))
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: TextFormField(
              controller: search,
              decoration: InputDecoration(
                  labelText: "Search...",
                  border: OutlineInputBorder()
              ),
              onChanged: (String value) {
                setState(() {

                });
              },
            ),
          ),
          Expanded(child: ListView.builder(itemBuilder: (context, index){
            return ListTile(
              title: Text("FireStore Database"),
            );
          }, itemCount: 10,),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AddFirestoreData()));
          },
          child: Icon(Icons.add)),

    );
  }

  Future <void> showMyDialog(String message, String id) async{
    editController.text = message;
    await showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text("Update"),
        content: Container(
          child: TextField(
              controller: editController,
              decoration: InputDecoration(
                  hintText: "Edit Here..."
              )),
        ),
        actions: [
          TextButton(onPressed: (){
            Navigator.pop(context);
          }, child: Text("Cancel")),
          TextButton(onPressed: (){

          }, child: Text("Update"))
        ],
      );
    });
  }
}
