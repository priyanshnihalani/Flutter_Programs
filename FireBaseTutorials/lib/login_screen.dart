import 'package:firebase_tutorials/FireStore/firestore_list_screen.dart';
import 'package:firebase_tutorials/login_with_phone.dart';
import 'package:firebase_tutorials/signup_screen.dart';
import 'package:firebase_tutorials/widgets/round_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool loading = false;
  final formfield = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final auth = FirebaseAuth.instance;
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
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2);
  }
  void login(){
    setState(() {
      loading = true;
    });
       auth.signInWithEmailAndPassword(
           email: email.text.toString()
          , password: password.text.toString()).then((value){
            toast(value.user!.email.toString());
            Navigator.push(context, MaterialPageRoute(builder: (context)=> FireStoreScreen()));
            setState(() {
              loading = false;
            });
       }).onError((error, stackTrace){
      toast("User Not Found, Enter valid Email and Password or Sign Up");
      setState(() {
        loading = false;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
          appBar: AppBar(
            title: Text("Login Screen"),
          ),
          body:Center(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
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
                      child: loading? CircularProgressIndicator() : RoundButton(data: "Login"
                      , press: (){
                          if(formfield.currentState!.validate()){
                            login();
                          }
                          },

                      )),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't Have An Account?"),
                      TextButton(onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> SignUp()));
                      },
                        child:Text("Sign Up", style: TextStyle(color: Colors.indigoAccent),)),
                    ],
                  ),
                  SizedBox(height:20),
                  InkWell(
                    onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>LonginWithPhoneno()));
                    },
                    child: Container(
                      margin: EdgeInsets.all(12),
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(50)
                      ),
                      child: Center(
                        child: Text("Login With Phone no."),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
