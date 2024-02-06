
import 'package:chandru_db/form_screen.dart';
import 'package:chandru_db/helper.dart';
import 'package:chandru_db/list_screen.dart';
import 'package:flutter/material.dart';
final dbHelper=DataBaseHelper();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
await dbHelper.initialization();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: BankScreen());
  }
}
