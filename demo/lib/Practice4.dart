import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:story_view/story_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0x00116ef)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> arr = [pageOne(), pageTwo(), pageThree()];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 4,
      child: Scaffold(
        appBar: AppBar(

          backgroundColor: Theme
              .of(context)
              .colorScheme
              .inversePrimary,

          title: const Text("Whatsapp", style: TextStyle(color: Colors.white,
              fontFamily: "RobotoSlab", fontWeight:FontWeight.bold)),
          actions: [
            Icon(Icons.camera_alt_outlined, color: Colors.white),
            SizedBox(width: 50),
            Icon(Icons.search, color: Colors.white),
            SizedBox(width: 50,),
            Icon(Icons.more_vert, color: Colors.white),
          ],
          bottom: TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(icon: Icon(Icons.group),),
              Tab(text: "Chat",),
              Tab(text: "Status"),
              Tab(text: "Call") ,
            ],
          ),
        ),
        body: TabBarView(
          children:[
            Community(),
            pageOne(),
            pageTwo(),
            pageThree()
          ],
        ),
        floatingActionButton:  FloatingActionButton(
          onPressed: (){},
          child: Icon(Icons.chat),
        )
        )
    );
  }
}
class Community extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text("Community Page");
  }
}
class pageOne extends StatelessWidget{
  var time = DateTime.now();
  var arrnames = ["John", "Ram", "Krishna", "Radha", "Daisy", "Rose", "Rudra",
    "Aleena", "Nusrat", "Salman", "Amir", "Karan", "Shyam"];


  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (BuildContext context, int index){
      return Padding(
        padding: const EdgeInsets.all(11),
        child: ListTile(
          leading:CircleAvatar(backgroundImage: AssetImage("assets/images/leo.jpg")),
          title: Text(arrnames[index]),
          subtitle: Text("Hi..."),
          trailing: Text("${DateFormat('H:m').format(time)}"),
        ),
      );
    }, itemCount: arrnames.length,
    );

  }
}
class pageTwo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
          child: GestureDetector(
            child: CircleAvatar(backgroundImage: AssetImage("assets/images/leo.jpg"))
          , onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => StoryPage()))),
        )
    );
  }
}
class pageThree extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
          child: Text("PageThree"),
        )
    );
  }
}
class StoryPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => StoryPageView();
}
class StoryPageView extends State<StatefulWidget>{
  final storycontrol = StoryController();
  @override
  Widget build(BuildContext context) {
      return StoryView(storyItems: [
        StoryItem.text(title: "First Application", backgroundColor: Colors.green),
        StoryItem.pageImage(url: "assets/images/Bmi.png", controller: storycontrol)
      ], controller: storycontrol, repeat: false,
        inline: false, indicatorColor: Colors.white, );
  }
}