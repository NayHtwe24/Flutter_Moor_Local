import 'package:db_tester/local/app_database.dart';
import 'package:db_tester/local/dao/student_dao.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';


class NewStudentEntry extends StatefulWidget {
  @override
  _StudentEntryState createState() => _StudentEntryState();
}

class _StudentEntryState extends State<NewStudentEntry> {
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  bool autovalidate = false;



  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student Entry"),
      ),
      body: FormBuilder(
        key: _fbKey,
        autovalidate: false,
        child: Container(
            padding: EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                FormBuilderTextField(
                  attribute: 'name',
                  validators: [FormBuilderValidators.required(),FormBuilderValidators.min(1)],
                  decoration: InputDecoration(
                      hintText: "Your name",
                      labelText: "Student Name",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)
                      )
                  ),
                ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.0),
                  ),
                  FormBuilderTextField(
                    attribute: 'address',
                    maxLines: 10,
                    validators: [FormBuilderValidators.required(),FormBuilderValidators.minLength(4)],
                    decoration: InputDecoration(
                        hintText: "Your address",
                        labelText: "Student Address",
                        alignLabelWithHint: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)
                        )
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.0),
                  ),
                  FormBuilderTextField(
                    attribute: 'phone',
                    validators: [FormBuilderValidators.required(),FormBuilderValidators.numeric(),FormBuilderValidators.minLength(4)],
                    decoration: InputDecoration(
                        hintText: "Your phone",
                        labelText: "Phone No.",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)
                        )
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.0),
                  ),
                  FormBuilderDateTimePicker(
                    attribute: 'dob',
                    inputType: InputType.date,
                    format: DateFormat('yyyy-MM-dd'),
                    decoration: InputDecoration(
                      filled: true,
                      labelText: 'DOB',
                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)
                      ),
                    ),
                    validators: [
                      FormBuilderValidators.required(
                        errorText: 'Please Insert Date',
                      )
                    ],
                  ),
                ],
              ),
            )
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
            setState(() {
              autovalidate = true;
            });

            if (!_fbKey.currentState.validate()) {
              return;
            }

            _fbKey.currentState.save();
            final inputValues = _fbKey.currentState.value;

            print(inputValues);
            Student student = Student(
                id: null,
                name: inputValues['name'],
                address: inputValues['address'],
                phone: inputValues['phone'],
                dob: inputValues['dob']
            );
            await Provider.of<StudentDao>(context, listen: false).insertStudent(student);
            Navigator.pop(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
