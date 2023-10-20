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

          title: const Text("Flutter Date Picker"),
          centerTitle: true,
        ),
        body: Center(
          child:Column(
            mainAxisAlignment:MainAxisAlignment.center,
            children: [
              Text("Select Date"),
              Container(
                height: 20,
              ),
              ElevatedButton(onPressed: () async {
                DateTime?   datepick = await showDatePicker(context: context, initialDate: DateTime.now(),
                    firstDate: DateTime(2000), lastDate: DateTime(2025));
              }, child: Text("Display")),
              Container(
                height: 20,
              ),
              ElevatedButton(onPressed: () async {
                  TimeOfDay? time = await showTimePicker(context: context,
                  initialTime: TimeOfDay.now(), initialEntryMode: 
                      TimePickerEntryMode.input);
                      print(time);
                }, child: Text("Select Time")),
            //  Note:- We put await in front of an asynchronous function to make
              //  the subsequence lines waiting for that future's result. We put
              //  async before the function body to mark that the function
              //  support await . An async function will automatically wrap the
              //  return value in Future if it doesn't already.
            ],
          )
        )
    );
  }
}
