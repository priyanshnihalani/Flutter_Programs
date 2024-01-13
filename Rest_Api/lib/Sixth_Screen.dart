import 'package:flutter/material.dart';
import 'package:http/http.dart';

class SixthScreen extends StatefulWidget {
  const SixthScreen({super.key});

  @override
  State<SixthScreen> createState() => _SixthScreenState();
}

class _SixthScreenState extends State<SixthScreen> {
  TextEditingController emailcontoller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  void login(String email, String password) async {
    try{
      Response response =  await post(
          Uri.parse('https://reqres.in/api/register'),
          body: {
            'email' : email,
            'password' : password
          }
      );
      if(response.statusCode == 200){
        print("You are Successfully Registered");
      }
      else
        print("Failed To Register");
    }
    catch(e)
    {
      print(e.toString());
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sign Up Using Api"),),
      body:Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailcontoller,
                decoration: InputDecoration(
                  hintText: "Enter Email",
                  border: OutlineInputBorder()
                ),
            ),
            SizedBox(height: 10,),
            TextFormField(
              controller: passwordcontroller,
              decoration: InputDecoration(
                  hintText: "Enter Password",
                  border: OutlineInputBorder()
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: (){
                login(emailcontoller.text, passwordcontroller.text);
              },
              child: Container(
                height: 60,
                width: 120,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(child: Text("Sign Up", style: TextStyle(fontSize: 20),)),),
            )
          ],
        ),
      )
    );
  }


}
