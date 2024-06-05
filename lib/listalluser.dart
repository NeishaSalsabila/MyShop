import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:myshopneisha/insertuser.dart';

class ListAllUser extends StatefulWidget {
  const ListAllUser({super.key});

  @override
  State<ListAllUser> createState() => _ListAllUserState();
}

class _ListAllUserState extends State<ListAllUser> {
  List listAllUser = [];
  @override
  void initState() {
    allUser();
    super.initState();
  }

  Future<void> allUser() async {
    String url_all_user = "https://neishasalsabila.000webhostapp.com/getdatauser.php";
    try {
      var response = await http.get(Uri.parse(url_all_user));
      listAllUser = jsonDecode(response.body);
      setState(() {
        listAllUser = jsonDecode(response.body);
      });
    } catch (exc) {
      print(exc);
    }
  }

  Future<void> deleteUser(String id) async {
    String urlDeleteUser = "https://neishasalsabila.000webhostapp.com/deleteuser.php";
    try {
      var responseDelete =
          await http.post(Uri.parse(urlDeleteUser), body: {"id": id});
      var deleteUser = jsonDecode(responseDelete.body);
      if (deleteUser["success"] == true) {
        allUser();
        print("Hapus Data User berhasil");
      } else {
        print("Hapus Data User gagal");
      }
    } catch (exc) {
      print(exc);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.menu_book,
          color: Colors.white,
          size: 24,
        ),
        title: Text(
          "All User Account",
          style: TextStyle(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.green.shade200,
        actions: [
          Icon(
            Icons.search,
            color: Colors.white,
            size: 24,
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: listAllUser.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              leading: Icon(Icons.person_add_alt_rounded,
                  color: Colors.red, size: 24),
              title: Text(
                listAllUser[index]["username"],
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                listAllUser[index]["address"],
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 13,
                    fontWeight: FontWeight.normal),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(CupertinoIcons.add_circled_solid,
                          color: Colors.red, size: 24)),
                  IconButton(
                      onPressed: () {
                        deleteUser(listAllUser[index]["id"]);
                        allUser();
                      },
                      icon: Icon(CupertinoIcons.delete_left_fill,
                          color: Colors.green.shade300, size: 24)),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => InsertUser()),
          );
        },
        splashColor: Colors.green,
        backgroundColor: Colors.green.shade200,
        child: Icon(
          Icons.add,
          size: 20,
          color: Colors.white,
        ),
      ),
    );
  }
}