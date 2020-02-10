import 'package:db_tester/local/app_database.dart';
import 'package:db_tester/local/dao/student_dao.dart';
import 'package:flutter/material.dart';
import 'package:getflutter/components/appbar/gf_appbar.dart';
import 'package:getflutter/components/card/gf_card.dart';
import 'package:getflutter/components/list_tile/gf_list_tile.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class StudentDetail extends StatefulWidget {

  final int studentId;
  final String studentName;

  StudentDetail({
    @required this.studentId,
    @required this.studentName
  });

  @override
  _StudentDetailState createState() => _StudentDetailState();
}

class _StudentDetailState extends State<StudentDetail> {

  final _format = DateFormat('dd/MM/yyyy');
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GFAppBar(
        title: Text(widget.studentName),
      ),
      body: _buildStudent(),
    );
  }

  FutureBuilder _buildStudent() {
    return FutureBuilder<Student>(
      future: Provider.of<StudentDao>(context, listen: false).getStudent(widget.studentId),
      builder: (context, AsyncSnapshot<Student> snapshot) {
        if(snapshot.connectionState == ConnectionState.done) {
          if(snapshot.hasError) {
            print(snapshot.error.toString());
          }
          final student = snapshot.data;

          return Container(
            child: Column(
              children: <Widget>[
                Text("Student Name : ${student.name}"),
                Text("Address : ${student.address}"),
                Text("Phone No : ${student.phone}"),
                student.dob != null ? Text("DOB : ${_format.format(student.dob)}") : Text("DOB : not specified")

              ],
            ),
          );
        } else {
          return Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
