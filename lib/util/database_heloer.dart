import 'dart:developer';

import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo/controller/task_controllers.dart';
import 'package:todo/models/task_modles.dart';
import 'package:todo/views/pages/widgets/taskitem_widget.dart';

class DataBaseHelper {
//propertey
  static  Database? _db;
//fanction
  static initDataBase() async {
    // open the database
    _db = await openDatabase(
      'todo.db',
      version: 1,
      onCreate: (Database db, int version) async {
        log('new');
        // When creating the db, create the table
        await db.execute(
            'CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, subtitle TEXt)');
      },
      onOpen: (db) {
        log('open');
      },
    );
  }

  static addTask(TaskModles taskModles) async {
    await _db!.transaction((txn) async {
      int rowId = await txn.rawInsert(
          'INSERT INTO Tasks(title,subtitle)VALUES("${taskModles.title}","${taskModles.subtitle}")');
      log('Row add $rowId');
    });
    
  }
  static getTask()async{
    Get.put(taskController()).taskListe.clear();
    // Get the records
List<Map<String,dynamic>> list = await _db!.rawQuery('SELECT * FROM Tasks');
log(list.toString());
for(Map<String,dynamic> item in list){
  var model = TaskModles.fromjson(item);
  Get.put(taskController()).taskListe.add(model);

}

  }
 static Future<void> deleteTask(int id) async {
  // Delete a record
   _db!.rawDelete('DELETE FROM Tasks WHERE id= $id').then((value) {
     print('row dleat scseflly');
     getTask();
   });
}
}
