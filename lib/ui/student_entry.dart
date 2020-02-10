import 'package:db_tester/local/app_database.dart';
import 'package:db_tester/local/dao/student_dao.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class StudentEntry extends StatefulWidget {
  @override
  _StudentEntryState createState() => _StudentEntryState();
}

class _StudentEntryState extends State<StudentEntry> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _dobController = TextEditingController(text: null);
  final TextEditingController _phoneController = TextEditingController(text: "09");

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _addressController.dispose();
    _dobController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student Entry"),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  child: TextFormField(
                    controller: _nameController,
                    maxLines: 1,
                    validator: (value) {
                      if(value.length < 1 || value.length > 255) {
                        return "Name must be within 1 to 255 characters";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        hintText: "Your name",
                        labelText: "Student Name",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)
                      )
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                ),
                Container(
                  child: TextFormField(
                    controller: _addressController,
                    maxLines: 10,
                    validator: (value) {
                      if(value.length < 4 || value.length > 255) {
                        return "Address must be within 4 to 255 characters";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        hintText: "Your address",
                        labelText: "Student Address",
                        alignLabelWithHint: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)
                      )
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                ),
                InkWell(
                  onTap: () async {
                    Future<DateTime> selectedDate = showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1970),
                      lastDate: DateTime(2030),
                      builder: (BuildContext context, Widget child) {
                        return Theme(
                          data: ThemeData.light(),
                          child: child,
                        );
                      },
                    );
                    selectedDate.then((onValue) => _dobController.text = onValue.toString());
                  },
                  child: Container(
                    child: TextFormField(
                      enabled: false,
                      controller: _dobController,
                      maxLines: 1,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.date_range),
                          hintText: "Date of birth",
                          disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0)
                          ),

                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                ),
                Container(
                  child: TextFormField(
                    controller: _phoneController,
                    inputFormatters: [
                      WhitelistingTextInputFormatter.digitsOnly
                    ],
                    maxLines: 1,
                    validator: (value) {
                      RegExp exp = RegExp(r'^[0-9]+$');
                      if(!exp.hasMatch(value) || value.length < 6) {
                        return "Phone format invalid";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                        hintText: "Your phone",
                        labelText: "Phone No.",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)
                        )
                    ),
                  ),
                ),
              ],
            ),
          )
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if(_formKey.currentState.validate()) {
            Student student = Student(
              id: null,
              name: _nameController.text,
              address: _addressController.text,
              phone: _phoneController.text,
              dob: DateTime.parse(_dobController.text)
            );
            await Provider.of<StudentDao>(context, listen: false).insertStudent(student);
            Navigator.pop(context);
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
