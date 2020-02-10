import 'package:db_tester/local/app_database.dart';
import 'package:db_tester/local/dao/student_dao.dart';
import 'package:db_tester/ui/my_home.dart';
import 'package:db_tester/utils/server_key.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stetho/flutter_stetho.dart';
import 'package:provider/provider.dart';

void main() {
  Stetho.initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<StudentDao>(
          create: (_) => AppDatabase().studentDao,
        ),
        Provider<ServerKey>(
          create: (_) => ServerKey(),
        )
      ],
      child: MaterialApp(
        theme: ThemeData(
            primaryColor: Colors.blueAccent
        ),
        home: MyHome(),
      ),
    );
  }
}

