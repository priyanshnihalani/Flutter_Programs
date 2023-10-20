import 'package:flutter/Material.dart';

void main() {
  runApp(Demo());
}

class Demo extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "Demo App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      primarySwatch: Colors.lightBlue,
        textTheme:TextTheme(
          headline1: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          subtitle1: TextStyle(fontSize: 16)
        ),
    ),

        home: HomeScreen(),
    );
}
}
class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
      title: const Text("Styles And Themes", style: TextStyle(color: Colors.white,
      fontFamily: "RobotoSlab")),
        centerTitle: true,
    ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(

          children: [
            Text("\nFlutter Styles and Themes", style: Theme.of(context).textTheme.headline1!.copyWith(fontFamily: "Robotoslab")),
            Text('''\nThe first version of Flutter was known as 'Sky' and ran on the Android operating system. It was unveiled at the 2015 Dart developer summit[8] with the stated intent of being able to render consistently at 120 frames per second.[9] During the keynote of Google Developer Days in Shanghai in September 2018, Google. 
           ''' , style: Theme.of(context).textTheme.subtitle1!.copyWith(fontFamily: "RobotoSlab"))
          ],
        ),
      ),
    );
}
}