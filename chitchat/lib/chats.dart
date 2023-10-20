import 'package:chitchat/Status.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'Chatpage.dart';

class Chats extends StatelessWidget{
  DateTime time = DateTime.now();
  var phonenumbers = ["+919737005335", "+919924643236"];
  var arrnames = ["John", "Jack", "Kiran", "Radhika", "Rudra", "Rohan", "Ram", "Keval", "Manish", "Mayuri", "Sameer", "Sanju", "Anita", "Prisha", "Bhairav"];
  var img = ["assets/images/a1.png", "assets/images/a2.png", "assets/images/a3.png",
    "assets/images/a4.png", "assets/images/a5.png", "assets/images/a6.png",
    "assets/images/a7.png", "assets/images/a8.jpg", "assets/images/a9.jpg",
    "assets/images/a10.jpg", "assets/images/a11.jpg", "assets/images/a12.jpg",
    "assets/images/a13.jpg", "assets/images/a14.jpg", "assets/images/a15.jpg", ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: arrnames.length,
                itemBuilder: (context, index){
              return Padding(
                padding: const EdgeInsets.all(0),
                child: Container(
                  margin: EdgeInsets.all(1),
                  padding: EdgeInsets.all(11),
                  color: Colors.white,
                  child: GestureDetector(
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ChatPage(name: arrnames[index], img: img[index], phonenumber: phonenumbers[index]))),
                      child:ListTile(
                        leading: CircleAvatar(
                          backgroundImage: AssetImage(img[index]),
                        ),
                        title: Text("${arrnames[index]}"),
                        trailing: Text("${DateFormat("H:m").format(time)}", style: TextStyle(fontFamily: "RobotoSlab"),),
                      ),
                  ),
                ),
              );
            },
            )
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context){
           return Status();
        }));
      },
      child: Icon(Icons.camera_front_sharp), backgroundColor: Colors.indigoAccent)
    );
  }
}