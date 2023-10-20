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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(

          backgroundColor: Theme
              .of(context)
              .colorScheme
              .inversePrimary,

          title: const Text("Flutter Containers"),

        ),
        body: Container(
          width: 300,
          height: 300,
          color: Colors.black26,
          child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  /*Note:- "center" is used to align center vertically, "start"
                   is used to align at starting point vertically, "end"
                   is used to align at ending point vertically */
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            /* Note:- "spaceEvenly" give equal space from all side
                    "spaceAround" give even space between the elements but half of
                    its space from starting point and ending point.
                    "spaceBetween" give no space from starting and ending point
                    but only give between */

                  children: /* Note:- This is "<ElevatedButton>" used to fix the
                   element which can be button, text or anything. */
                  [
                  TextButton(onPressed:(){ print("Text Button");}, child:
                    Text("Text"),),
                   OutlinedButton(onPressed: (){print("OutlinedButton");},
                     child: Text("Outliend")),
                  ElevatedButton(child: const Text("Elevated"),
                      onPressed:(){print("Page Printed");})
                  ],
              ),
        )
      );
  }
}
