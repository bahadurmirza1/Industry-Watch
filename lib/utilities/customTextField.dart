import 'package:flutter/material.dart';

class CustomTextForm extends StatefulWidget {
  String hinttext;
  String labeltext;
  bool obsecuretext;
  String? obsecurechar;
  TextEditingController controller;
  Icon icon;
  CustomTextForm(this.hinttext, this.labeltext, this.obsecurechar,
      this.obsecuretext, this.controller, this.icon);

  @override
  State<CustomTextForm> createState() => _CustomTextFormState();
}

class _CustomTextFormState extends State<CustomTextForm> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(fontSize: 20, color: Colors.white),
      controller: widget.controller,
      obscureText: widget.obsecuretext,
      obscuringCharacter:
          widget.obsecurechar != null ? widget.obsecurechar! : "*",
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: Colors.white),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        hintText: widget.hinttext,
        labelStyle: TextStyle(color: Colors.white),
       
        border: OutlineInputBorder(
         borderRadius: BorderRadius.circular(20.0),
                      ),
        labelText: widget.labeltext,
        prefixIcon: widget.icon,
        //validator: (v) => v==null ? 'This Field is Required !.' : null,
      )
    );
  }
}
