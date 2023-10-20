import 'package:flutter/material.dart';

void main()
{
  runApp(Demo());
}

class Demo extends StatelessWidget{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      title: "Custom Widget",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.lightBlue
      ),
      home: Home(),
    );
  }
}
class Home extends StatefulWidget{
  const Home({super.key});

  @override
  State<Home> createState() => HomeScreen();

}
class HomeScreen extends State<Home>{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
        appBar:AppBar(
          title: Text("Custom Widget", style: TextStyle(color: Colors.white)),
          centerTitle: true,
        ),
        body: Container(
          child:Column(
            children: [Profile(), ContactInfo(), SubContInfo(), bottomcontInfo()],
          )
        )
    );
  }
}
class Profile extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
          color: Colors.indigoAccent,
          child: ListView.builder(itemBuilder: (context, index){
            return const Padding(
              padding: EdgeInsets.all(8.0),
              child: SizedBox(
                width: 100,
                child: CircleAvatar(
                  backgroundColor: Colors.orange,
                ),
              ),
            );}, itemCount: 10,scrollDirection: Axis.horizontal,)
      ),
    );
  }
}

class ContactInfo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Container(
        color: Colors.purpleAccent,
        child: ListView.builder(itemBuilder: (context, index) => const ListTile(
          leading: CircleAvatar(backgroundColor: Colors.orange),
          title: Text("Name", style: TextStyle(color: Colors.black),),
          subtitle: Text("Phone No: "),
          trailing: Icon(Icons.delete),
        ), itemCount: 10, ),
      ),
    );
  }
}

class SubContInfo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
          color: Colors.deepOrangeAccent,
          child: GridView.count(
            crossAxisCount: 2, crossAxisSpacing: 50, children: [
            Padding(padding: EdgeInsets.all(11),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.indigoAccent
                ),
              ),),
            Padding(padding: EdgeInsets.all(11),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    color: Colors.indigoAccent
                ),
              ),)
          ],)
      ),);
  }
}

class bottomcontInfo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
          color: Colors.lightGreen,
          child: GridView.count(crossAxisCount: 4, crossAxisSpacing: 50, children: [
            Padding(padding: EdgeInsets.all(11),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.indigoAccent
                ),
              ),),
            Padding(padding: EdgeInsets.all(11),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    color: Colors.indigoAccent
                ),
              ),),
            Padding(padding: EdgeInsets.all(11),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    color: Colors.indigoAccent
                ),
              ),),
            Padding(padding: EdgeInsets.all(11),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    color: Colors.indigoAccent
                ),
              ),)
          ],)
      ),
    );
  }
}