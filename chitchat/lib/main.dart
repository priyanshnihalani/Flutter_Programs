import 'package:chitchat/Login.dart';
import 'package:chitchat/chats.dart';
import 'package:flutter/material.dart';
import 'Calls.dart';
import 'Contacts.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',

      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {


  List<Map<String, dynamic>> ico = [
    {
      'icon': Icons.settings,
      'task': "Settings"
    },
    {
      'icon': Icons.person_2_rounded,
      'task': "Profile Settings"
    },
    {
      'icon': Icons.group,
      'task': "Create Group"
    },
    {
      'icon': Icons.link,
      'task': "Link a Device"
    }
  ];

  @override
  Widget build(BuildContext context) {

    TabController bar = TabController(length: 3, vsync: this);
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,

        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/Background.jpg"),
                      fit: BoxFit.cover
                  )
              ),
              height: 154,
              width: double.infinity,
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(top: 30),
                    // color: Colors.grey,
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                              margin: EdgeInsets.only(left: 10),
                              width: 60,
                              height: 50,
                              alignment: Alignment.topLeft,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: TextButton(
                                  onPressed: () {
                                    showDialog(context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            content: Container(
                                              width: 250,
                                              height: 400,
                                              child: Column(
                                                children: [
                                                  // UserProfileAvatar(avatarUrl: "assets/images/a1.png")
                                                  InkWell(
                                                      onTap: () {},
                                                      child: CircleAvatar(
                                                        radius: 60,
                                                        backgroundImage: AssetImage(
                                                            "assets/images/a14.jpg"),)),
                                                  SizedBox(height: 30),
                                                  Expanded(
                                                      child: ListView.separated(
                                                        itemBuilder: (context,
                                                            index) {
                                                          return ListTile(
                                                            leading: Icon(
                                                                ico[index]['icon']),
                                                            title: Text(
                                                                ico[index]['task']),
                                                          );
                                                        },
                                                        separatorBuilder: (
                                                            BuildContext context,
                                                            int index) {
                                                          return Divider(
                                                            height: 2,
                                                            thickness: 3,);
                                                        },
                                                        itemCount: ico.length,))
                                                ],
                                              ),
                                              // color: Colors.pinkAccent,
                                            ),
                                          );
                                        });
                                  },
                                  child: Container(
                                      child: CircleAvatar(radius: 20,
                                          backgroundImage: AssetImage(
                                              "assets/images/a14.jpg"))))
                          ),
                        ),

                        Expanded(
                          
                          child: Container(
                                // color: Colors.white,
                              child: Center(
                                child: Text("ChitChat",
                                    style: TextStyle(fontSize: 28, fontFamily: "RobotoSlab", color: Colors.white)),
                                      )),
                        ),
                        Expanded(
                            flex: 1,
                            child: Container(child: Text(""),))
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(12),
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.white54,
                        borderRadius: BorderRadius.circular(12)
                    ),
                    child: TabBar(
                        controller: bar,
                        indicator: UnderlineTabIndicator(
                            borderRadius: BorderRadius.circular(12),
                            insets: EdgeInsets.symmetric(horizontal: 10.0)
                        ),
                        tabs: [
                          Text("Chats", style: TextStyle(color: Colors.black,
                              fontFamily: "RobotoSlab")),
                          Text("Contacts", style: TextStyle(color: Colors.black,
                              fontFamily: "RobotoSlab")),
                          Text("Calls", style: TextStyle(color: Colors.black,
                              fontFamily: "RobotoSlab")),
                        ]),
                  ),

                ],
              ),
            ),

            Expanded(
                child: TabBarView(
                  controller: bar,
                  children: [
                    Chats(),
                    Contacts(),
                    Call()
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

