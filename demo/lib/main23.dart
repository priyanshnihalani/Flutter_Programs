import 'package:flutter/material.dart';

void main(){
  runApp(Demo());
}
class Demo extends StatelessWidget
{
  Widget build(BuildContext context){
    return MaterialApp(
      title: "Demo App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home:HomeScreen(),
    );
  }
}
class HomeScreen extends StatelessWidget{
  var user = TextEditingController();
  var password = TextEditingController();
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar:AppBar(
        title: Text("InputFields", style: TextStyle(color: Colors.white)),
        centerTitle:true
      ) ,
      body: Center(
        child:Container(
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 100,
                height: 100,
                margin: EdgeInsets.only(bottom: 50),
                child: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/avatar.png"),
                ),
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                controller: user,
                decoration: InputDecoration(
                  hintText: "Enter E-mail",
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color:Colors.lightBlue,
                    )
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 2
                    )
                  ),
                    prefixIcon: IconButton(
                      icon: Icon(Icons.supervised_user_circle_outlined),
                      onPressed: (){},
                    )
                ),
              ),
              Container(
                height: 50,
              ),
              TextField(
                controller:password,
                obscureText: true,
                obscuringCharacter: '*',
                decoration: InputDecoration(
                  hintText: "Enter Password",
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color:Colors.lightBlue,
                        )
                    ),
                    prefixIcon: IconButton(
                      icon: Icon(Icons.password),
                      onPressed: (){},
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Colors.black
                    )
                  ),
                ),
              ),
              Container(
                height: 50,

              ),
              Container(
                width: 150,
                height: 40,
                child: ElevatedButton(onPressed: (){
                    String name = user.text;
                    String key = password.text;
                    print("Email is: $name and Password is $key");
                  }, child: Text("Login", style: TextStyle(color: Colors.white),)),
              )
            ],
          ),
        )
      )
    );
  }
}