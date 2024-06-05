import 'package:flutter/material.dart';

class DataMahasiswa extends StatefulWidget {
  const DataMahasiswa({Key? key});

  @override
  State<DataMahasiswa> createState() => _DataMahasiswaState();
}

class _DataMahasiswaState extends State<DataMahasiswa> {
  TextEditingController studentNameController = TextEditingController();
  TextEditingController courseNameController = TextEditingController();
  TextEditingController sksCreditController = TextEditingController();

  String namestudent = "";
  String nameCourse = "";
  String sksCredit = "";

  void getStudentData() {
    setState(() {
      namestudent = studentNameController.text;
      nameCourse = courseNameController.text;
      sksCredit = sksCreditController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Politeknik Negeri Padang",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue.shade400,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 40, 0),
              child: Text(
                "Data Mahasiswa Teknologi Informasi",
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: TextField(
                controller: studentNameController,
                decoration: const InputDecoration(
                  labelText: "Student Name",
                  labelStyle: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  hintText: "Enter student name",
                  hintStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                  ),
                  suffixIcon: Align(
                    widthFactor: 1.0,
                    heightFactor: 1.0,
                    child: Icon(
                      Icons.face_2_sharp,
                      color: Colors.blue,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 2,
                      style: BorderStyle.solid,
                      color: Colors.blue,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                  ),
                ),
                maxLength: 30,
              ),
            ),
            Padding(
               padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: TextField(
                controller: courseNameController,
                decoration: const InputDecoration(
                  labelText: "Course Name",
                  labelStyle: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  hintText: "Enter course name",
                  hintStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                  ),
                  suffixIcon: Align(
                    widthFactor: 1.0,
                    heightFactor: 1.0,
                    child: Icon(
                      Icons.book,
                      color: Colors.blue,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 2,
                      style: BorderStyle.solid,
                      color: Colors.blue,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                  ),
                ),
                maxLength: 30,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: TextField(
                controller: sksCreditController,
                decoration: const InputDecoration(
                  labelText: "SKS Credit",
                  labelStyle: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  hintText: "Enter SKS credit",
                  hintStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                  ),
                  suffixIcon: Align(
                    widthFactor: 1.0,
                    heightFactor: 1.0,
                    child: Icon(
                      Icons.credit_card,
                      color: Colors.blue,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 2,
                      style: BorderStyle.solid,
                      color: Colors.blue,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                  ),
                ),
                maxLength: 30,
              ),
            ),
            SizedBox(
              width: 160,
              height: 60,
              child: ElevatedButton(
                onPressed: getStudentData,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade50,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 2,
                      style: BorderStyle.solid,
                      color: Colors.blue,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                  ),
                ),
                child: Text(
                  "Entri Data Student",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Text(
                "Student Data:\nStudent Name: $namestudent\nCourse Name: $nameCourse\nSKS Credit: $sksCredit",
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
