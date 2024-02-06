import 'package:chandru_db/form_screen.dart';
import 'package:flutter/material.dart';

class BankScreen extends StatefulWidget {
  const BankScreen({super.key});

  @override
  State<BankScreen> createState() => _BankScreenState();
}

class _BankScreenState extends State<BankScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bank Details'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('------>Launch Bank Details');
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => BankDetailsFormScreen()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
