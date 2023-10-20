import 'package:firebase_tutorials/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_tutorials/widgets/round_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final formfield = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;



  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    email.dispose();
    password.dispose();
  }
  void toast(message){
    Fluttertoast.showToast(msg: message,
    backgroundColor: Colors.red,
    fontSize: 18,
    timeInSecForIosWeb: 2);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Sign Up Screen"),
        ),
        body:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Form(
                key: formfield,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      margin: EdgeInsets.only(top: 10, bottom: 10),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        validator: (value){
                          if(value!.isEmpty)
                          {
                            return 'Enter Email';
                          }
                          return null;
                        },
                        controller: email,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.alternate_email_rounded),
                            label: Text("Enter Email"),
                            hintText: "john.rock@gmail.com",
                            border: OutlineInputBorder()
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      margin: EdgeInsets.only(top: 10, bottom: 10),
                      child: TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        validator: (value){
                          if(value!.isEmpty)
                          {
                            return 'Enter Password';
                          }
                          return null;
                        },
                        controller: password,
                        obscureText: true,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.password),
                            label: Text("Enter Password"),
                            border: OutlineInputBorder()
                        ),
                      ),
                    )
                  ],
                )),
            Container(
                padding: EdgeInsets.all(20),
                child: RoundButton(data: "SignUp"
                    , press: (){
                      if(formfield.currentState!.validate()){
                        auth.createUserWithEmailAndPassword(
                            email: email.text.toString(),
                            password: password.text.toString()).then((value){}).onError((error, stackTrace){
                            toast(error.toString());
                        });
                      }
                    }
                )),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't Have An Account?"),
                TextButton(onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                    child:Text("Login", style: TextStyle(color: Colors.indigoAccent),)),
              ],
            )
          ],
        ));
  }
}
