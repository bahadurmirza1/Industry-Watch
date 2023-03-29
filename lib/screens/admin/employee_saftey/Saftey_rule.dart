import 'package:flutter/material.dart';
import 'package:industry_watch/model/users.dart';
import 'package:industry_watch/utilities/customtext.dart';
import 'package:industry_watch/utilities/custumbutton.dart';

import '../../../model/section.dart';
import '../../super_admin/model/Saftey_rule.dart';

class SafteyRule extends StatefulWidget {
  List<Users> ulist = [];
  SafteyRule(this.ulist);

  @override
  State<SafteyRule> createState() => _SafteyRuleState();
}

class _SafteyRuleState extends State<SafteyRule> {
  List<String> rulelist = [];
  List<String> Sectionlist = [];
  List<bool> flag = [];
  List<DropdownMenuItem<String>> getSection() {
    List<DropdownMenuItem<String>> sitems = [];
    for (var e in Sectionlist) {
      DropdownMenuItem<String> obj =
          DropdownMenuItem<String>(value: e, child: Text(e.toString()));
      sitems.add(obj);
    }
    return sitems;
  }

  String? selectedSection;

  void initState() {
    gSection();
    getRule();
  }

  List<Section> seclist = [];

  Section s = new Section();

  gSection() async {
    seclist = await s.getAllSec(widget.ulist[0].org_id);
    for (var e in seclist) {
      Sectionlist.add(e.name);
    }
    setState(() {});
  }

  List<rule> rlist = [];

  rule r = new rule();

  getRule() async {
    rlist = await r.getSafteyRule();
    for (var e in rlist) {
      rulelist.add(e.name);
      flag.add(false);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 0, 53, 103),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Center(
            child: Column(
              children: [
                InputDecorator(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2, color: Colors.white),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20.0)),
                      ),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        dropdownColor: Colors.black,
                        hint: CustomText("Select Section", Colors.white, 18),
                        value: selectedSection,
                        style: TextStyle(color: Colors.white, fontSize: 18),
                        isDense: true,
                        isExpanded: true,
                        items: getSection(),
                        onChanged: (Value) {
                          setState(() {
                            selectedSection = Value!.toString();
                          });
                        },
                      ),
                    )),
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: 300,
                  child: ListView.builder(
                      itemCount: rulelist.length,
                      itemBuilder: (context, index) {
                        return CheckboxListTile(
                            side: BorderSide(color: Colors.white),
                            title: CustomText(
                                rulelist[index].toString(), Colors.white, 18),
                            value: flag[index],
                            onChanged: (value) {
                              setState(() {
                                flag[index] = value!;
                              });
                            });
                      }),
                ),
                SizedBox(
                  height: 20,
                ),
                CustomButton(() async {}, "Save", 18.0, 40, 15)
              ],
            ),
          ),
        )));
  }
}
