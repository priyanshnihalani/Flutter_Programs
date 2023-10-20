import 'package:flutter/Material.dart';
import 'package:demo/main39.5.dart';

class IntroPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
          title: Text("Welcome Page"),
          centerTitle: true,
        ),
        body: Center(
            child:InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return WelcomePage();
                }));
              },
              child: RichText(
                text: TextSpan(
                    style: TextStyle(color: Colors.grey, fontSize: 28,
                        fontFamily: "RobotoSlab"),
                    children: [
                      TextSpan(text: "Hello"),
                      TextSpan(text: "World", style: TextStyle(fontSize: 42,
                          color: Colors.lightBlue))
                    ]
                ),
              ),
            )
        )
    );
  }

}