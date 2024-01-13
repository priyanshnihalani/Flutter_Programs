import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_tutorial/login.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'PostScreen.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final authentication = FirebaseAuth.instance;
  final formKey = GlobalKey<FormState>();
  TextEditingController email =  TextEditingController();
  TextEditingController password =  TextEditingController();

  void signup(String email, String password)  {
      authentication.createUserWithEmailAndPassword(email: email, password: password).then((value) {
        Fluttertoast.showToast(msg: "Sign Up Successful", toastLength: Toast.LENGTH_LONG, backgroundColor: Colors.white, textColor: Colors.green);
        Navigator.push(context, MaterialPageRoute(builder: (context) => PostScreen()));
      }).onError((error, stackTrace) {
        Fluttertoast.showToast(msg: "Sign Up Failed", toastLength: Toast.LENGTH_LONG, backgroundColor: Colors.white, textColor: Colors.green);
      });


  }
  @override
  void dispose()
  {
    super.dispose();
    email.dispose();
    password.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
      ),
      body: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: email,
                decoration: const InputDecoration(labelText: "Email",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email)),
                validator: (value){
                  if(value!.isEmpty){
                    return 'Please Enter Email';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                obscureText: true,
                controller: password,
                decoration: const InputDecoration(labelText: "Password",
                border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.password)),
                validator: (value){
                  if(value!.isEmpty)
                    {
                        return 'Please Enter Password';
                    }
                    return null;
                },
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(onPressed: () {
              if(formKey.currentState!.validate())
                {
                  signup(email.text.toString(), password.text.toString());
                }
              }, child: const Text("Sign Up")),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Go To"),
                  TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
                  }, child: const Text("Login"))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
