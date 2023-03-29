import 'package:flutter/material.dart';
import 'package:industry_watch/model/users.dart';
import 'package:industry_watch/screens/admin/employee_productivity/define_fine_productivity.dart';
import 'package:industry_watch/screens/admin/employee_productivity/productivity_rule.dart';

class HomeProductivity extends StatefulWidget {
  List<Users> ulist = [];
  HomeProductivity(this.ulist);

  @override
  State<HomeProductivity> createState() => _HomeProductivityState();
}

class _HomeProductivityState extends State<HomeProductivity> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "Employee Productivity",
            style: TextStyle(color: Colors.black),
          ),
          bottom: TabBar(
            indicatorColor: Colors.grey,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            tabs: [Tab(text: "Productivity Rule"), Tab(text: "Define Fine")],
          ),
        ),
        body: TabBarView(
          children: [
            ProductivityRule(widget.ulist),
            DefineFineProductivity(widget.ulist),
          ],
        ),
      ),
    );
  }
}
