import 'package:flutter/material.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
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

  var arrnames = ["Ram", "Krishna", "Radha", "Hanuman", "Ganpati", "Sita"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(

          backgroundColor: Theme
              .of(context)
              .colorScheme
              .inversePrimary,

          title: const Text("Flutter ListTiling"),

        ),
        body: ListView.separated(itemBuilder: (context, index) {
          return ListTile(
            leading: Image.asset("assets/images/shop1.png", width: 20, height: 20,),
            title:Text(arrnames[index]),
            subtitle:const Text('Hi', style: TextStyle(fontSize: 11, color: Colors.grey)),
            trailing: const Icon(Icons.add),
          );
          },
          itemCount: arrnames.length,
            separatorBuilder: (context , index){
              return const Divider(height: 20, thickness: 2);
            }
        )
    );
  }
}
