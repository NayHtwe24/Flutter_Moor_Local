import 'package:db_tester/animation/scale_route.dart';
import 'package:db_tester/local/app_database.dart';
import 'package:db_tester/local/dao/student_dao.dart';
import 'package:db_tester/ui/new_student_entry.dart';
import 'package:db_tester/ui/student_detail.dart';
import 'package:db_tester/ui/student_entry.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student Entry"),
      ),
      body: _builtAllStudents(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
            Navigator.push(context, ScaleRoute(page: NewStudentEntry()));
        },
        child: Icon(Icons.add),
      ),

    );
  }

  FutureBuilder _builtAllStudents() {
    return FutureBuilder<List<Student>>(
      future: Provider.of<StudentDao>(context, listen: false).getAllStudents(),
      builder: (context, AsyncSnapshot<List<Student>> snapshot) {
        if(snapshot.connectionState == ConnectionState.done) {
            if(snapshot.hasError) {
              return Container(
                child: Center(
                  child: Text(snapshot.error.toString()),
                ),
              );
            }
            final students = snapshot.data;
            return _listStudent(students);
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

  ListView _listStudent(List<Student> students) {
    return ListView.builder(
      itemCount: students.length,
      itemBuilder: (_, index) {
        return Card(
          child: Container(
            child: InkWell(
              child: ListTile(
                leading: Icon(Icons.person),
                title: Text(students[index].name),
                subtitle: Text(students[index].address),
              ),
              onTap: () {
                Navigator.push(context, ScaleRoute(page: StudentDetail(
                  studentId: students[index].id,
                  studentName: students[index].name,
                )));
              },
            ),
          ),
        );
      },
    );
  }
}
