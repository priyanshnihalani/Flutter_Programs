import 'dart:io';
import 'dart:math';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class Contacts extends StatefulWidget {
  @override
  State<Contacts> createState() => ContactState();
}

class ContactState extends State<Contacts> {
  late List<Contact> contacts = [];
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    contactPermission();
  }

  //Contact Fetching.
   void contactPermission() async
  {
    if(await Permission.contacts.isGranted)
      {
          fetchContacts();
      }
    else
      {
        await Permission.contacts.request();
      }
  }
  void fetchContacts() async{
    contacts = await ContactsService.getContacts();

   setState(() {
     isLoading = false;
   });
  }

// Image Picking Part.
  File? _image;
  Future setImage() async{
    var picker = ImagePicker();
    var pickedImage = await picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }
  // Main Program.
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: isLoading? Center(child: CircularProgressIndicator()) : Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  width: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  margin: EdgeInsets.only(top: 30, left: 14),
                  child: TextField(decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: "Search Contacts"
                  ))
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: ElevatedButton(
                    onPressed: () {}, child: Padding(
                      padding: const EdgeInsets.all(11),
                      child: Icon(Icons.search_rounded),
                ), style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigoAccent,
                  shape: CircleBorder(),
                )),
              )
            ],
          ),
          SizedBox(height: 30),
          Divider(height: 2, thickness: 2,),
          SizedBox(height: 20,),
          Expanded(
              child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: contacts?.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                return Container(
                  color: Colors.white,
                  margin: EdgeInsets.all(3),
                  padding: EdgeInsets.all(10),
                  child: ListTile(

                    leading: Container(
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                            color: Colors.primaries[Random().nextInt(Colors.primaries.length)]
                        ),
                        child: contacts != null ? Text(contacts[index].givenName![0], style: TextStyle(fontSize: 18),): null),
                  )
                );
              }),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => showDialog(context: context, builder:(BuildContext context){
            return AlertDialog(
              content: Container(
                width: 300,
                height: 350,
                decoration: BoxDecoration(
                  color: Colors.white54,
                  borderRadius: BorderRadius.circular(12)
                ),
                child: Column(
                  children: [
                    Container(
                      child: Stack(
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundImage: _image != null ? FileImage(_image!): null,
                            backgroundColor: Colors.indigoAccent,
                          ),
                          Positioned(
                            bottom: 0,
                            right: -25,
                            child: RawMaterialButton(
                              shape: CircleBorder(),
                              fillColor: Colors.white,
                              onPressed: () => setImage()
                              , child:Icon(Icons.add, size: 20,)
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 30),
                    Container(
                      width: 250,
                      child: Column(
                        children: [
                          TextField(
                            decoration: InputDecoration(
                              labelText: "Enter Name",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12)
                              )
                            ),
                          ),
                          SizedBox(height: 20),
                          TextField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                labelText: "Phone no",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12)
                                )
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30),
                    Container(
                      height: 40,
                      width: 100,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.indigoAccent,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7))
                        ),
                        onPressed: () {},
                        child: Text("Save"),
                      ),
                    ),
                  ],
                ),
              ),
            );
        }),
        backgroundColor: Colors.indigoAccent,
      ),
    );
  }

}