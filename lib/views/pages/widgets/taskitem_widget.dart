import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:todo/controller/task_controllers.dart';
import 'package:todo/models/task_modles.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo/util/database_heloer.dart';

class TaskModl extends StatelessWidget {
  TaskModl({super.key, required this.model});
  TaskModles model;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: StretchMotion(),
        children: [
          SlidableAction(onPressed: (context)async{
           await DataBaseHelper.deleteTask(model.teskId!);
          },
          icon: Icons.delete,foregroundColor: Colors.red,
          backgroundColor:Colors.black ,
         
          
          )
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 121, 109, 109),
            borderRadius: BorderRadius.circular(20)),
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        child: ListTile(
            //title
            title: Text(
              model.title!,
              maxLines: 1,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
            //subtitle(Not)
            subtitle: Text(
              maxLines: 2,
              model.subtitle!,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  overflow: TextOverflow.ellipsis),
            )),
      ),
    );
  }
}
