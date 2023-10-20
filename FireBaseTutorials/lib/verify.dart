import 'package:firebase_tutorials/Posts/post_screen.dart';
import 'package:firebase_tutorials/widgets/round_button.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Vefification extends StatefulWidget {
  final String verificationId;

  const Vefification({super.key, required this.verificationId});

  @override
  State<Vefification> createState() => _VefificationState();
}

class _VefificationState extends State<Vefification> {
  bool loading = false;
  final auth = FirebaseAuth.instance;
  final verificationCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Verify"),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              SizedBox(height: 50),
              TextFormField(
                keyboardType: TextInputType.phone,
                controller: verificationCodeController,
                decoration: InputDecoration(
                    hintText: "6 Digit Code",
                    contentPadding: EdgeInsets.only(left: 10),
                    labelText: "Enter Phone Number",
                    border: OutlineInputBorder()),
              ),
              SizedBox(height: 30),
              loading
                  ? CircularProgressIndicator()
                  : RoundButton(data: "Verify", press:(){
                    setState(() {
                      loading = true;
                    });
                    final credintial = PhoneAuthProvider.credential(verificationId: widget.verificationId, smsCode: verificationCodeController.text.toString()
                    );
                    try{
                      auth.signInWithCredential(credintial);
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> PostScreen()));
                    }
                    catch(e){
                      setState(() {
                        loading = false;
                      });
                      Fluttertoast.showToast(msg: e.toString());
                    }
              })
            ],
          ),
        ));
  }
}
