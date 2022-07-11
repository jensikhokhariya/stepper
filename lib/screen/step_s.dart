import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Step_S extends StatefulWidget {
  const Step_S({Key? key}) : super(key: key);

  @override
  State<Step_S> createState() => _Step_SState();
}

class _Step_SState extends State<Step_S> {
  ImagePicker imagePicker = ImagePicker();
  File file = File("");
  int i = 0;
  List gn = ["Male", "Female"];
  String sn = "female";
  String select = "female";
  List chk = [false, false, false];
  bool ischeck = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Edit Your Profile"),
          leading: Icon(Icons.arrow_back),
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Stepper(
            currentStep: i,
            onStepTapped: (ps) {
              setState(() {
                i = ps;
              });
            },
            onStepContinue: () {
              setState(() {
                if (i < 9) {
                  i++;
                }
              });
            },
            onStepCancel: () {
              setState(() {
                if (i > 0) {
                  i--;
                }
              });
            },
            steps: [
              Step(
                title: Text(
                  "Profile Picture",
                  style: TextStyle(fontSize: 18),
                ),
                content: InkWell(
                  onTap: () async {
                    XFile? f1 = await imagePicker.pickImage(
                        source: ImageSource.gallery);
                    setState(() {
                      file = File(f1!.path);
                    });
                  },
                  child: Container(
                    height: 100,
                    width: 100,
                    child: CircleAvatar(
                      backgroundImage: FileImage(file!),
                    ),
                  ),
                ),
              ),
              Step(
                title: Text(
                  "Name",
                  style: TextStyle(fontSize: 18),
                ),
                content: TextField(
                  decoration: InputDecoration(
                    label: Text("Name"),
                  ),
                ),
              ),
              Step(
                title: Text(
                  "Phone Number",
                  style: TextStyle(fontSize: 18),
                ),
                content: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    label: Text("Your phone Number"),
                    icon: Icon(Icons.call),
                  ),
                ),
              ),
              Step(
                title: Text(
                  "Email",
                  style: TextStyle(fontSize: 18),
                ),
                content: TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    label: Text("Email"),
                    icon: Icon(Icons.mail),
                  ),
                ),
              ),
              Step(
                title: Text(
                  "DOB",
                  style: TextStyle(fontSize: 18),
                ),
                content: TextField(
                  keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(
                    label: Text("Date of Birth"),
                  ),
                ),
              ),
              Step(
                title: Text(
                  "Gender",
                  style: TextStyle(fontSize: 18),
                ),
                content: Column(
                  children: [
                    ListTile(
                      leading: Radio(
                          value: gn[0],
                          groupValue: sn,
                          onChanged: (dynamic value) {
                            setState(() {
                              sn = value as String;
                            });
                          }),
                      title: Text("Male"),
                    ),
                    ListTile(
                      leading: Radio(
                          value: gn[1],
                          groupValue: sn,
                          onChanged: (dynamic value) {
                            setState(() {
                              sn = value as String;
                            });
                          }),
                      title: Text("FeMale"),
                    ),
                  ],
                ),
              ),
              Step(
                title: Text(
                  "Current Location",
                  style: TextStyle(fontSize: 18),
                ),
                content: TextField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.location_on_outlined),
                    label: Text("Location"),
                  ),
                ),
              ),
              Step(
                title: Text(
                  "Nationalities",
                  style: TextStyle(fontSize: 18),
                ),
                content: TextField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.flag),
                    label: Text("Nationalities"),
                  ),
                ),
              ),
              Step(
                title: Text(
                  "Religion",
                  style: TextStyle(fontSize: 18),
                ),
                content: TextField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.location_on_outlined),
                    label: Text("Religion"),
                  ),
                ),
              ),
              Step(
                title: Text(
                  "Language(s)",
                  style: TextStyle(fontSize: 18),
                ),
                content: Column(
                  children: [
                    Row(
                      children: [
                        Checkbox(
                            value: chk[0],
                            onChanged: (value) {
                              setState(() {
                                chk[0] = value as bool;
                              });
                            }),
                        Text("English"),
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                            value: chk[1],
                            onChanged: (value) {
                              setState(() {
                                chk[1] = value as bool;
                              });
                            }),
                        Text("Hindi"),
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                            value: chk[2],
                            onChanged: (value) {
                              setState(() {
                                chk[2] = value as bool;
                              });
                            }),
                        Text("Gujarati"),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
