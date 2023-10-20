import 'package:firebase_tutorials/verify.dart';
import 'package:firebase_tutorials/widgets/round_button.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LonginWithPhoneno extends StatefulWidget {
  const LonginWithPhoneno({super.key});

  @override
  State<LonginWithPhoneno> createState() => _LonginWithPhonenoState();
}

class _LonginWithPhonenoState extends State<LonginWithPhoneno> {
  bool loading = false;
  final auth = FirebaseAuth.instance;
  final phonenumber = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                SizedBox(height: 50),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  controller: phonenumber,
                  decoration: InputDecoration(
                    hintText: "+12 1234567890",
                    contentPadding: EdgeInsets.only(left: 10),
                    labelText: "Enter Phone Number",
                    border: OutlineInputBorder()
                )),
                SizedBox(height: 30),
                loading? CircularProgressIndicator():RoundButton(data: "Login", press: (){
                  setState(() {
                    loading = true;
                  });

                  auth.verifyPhoneNumber(
                      phoneNumber: phonenumber.text,
                      verificationCompleted:(_){
                        setState(() {
                          loading = false;
                        });
                      },
                      verificationFailed: (e){
                        setState(() {
                          loading = false;
                        });
                        Fluttertoast.showToast(msg: e.toString());
                      },
                      codeSent:(String verificationId, int? token){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Vefification(verificationId: verificationId)));
                        setState(() {
                          loading = false;
                        });
                        },
                      codeAutoRetrievalTimeout:(e){
                        setState(() {
                          loading = false;
                        });
                        Fluttertoast.showToast(msg: e.toString());
                      }
                  );
                })
              ],
            ),
          )
    );
  }
}
