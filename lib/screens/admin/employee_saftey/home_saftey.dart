import 'package:flutter/material.dart';
import 'package:industry_watch/screens/admin/employee_productivity/productivity_rule.dart';
import 'package:industry_watch/screens/admin/employee_saftey/define_fine_saftey.dart';
import 'package:industry_watch/screens/admin/employee_saftey/saftey_rule.dart';

import '../../../model/users.dart';

class HomeSaftey extends StatefulWidget {
  List<Users> ulist = [];
  HomeSaftey(this.ulist);

  @override
  State<HomeSaftey> createState() => _HomeSafteyState();
}

class _HomeSafteyState extends State<HomeSaftey> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "Employee Saftey",
            style: TextStyle(color: Colors.black),
          ),
          bottom: TabBar(
            indicatorColor: Colors.grey,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            tabs: [Tab(text: "Saftey Rule"), Tab(text: "Define Fine")],
          ),
        ),
        body: TabBarView(
          children: [
            SafteyRule(widget.ulist),
            DefineFineSaftey(widget.ulist),
          ],
        ),
      ),
    );
  }
}
