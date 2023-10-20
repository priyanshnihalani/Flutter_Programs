import "dart:io";
import "package:chitchat/Login_Services.dart";
import "package:chitchat/Verify.dart";
import "package:chitchat/main.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:fluttertoast/fluttertoast.dart";
import "package:image_picker/image_picker.dart";

// void main() => runApp(Login());

class Login extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo
      ),
      home: LoginPage(),
    );
  }
}
class  LoginPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => Login_Page();
}
class Login_Page extends State<LoginPage> {
  final LoginServices services = LoginServices();
  final formfield = GlobalKey<FormState>();
  final auth = FirebaseAuth.instance;
  final name = TextEditingController();
  final phoneno = TextEditingController();
  bool log  = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    services.isLogin(context);
  }
  void phoneauth() async{
    await auth.verifyPhoneNumber(
      phoneNumber: phoneno.text,
        verificationCompleted: (_){
          setState(() {
            log = true;
          });
        },
        verificationFailed: (e){
          Fluttertoast.showToast(msg: e.toString());
          setState(() {
            log = false;
          });
        },
        codeSent: (String verificationId, int? token){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> VefifyPhone(verificationId: verificationId)));
          setState(() {
            log = false;
          });
        },
        codeAutoRetrievalTimeout: (_){});
  }
  // Image Picker
  File? _image;

  void setImage() async {
    var pickedImage = await ImagePicker().pickImage(
        source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }
  void showToast()
  {
    Fluttertoast.showToast(msg: "Please Fill Out Both the Fields",
        gravity: ToastGravity.BOTTOM
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: log ? MyHomePage() : Center(
            child: PageView(
              children: [
                Container(color: Colors.indigo,
                  width: 400,
                  height: 300,
                  child: Center(child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("WELCOME", style: TextStyle(fontFamily: "RobotoSlab",
                          fontSize: 32,
                          color: Colors.white),),
                      Container(
                          margin: EdgeInsets.only(top: 20),
                          child: Text("नमस्ते!", style: TextStyle(
                              fontSize: 28, color: Colors.white)))
                    ]))),
                Container(
                  width: 400,
                  height: 500,
                  child: Card(
                    elevation: 5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: setImage,
                          child: CircleAvatar(
                            backgroundImage:_image != null ?FileImage(_image!): null,
                            radius: 70,
                          ),
                        ),
                        Form(
                            key: formfield,
                            child: Column(
                              children: [
                              SizedBox(height: 50),
                              Padding (
                                padding: const EdgeInsets.symmetric(horizontal: 30),
                                child: TextFormField(
                                    controller: name,
                                    decoration: InputDecoration(
                                        labelText: "Enter Name",
                                        hintText: "Pratik 16",
                                        border: OutlineInputBorder()
                                    ),
                                validator: (value){
                                      if(value!.isEmpty){
                                        return "Enter Name";
                                      }
                                      return null;
                                },)),
                              SizedBox(height: 30),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 30),
                                child: TextFormField(
                                keyboardType: TextInputType.phone,
                                controller: phoneno,
                                decoration: InputDecoration(
                                    labelText: "Enter Phone no ",
                                    hintText: "+91 1234567890",
                                    border: OutlineInputBorder()
                                ),
                                validator: (value){
                                  if(value!.isEmpty){
                                    return "Enter Phone No.";
                                  }
                                  return null;
                                },
                              ),
                            ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 20),
                                child: log? CircularProgressIndicator() : ElevatedButton(onPressed: () {
                                    phoneauth();
                                  },
                                    child: Text("Save", style: TextStyle(
                                        fontFamily: "RobotoSlab", fontSize: 20)),
                                    style: ElevatedButton.styleFrom(
                                      padding: EdgeInsets.only(
                                          left: 20, right: 20, bottom: 10, top: 10),

                                    ))
                            ),
                          ],
                        )),

                      ],
                    ),
                  ),
                ),
              ],)));
  }
}

