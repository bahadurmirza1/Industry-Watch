import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:industry_watch/api/api.dart';
import 'package:industry_watch/model/section.dart';
import 'package:industry_watch/model/users.dart';
import 'package:industry_watch/utilities/customTextField.dart';
import 'package:industry_watch/utilities/customtext.dart';
import 'package:industry_watch/utilities/custumbutton.dart';

class AddEmployee extends StatefulWidget {
  List<Users> ulist = [];
  AddEmployee(this.ulist);

  @override
  State<AddEmployee> createState() => _AddEmployeeState();
}

class _AddEmployeeState extends State<AddEmployee> {
  User u = new User();
  String? selectedSection;
  List<String> slist = [];
  List<DropdownMenuItem<String>> getSectionitems() {
    List<DropdownMenuItem<String>> sitems = [];
    for (var e in slist) {
      DropdownMenuItem<String> obj =
          DropdownMenuItem<String>(value: e, child: Text(e));
      sitems.add(obj);
    }
    return sitems;
  }

  String? selectedRol;
  bool? _passwordVisible = true;
  TextEditingController pass = TextEditingController();
  TextEditingController emailctr = TextEditingController();

  TextEditingController unamectr = TextEditingController();
  File? imgfile;
  List<XFile>? file;

  void initState() {
    getSection();
  }

  List<Section> seclist = [];

  Section s = new Section();

  getSection() async {
    seclist = await s.getAllSec(widget.ulist[0].org_id);
    for (var e in seclist) {
      slist.add(e.name);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 0, 53, 103),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(22.0),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                CustomTextForm(
                    "Username",
                    "Username",
                    null,
                    false,
                    unamectr,
                    Icon(Icons.person,
                        size: 35,
                        //color: Colors.white,
                        color: Color.fromARGB(255, 119, 235, 253))),
                SizedBox(
                  height: 20,
                ),
                CustomTextForm(
                    "Email",
                    "Email",
                    null,
                    false,
                    emailctr,
                    Icon(Icons.person,
                        size: 35,
                        //color: Colors.white,
                        color: Color.fromARGB(255, 119, 235, 253))),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  style: TextStyle(fontSize: 20, color: Colors.white),
                  controller: pass,
                  keyboardType: TextInputType.text,
                  obscureText: _passwordVisible!,
                  obscuringCharacter: "*",
                  //validator: (pass) => pass!.length < 6 ? 'Password too short.' : null,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide:
                              BorderSide(width: 2, color: Colors.white)),
                      prefixIcon: Icon(
                        Icons.lock,
                        //color: Colors.white,
                        color: Color.fromARGB(255, 119, 235, 253),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          // Based on passwordVisible state choose the icon
                          _passwordVisible!
                              ? Icons.visibility_off
                              : Icons.visibility,
                          //color: Colors.white,
                          color: Color.fromARGB(255, 119, 235, 253),
                          //color: Theme.of(context).primaryColorDark,
                        ),
                        onPressed: () {
                          setState(() {
                            _passwordVisible = !_passwordVisible!;
                          });
                        },
                      ),
                      hintText: "Enter Password",
                      labelText: "Password",
                      labelStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      )),
                ),
                SizedBox(
                  height: 20,
                ),
                InputDecorator(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2, color: Colors.white),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20.0)),
                    ),
                  ),
                  child: DropdownButtonHideUnderline(
                      child: Theme(
                    data: Theme.of(context).copyWith(
                        //canvasColor: Color.fromARGB(255, 119, 235, 253),
                        canvasColor: Colors.black),
                    child: DropdownButton(
                      hint: CustomText("Select Section", Colors.white, 18),
                      value: selectedSection,
                      style: TextStyle(color: Colors.white, fontSize: 18),
                      isDense: true,
                      isExpanded: true,
                      items: getSectionitems(),
                      onChanged: (Value) {
                        setState(() {
                          selectedSection = Value!.toString();
                        });
                      },
                    ),
                  )),
                ),
                SizedBox(
                  height: 20,
                ),
                CustomButton(() async {
                  file = await ImagePicker().pickMultiImage();
                }, "Choose Min 10 Images", 15.0, 30, 10),
                SizedBox(
                  height: 20,
                ),
                CustomButton(() async {
                  Users u = Users();
                  u.role = "employee";
                  u.email = emailctr.text;
                  u.password = pass.text;
                  u.name = unamectr.text;
                  var sec = seclist
                      .where((element) => element.name == selectedSection)
                      .first;
                  u.section_id = sec.sid;
                  u.org_id = widget.ulist[0].org_id;

                  if (file != null) {
                    var response = await u.EmployeesignupMutliPart(file!);
                  }

                  setState(() {});
                }, "Save", 22.0, 120, 13),
              ],
            ),
          ),
        ));
  }
}
