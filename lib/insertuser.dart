import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:myshopneisha/listalluser.dart';

class InsertUser extends StatefulWidget {
  const InsertUser({Key? key}) : super(key: key);

  @override
  State<InsertUser> createState() => _InsertUserState();
}

class _InsertUserState extends State<InsertUser> {
  final _username = TextEditingController();
  final _password = TextEditingController();
  final _email = TextEditingController();
  final _address = TextEditingController();
  void ClearText() {
    _username.clear();
    _password.clear();
    _email.clear();
    _address.clear();
  }

  Future<void> insertNewUser() async {
    String urlInsertUser =
        "https://neishasalsabila.000webhostapp.com/insertuser.php";
    try {
      var responseInsert = await http.post(Uri.parse(urlInsertUser), body: {
        "username": _username.text.toString(),
        "password": _password.text.toString(),
        "email": _email.text.toString(),
        "address": _address.text.toString(),
      });
      var newUser = json.decode(responseInsert.body);
      if (newUser == "true") {
        print("Data User Baru Berhasil dItambahkan");
      } else {
        print("Data User Baru Gagal dItambahkan");
      }
    } catch (exc) {
      print(exc);
    }
  }

  // TextEditingController usernameController = TextEditingController();
  // TextEditingController passwordController = TextEditingController();
  // TextEditingController emailController = TextEditingController();
  // TextEditingController addressController = TextEditingController();

  // String username = "";
  // String password = "";
  // String email = "";
  // String address = "";

  // void getUserData() {
  //   setState(() {
  //     username = usernameController.text;
  //     password = passwordController.text;
  //     email = emailController.text;
  //     address = addressController.text;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "New User",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.green.shade400,
      ),
      body: Center(
        child: Container(
          width: 350, // Adjust the width as needed
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 40, 40),
                child: Text(
                  "Add User",
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                child: TextField(
                  controller: _username,
                  decoration: InputDecoration(
                    labelText: "Username",
                    labelStyle: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    hintText: "Enter Username",
                    hintStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                    ),
                    prefixIcon: Icon(
                      Icons.verified_user,
                      color: Colors.green,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                        style: BorderStyle.solid,
                        color: Colors.green,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                child: TextField(
                  controller: _password,
                  decoration: InputDecoration(
                    labelText: "Password",
                    labelStyle: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    hintText: "Enter Password",
                    hintStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                    ),
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Colors.green,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                        style: BorderStyle.solid,
                        color: Colors.green,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  ),
                  obscureText: true,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                child: TextField(
                  controller: _email,
                  decoration: InputDecoration(
                    labelText: "Email",
                    labelStyle: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    hintText: "Enter Email",
                    hintStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                    ),
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.green,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                        style: BorderStyle.solid,
                        color: Colors.green,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                child: TextField(
                  controller: _address,
                  decoration: InputDecoration(
                    labelText: "Address",
                    labelStyle: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    hintText: "Enter Address",
                    hintStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                    ),
                    prefixIcon: Icon(
                      Icons.location_on,
                      color: Colors.green,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                        style: BorderStyle.solid,
                        color: Colors.green,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  ),
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () async {
                  await insertNewUser();
                  ClearText();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ListAllUser()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                ),
                child: Text("Add User"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
