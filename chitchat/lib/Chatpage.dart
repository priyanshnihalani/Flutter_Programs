
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:fluttertoast/fluttertoast.dart';
class ChatPage extends StatefulWidget {
  final String name;
  final String img;
  final String phonenumber;
  ChatPage({required this.name, required this.img, required this.phonenumber});
  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

  final database = FirebaseDatabase.instance.ref("Message");
  final List<String> _message = [];
  TextEditingController _text = TextEditingController();


  @override
  Widget build(BuildContext context) {
    // void send_message() {
    //   if(_text.text != '')
    //     {
    //       setState(() {
    //         String message = _text.text;
    //         _message.add(message);
    //         _text.clear();
    //       });
    //     }
    // }

    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Image(
          image: AssetImage("assets/images/Background.jpg"),
          fit: BoxFit.cover,
        ),
        backgroundColor: Colors.indigo,
        leadingWidth: 25,
        title: SingleChildScrollView(
          child: Wrap(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(widget.img),
              ),
              SizedBox(width: 10),
              Container(
                width: 140,
                child: Column(
                  children: [
                    Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          widget.name,
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: "RobotoSlab",
                              overflow: TextOverflow.ellipsis),
                        )),
                    Container(
                        alignment: Alignment.centerLeft,
                        child: Text("online",
                            style: TextStyle(color: Colors.grey, fontSize: 12)))
                  ],
                ),
              )
            ],
          ),
        ),
        actions: [
          InkWell(
              onTap: () {
                call();
              },
              child: Icon(Icons.call)),
          SizedBox(width: 25),
          Icon(Icons.video_call),
          SizedBox(width: 12),
          Icon(Icons.more_vert),
          SizedBox(width: 12),
        ],
      ),
      body: Stack(
        children: [
          FirebaseAnimatedList(

            padding: EdgeInsets.all(12),
            itemBuilder: (context, snapshot, animation, index) {
              final message = snapshot
                  .child("message")
                  .value
                  .toString();
              return Container(
                  child: Align(
                      alignment: Alignment.topRight,
                      child: Card(
                        elevation: 7,
                        child: Container(
                            decoration: BoxDecoration(
                                color: Colors.indigoAccent,
                                borderRadius: BorderRadius.circular(5)
                            ),
                            padding: EdgeInsets.all(9),
                            child: Text(message, softWrap: true,
                              style: TextStyle(color: Colors.white),)),
                      )));
            }, query: database,),

          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
              height: 60,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                children: [
                  Expanded(
                      child: TextField(
                        controller: _text,
                        decoration: InputDecoration(
                            hintText: "Send a Message",
                            prefixIcon: Icon(Icons.emoji_emotions_sharp),
                            border: InputBorder.none),
                      )),

                  FloatingActionButton(
                    onPressed: () async {
                      String id = DateTime
                          .now()
                          .millisecond
                          .toString();
                      sendMessage(_text.text, id);

                    },
                    child: Icon(Icons.send),
                    backgroundColor: Colors.indigoAccent,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void call() async {
    await FlutterPhoneDirectCaller.callNumber(widget.phonenumber);
  }
// Import the firebase_database package

// Send a message
  void sendMessage(String messageText, String userId) {
    database.push().set({
      'message': messageText,
      'id' : userId
    });
  }
}
