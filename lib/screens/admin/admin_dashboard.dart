import 'package:flutter/material.dart';
import 'package:industry_watch/model/users.dart';
import 'package:industry_watch/screens/admin/home_add_employee.dart';
import 'package:industry_watch/screens/admin/employee_productivity/home_productivity.dart';
import 'package:industry_watch/screens/admin/section_entry.dart';
import 'package:industry_watch/screens/admin/employee_saftey/home_saftey.dart';

import '../signin.dart';

class AdminDashboard extends StatefulWidget {
  List<Users> ulist = [];

  AdminDashboard(this.ulist);

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 0, 53, 103),
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "Admin Dashboard",
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return SignIn();
                  }));
                },
                icon: Icon(
                  Icons.logout,
                  color: Colors.black,
                ))
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(children: [
              Row(
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return Section_Entry(widget.ulist);
                        }));
                      },
                      child: Card(
                          shape: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18)),
                          elevation: 20,
                          child: Container(
                            height: 150,
                            width: 130,
                            child: Column(children: [
                              SizedBox(
                                height: 20,
                              ),
                              Image.asset(
                                'assets/images/depart.jpg',
                                scale: 2,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Add Department",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              )
                            ]),

                            // child: Center(
                            //     child: Text(
                            //   "New Department",
                            //   style: TextStyle(fontSize: 15),
                            // )),
                          ))),
                  SizedBox(
                    width: 30,
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return HomeAddEmployee(widget.ulist);
                        }));
                      },
                      child: Card(
                          shape: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18)),
                          elevation: 20,
                          child: Container(
                            height: 150,
                            width: 130,
                            child: Column(children: [
                              SizedBox(
                                height: 20,
                              ),
                              Icon(
                                Icons.person_add,
                                size: 80,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Add Employee ",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              )
                            ]),

                            // child: Center(
                            //     child: Text(
                            //   "New Department",
                            //   style: TextStyle(fontSize: 15),
                            // )),
                          ))),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return HomeSaftey(widget.ulist);
                        }));
                      },
                      child: Card(
                        shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18)),
                        elevation: 20,
                        child: Container(
                          height: 150,
                          width: 130,
                          child: Column(children: [
                            SizedBox(
                              height: 10,
                            ),
                            Image.asset(
                              'assets/images/safe.png',
                              scale: 2.5,
                              fit: BoxFit.fill,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Employee Safety",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            )
                          ]),
                        ),

                        // child: Center(
                        //     child: Text(
                        //   "New Department",
                        //   style: TextStyle(fontSize: 15),
                        // )),
                      )),
                  SizedBox(
                    width: 30,
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return HomeProductivity(widget.ulist);
                        }));
                      },
                      child: Card(
                          shape: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18)),
                          elevation: 20,
                          child: Container(
                            height: 150,
                            width: 130,
                            child: Column(children: [
                              SizedBox(
                                height: 15,
                              ),
                              Image.asset(
                                'assets/images/pp.png',
                                scale: 3.5,
                                //fit: BoxFit.fill,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Employee Productivity",
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              )
                            ]),

                            // child: Center(
                            //     child: Text(
                            //   "New Department",
                            //   style: TextStyle(fontSize: 15),
                            // )),
                          ))),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  Card(
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18)),
                      elevation: 20,
                      child: Container(
                        height: 190,
                        width: 130,
                        child: Column(children: [
                          SizedBox(
                            height: 20,
                          ),
                          Image.asset(
                            'assets/images/Product_Quality.jpg',
                            scale: 2,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Add Product",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          )
                        ]),

                        // child: Center(
                        //     child: Text(
                        //   "New Department",
                        //   style: TextStyle(fontSize: 15),
                        // )),
                      )),
                  SizedBox(
                    width: 30,
                  ),
                  Card(
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18)),
                      elevation: 20,
                      child: Container(
                        height: 190,
                        width: 130,
                        child: Column(children: [
                          SizedBox(
                            height: 20,
                          ),
                          Image.asset(
                            'assets/images/1.jpg',
                            scale: 2,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Add Meter ",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          )
                        ]),

                        // child: Center(
                        //     child: Text(
                        //   "New Department",
                        //   style: TextStyle(fontSize: 15),
                        // )),
                      )),
                ],
              ),
            ]),
          ),
        ));
  }
}
