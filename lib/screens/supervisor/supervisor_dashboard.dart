import 'package:flutter/material.dart';
import '../../utilities/customtext.dart';
import '../../utilities/custumbutton.dart';
import '../signin.dart';
import 'employee_productivity/employee_data.dart';
import 'employee_productivity/productivity_voilation_record.dart';
import 'employee_saftey/safteycheck.dart';
import 'meter/meter.dart';

class SupervisorDashboard extends StatefulWidget {
  const SupervisorDashboard({super.key});

  @override
  State<SupervisorDashboard> createState() => _SupervisorDashboardState();
}

class _SupervisorDashboardState extends State<SupervisorDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 0, 53, 103),
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "Supervisor Dashboard",
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
              CustomText("Welcome Mr Ali", Colors.white, 20),
              SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return SafteyData();
                      }));
                    },
                    child: Card(
                        shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18)),
                        elevation: 20,
                        child: Container(
                          height: 170,
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
                              height: 30,
                            ),
                            Text(
                              "Employee Safety",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            )
                          ]),
                        )),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return EmployeeData();
                        }));
                      },
                      child: Card(
                          shape: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18)),
                          elevation: 20,
                          child: Container(
                            height: 170,
                            width: 130,
                            child: Column(children: [
                              SizedBox(
                                height: 30,
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
                          ))),
                ],
              ),
              Row(children: [
                SizedBox(
                  width: 5,
                ),
                CustomButton(() {}, "See Records", 20, 10, 10),
                SizedBox(
                  width: 35,
                ),
                CustomButton(() {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ProductivityVoilationRecord();
                  }));
                }, "See Records", 20, 10, 10),
              ]),
              SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  GestureDetector(
                      onTap: () {},
                      child: Card(
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
                                fit: BoxFit.cover,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Product Quality",
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
                          return MeterData();
                        }));
                      },
                      child: Card(
                          shape: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18)),
                          elevation: 20,
                          child: Container(
                            height: 190,
                            width: 130,
                            child: Column(children: [
                              SizedBox(
                                height: 10,
                              ),
                              Image.asset(
                                'assets/images/1.jpg',
                                scale: 1,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(
                                height: 17,
                              ),
                              Text(
                                "Meter Inspection ",
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
              Row(children: [
                SizedBox(
                  width: 5,
                ),
                CustomButton(() {}, "See Records", 20, 10, 10),
                SizedBox(
                  width: 35,
                ),
                CustomButton(() {}, "See Records", 20, 10, 10),
              ]),
            ]),
          ),
        ));
  }
}
