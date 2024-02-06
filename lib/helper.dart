import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseHelper{
  static const dataBaseName='BankDetails.db';
  static const dataBaseVersion=1;
  static const dataBaseTableName='_bankDetailsTable';

  static const columnId='_id';
  static const columnBankName='_bankName';
  static const columnBranchName='_branchName';
  static const columnAccountType='_accountType';
  static const columnIFSCCode='_ifscCode';
late Database _db;
  Future<void>initialization()async{
    final documentsDirectory=await getApplicationDocumentsDirectory();
    final path=join(documentsDirectory.path,dataBaseName);
    _db=await openDatabase(path,
version: dataBaseVersion,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }
  Future _onCreate(Database database, int version) async {
    await database.execute('''
      CREATE TABLE $dataBaseTableName (
      $columnId INTEGER PRIMARY KEY,
      $columnBankName TEXT,
      $columnBranchName TEXT,
      $columnAccountType TEXT,
      $columnIFSCCode TEXT
      )
   ''');
  }
  Future _onUpgrade(Database database, int oldVersion, int newVersion) async {
    await database.execute('DROP TABLE $dataBaseTableName');
    _onCreate(database, newVersion);
  }
  Future<int> insertbankdetails(Map<String, dynamic>row)async{
    return await _db.insert(dataBaseTableName, row);
  }
}

