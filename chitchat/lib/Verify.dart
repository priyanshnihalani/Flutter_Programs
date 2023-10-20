import 'package:chitchat/login1.dart';
import 'package:chitchat/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class VefifyPhone extends StatefulWidget {
  final String verificationId;
  VefifyPhone({super.key, required this.verificationId});

  @override
  State<VefifyPhone> createState() => _VefifyPhoneState();
}

class _VefifyPhoneState extends State<VefifyPhone> {
  final auth = FirebaseAuth.instance;
  final vcode = TextEditingController();
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextFormField(
              controller: vcode,
              decoration: InputDecoration(
                hintText: "Enter OTP",
                labelText: "6-digit code"
              ),
            ),
          ),
          SizedBox(height: 30),
          loading ? CircularProgressIndicator() : ElevatedButton(onPressed: (){
            setState(() {
              loading = true;
            });
            final credintial = PhoneAuthProvider.credential(verificationId: widget.verificationId, smsCode: vcode.text.toString());
            try{
              auth.signInWithCredential(credintial);
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> MyHomePage()));
            }
            catch(e){
              setState(() {
                loading = false;
              });
            }
          }, child: Text("Verify"))
        ],
      )
    );
  }
}
