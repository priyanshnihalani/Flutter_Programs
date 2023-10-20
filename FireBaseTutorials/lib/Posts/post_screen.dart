import 'package:firebase_tutorials/Posts/add_post.dart';
import 'package:firebase_tutorials/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:fluttertoast/fluttertoast.dart';
class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
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
        title: Text("Post Screen"),
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
          Expanded(
            child: FirebaseAnimatedList(
                query: ref, itemBuilder: (context, snapshot, animation, index) {
              final message = snapshot.child('message').value.toString();

              if (search.text.isEmpty) {
                return ListTile(
                  title: Text(message),
                  trailing: PopupMenuButton(
                    icon: Icon(Icons.more_vert),
                    itemBuilder: (BuildContext context) =>
                    [
                      PopupMenuItem(
                          value: 1,
                          child: ListTile(
                            onTap: () {
                              Navigator.pop(context);
                              showMyDialog(message, snapshot.child('id').value.toString());
                            },
                            leading: Icon(Icons.edit),
                            title: Text("Edit"),
                          )
                      ),
                      PopupMenuItem(
                          onTap: () {
                            ref.child(snapshot.child('id').value.toString()).remove();
                          },
                          value: 2,
                          child: ListTile(
                            leading: Icon(Icons.delete),
                            title: Text("Delete"),
                          )
                      )

                    ],

                  ),
                );
              }
              else if (message.toLowerCase().contains(
                  search.text.toLowerCase().toString())) {
                return ListTile(
                  title: Text(message),
                );
              }
              else {
                return Container();
              }
            }),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AddPostScreen()));
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
            Navigator.pop(context);
            ref.child(id).update({
              'message' : editController.text.toString()
            }).then((value) {
              Fluttertoast.showToast(msg: "Post Updated");
            }).onError((error, stackTrace) {
              Fluttertoast.showToast(msg: "Sorry! Something went wrong");
            });
            }, child: Text("Update"))
        ],
      );
    });
  }
}
