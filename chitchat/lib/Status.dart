import 'dart:async';

import 'package:chitchat/Contacts.dart';
import 'package:chitchat/chats.dart';
import 'package:chitchat/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:intl/intl.dart';
import 'package:story_view/controller/story_controller.dart';
import 'package:story_view/story_view.dart';

void main()
{
  runApp(StatusPage());
}
class StatusPage extends StatelessWidget{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.indigo
      ),
    );
  }
}
class Status extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => Statuspage();
}
class Statuspage extends State<Status>
{
  DateTime time = DateTime.now();

  var arrnames = ["John", "Jack", "Kiran", "Radhika", "Rohan", "Ram", "Keval", "Manish", "Mayuri", "Sameer", "Sanju"];
  var img = ["assets/images/a1.png", "assets/images/a2.png", "assets/images/a3.png",
    "assets/images/a4.png", "assets/images/a6.png",
    "assets/images/a7.png", "assets/images/a8.jpg", "assets/images/a9.jpg",
    "assets/images/a10.jpg", "assets/images/a11.jpg", "assets/images/a12.jpg"];

  StoryController story = StoryController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // color: Colors.indigoAccent,
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 40),
                        child: ElevatedButton(onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return MyHomePage();
                          }));
                          }, child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Icon(Icons.arrow_back, size: 26,),
                          ),
                          style: ElevatedButton.styleFrom(
                            shape: CircleBorder(),
                            backgroundColor: Colors.indigoAccent
                          ),
                        ),
                      ),
                    Container(
                      margin: EdgeInsets.only(left: 50, top: 50),
                      child: Text("Your Status", style: TextStyle(fontSize: 22, fontFamily: "RobotoSlab"),),
                    )
                  ],
                ),
              ),
            Container(
              height: 80,
              color: Colors.white,
              margin: EdgeInsets.only(top: 30),
              padding: EdgeInsets.only(top: 12),
                child: ListTile(
                  leading: InkWell(
                    onTap: (){

                     Navigator.push(context, MaterialPageRoute(builder: (_){
                       return StoryView(storyItems: [
                         StoryItem.text(title: "Hello, This is Flutter Status", backgroundColor: Colors.indigoAccent),
                         StoryItem.inlineImage(url: "https://source.unsplash.com/featured/300x201", controller: story)
                       ], controller: story);
                     }));
                    },
                    child: CircleAvatar(
                      backgroundImage: AssetImage("assets/images/a5.png"),
                      radius: 20,
                    ),
                  ),
                  minLeadingWidth: 50,
                  title: Text("Rudra", style: TextStyle(fontFamily: "RobotoSlab", fontSize: 16)),
                ),
              ),
            SizedBox(height: 30,),
            Text("Recent Updates",  style: TextStyle(fontSize: 22, fontFamily: "RobotoSlab")),
            SizedBox(height: 20,),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: arrnames.length,
                itemBuilder: (context, index){
                  return Padding(
                    padding: const EdgeInsets.all(0),
                    child: Container(
                      margin: EdgeInsets.all(5),
                      padding: EdgeInsets.all(10),
                      color: Colors.white,
                        child:ListTile(
                          leading: CircleAvatar(
                            backgroundImage: AssetImage(img[index]),
                          ),
                          title: Text("${arrnames[index]}", style: TextStyle(fontFamily: "RobotoSlab"),),
                          trailing: Text("${DateFormat("H:m").format(time)}", style: TextStyle(fontFamily: "RobotoSlab"),),
                        ),
                      ),
                  );
                },
              ),
            )
          ],
        )
      )
      );
  }
}