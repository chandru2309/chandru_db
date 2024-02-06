import 'dart:ffi';

import 'package:chandru_db/helper.dart';
import 'package:chandru_db/list_screen.dart';
import 'package:chandru_db/main.dart';
import 'package:flutter/material.dart';

class BankDetailsFormScreen extends StatefulWidget {
  const BankDetailsFormScreen({super.key});

  @override
  State<BankDetailsFormScreen> createState() => _BankDetailsFormScreenState();
}

class _BankDetailsFormScreenState extends State<BankDetailsFormScreen> {
  var _bankNameController = TextEditingController();
  var _branchNameController=TextEditingController();
  var _accountTypeController=TextEditingController();
  var _ifscCodeController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bank Account Details Form'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _bankNameController,
                  decoration: InputDecoration(
border: OutlineInputBorder(
),
                    labelText: 'Bank Name',
                    hintText: 'Enter Your Bank Name'
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _branchNameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                  ),
                  labelText: 'Branch Name',
                  hintText: 'Enter Your Branch Name'
                ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _accountTypeController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Account Type',
                    hintText: 'Enter Your Account Type',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _ifscCodeController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'IFSC Code',
                    hintText: 'Enter Your IFSC Code',
                  ),
                ),
              ),
              ElevatedButton(onPressed: (){
print('----> Save Button Clicked');
_save();
              },
                child: Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
  void _save() async{
    print('----->_save');
    print('---->Bank Name:${_bankNameController.text}');
    print('---->Branch Name:${_branchNameController.text}');
    print('----->Account Type:${_accountTypeController.text}');
    print('----->IFSC Code:${_ifscCodeController.text}');

    Map<String, dynamic>row={
DataBaseHelper.columnBankName:_bankNameController.text,
      DataBaseHelper.columnBranchName:_branchNameController.text,
      DataBaseHelper.columnAccountType:_accountTypeController.text,
      DataBaseHelper.columnIFSCCode:_ifscCodeController.text,
    };
final result=await dbHelper.insertbankdetails(row);
print('-------------------$result');
Navigator.of(context).push(MaterialPageRoute(builder: (context)=>BankScreen()));
}


}

