import 'package:flutter/material.dart';

void main()
{
  runApp(addContactPage());
}
class addContactPage extends StatelessWidget{
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
class AddContact extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => AddContactPage();
}
class AddContactPage extends State<AddContact>
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Hello"),
    );
  }
}