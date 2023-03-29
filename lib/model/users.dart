import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path/path.dart' as path;
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:industry_watch/api/ipaddress.dart';

class Users {
  late String name, email, role, password;
  late int id, org_id, section_id;

  Users();
  Users.fromMap(Map<String, dynamic> mp) {
    id = mp["id"];
    name = mp["name"];
    email = mp["email"];
    role = mp["role"];
    org_id = mp["org_id"];
    section_id = mp["section_id"];
  }

  Future<List<Users>> Login(String email, String pass) async {
    String urll = '${ip}/login';
    var req = http.MultipartRequest('GET', Uri.parse(urll));
    req.fields["email"] = email;
    req.fields["password"] = pass;
    print(email);
    print(pass);
    var resp = await req.send();
    print("REQUest Send");
    String result = await resp.stream.bytesToString();
    print(result);
    if (resp.statusCode == 200) {
      print("2000000000000000000000000");
      List jsonlst = jsonDecode(result);
      return jsonlst.map((e) => Users.fromMap(e)).toList();
    } else {
      return [];
    }
  }

  Future<String?> signupMutliPart() async {
    String url = '${ip}/add_user';
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.fields['name'] = name;
    request.fields['email'] = email;
    request.fields['password'] = password;
    request.fields['role'] = role;
    request.fields['org_id'] = org_id.toString();
    request.fields['section_id'] = section_id.toString();
    var response = await request.send();
    if (response.statusCode == 200) {
      Fluttertoast.showToast(
          msg: "Successfully Save",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          textColor: Colors.white,
          fontSize: 16.0);
      return response.stream.bytesToString();
    } else {
      return null;
    }
  }

  Future<String?> EmployeesignupMutliPart(List<XFile> f) async {
    String url = '${ip}/add_user';
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.fields['name'] = name;
    request.fields['email'] = email;
    request.fields['password'] = password;
    request.fields['role'] = role;
    request.fields['org_id'] = org_id.toString();
    request.fields['section_id'] = section_id.toString();

    for (var e in f) {
      var stream = new http.ByteStream(e.openRead());
      var length = await e.length();
      var multipartFile = new http.MultipartFile('image', stream, length,
          filename: path.basename(e.path));
      request.files.add(multipartFile);
    }
    var response = await request.send();
    if (response.statusCode == 200) {
      response.stream.transform(utf8.decoder).listen((value) {
        print(value);
        Fluttertoast.showToast(
            msg: "Successfully Save",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            textColor: Colors.white,
            fontSize: 16.0);
      });
    } else {
      return null;
    }
  }
}
