import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:industry_watch/screens/super_admin/dashboard.dart';
import 'package:industry_watch/screens/supervisor/supervisor_dashboard.dart';

import '../model/users.dart';
import '../utilities/customTextField.dart';
import '../utilities/custumbutton.dart';
import 'admin/admin_dashboard.dart';
import 'employee/employee_voilation_record.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController unamectr = TextEditingController();
  TextEditingController passctr = TextEditingController();
  List<String> rollist = ["SuperAdmin", "Admin", "Supervisor", "Employee"];

  List<DropdownMenuItem<String>> getRolitems() {
    List<DropdownMenuItem<String>> rolitems = [];
    for (var e in rollist) {
      DropdownMenuItem<String> obj =
          DropdownMenuItem<String>(value: e, child: Text(e));
      rolitems.add(obj);
    }
    return rolitems;
  }

  String? selectedOrg;
  String? selectedRol;
  bool? _passwordVisible = true;
  TextEditingController pass = TextEditingController();
  TextEditingController emailctr = TextEditingController();
  Users u = new Users();
  List<Users> ulist = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 0, 53, 103),
        // backgroundColor: Color.fromARGB(255, 119, 235, 253),
        //backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                  height: 250,
                  width: 400,
                  child: Image.asset(
                    'assets/images/watchs.png',
                    fit: BoxFit.fill,
                  )),
              Padding(
                padding: const EdgeInsets.all(22.0),
                child: Column(
                  children: [
                    //CustomText("SignIn", Colors.black, 40.0),
                    // SizedBox(
                    //   height: 50,
                    // ),
                    SizedBox(
                      height: 10,
                    ),
                    // CustomTextForm(
                    //     "Name",
                    //     "Name",
                    //     null,
                    //     false,
                    //     unamectr,
                    //     Icon(Icons.person,
                    //         size: 35,
                    //         //color: Colors.white,
                    //         color: Color.fromARGB(255, 119, 235, 253))),
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
                      validator: (pass) =>
                          pass!.length < 6 ? 'Password too short.' : null,
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
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
                    // InputDecorator(
                    //   decoration: InputDecoration(
                    //     enabledBorder: OutlineInputBorder(
                    //       borderSide: BorderSide(width: 2, color: Colors.white),
                    //       borderRadius:
                    //           const BorderRadius.all(Radius.circular(20.0)),
                    //     ),
                    //   ),
                    //   child: DropdownButtonHideUnderline(
                    //     child: DropdownButton(
                    //       dropdownColor: Colors.black,
                    //       hint:
                    //           CustomText("Select Your Role", Colors.white, 18),
                    //       value: selectedRol,
                    //       style: TextStyle(color: Colors.white, fontSize: 18),
                    //       isDense: true,
                    //       isExpanded: true,
                    //       items: getRolitems(),
                    //       onChanged: (Value) {
                    //         setState(() {
                    //           selectedRol = Value!;
                    //         });
                    //       },
                    //     ),
                    //   ),
                    // ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomButton(() async {
                      ulist = await u.Login(emailctr.text, pass.text);
                      if (ulist.isNotEmpty) {
                        print("ROLEEEE" + ulist[0].role);
                        if (ulist[0].role == "Admin") {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return AdminDashboard(ulist);
                          }));
                        } else if (ulist[0].role == "supervisor") {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return SupervisorDashboard();
                          }));
                        } else if (ulist[0].role == "super admin") {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return SuperAdminDashboard();
                          }));
                        } else if (ulist[0].role == "employee") {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return EmployeeVoilationRecord();
                          }));
                        }
                      } else {
                        Fluttertoast.showToast(
                            msg: "Incorrect Email or Password",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      }
                    }, "SignIn", 22.0, 120, 20),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
