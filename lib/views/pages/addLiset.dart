import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:todo/models/task_modles.dart';
import 'package:todo/util/database_heloer.dart';
import 'package:todo/views/pages/home.dart';


class AddToDo extends StatelessWidget {
   AddToDo({super.key});
    TextEditingController subtitleController=TextEditingController();
   TextEditingController titleController=TextEditingController();
  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 121, 109, 109),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 121, 109, 109),
          actions: [IconButton(onPressed: () {
TaskModles model=TaskModles(title: titleController.text,subtitle: subtitleController.text);
           DataBaseHelper.addTask( model);
           DataBaseHelper.getTask();
           
       Get.back();

          }, icon: Icon(Icons.check))],
        ),
        body: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
      decoration:  BoxDecoration(color: const Color.fromARGB(255, 121, 109, 109),
      borderRadius: BorderRadius.circular(20)
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      child:  ListTile(
        //title 
        title: TextField(
          controller:titleController,
       style: TextStyle(color: Colors.white),
       decoration: InputDecoration(
         border: OutlineInputBorder(borderSide: BorderSide.none),
         hintText: 'Title',
         hintStyle: TextStyle(color: Colors.white,fontSize: 20)
       ),
        ),
        //subtitle(Not)
      subtitle: TextField(
       controller: subtitleController,
       
       style: TextStyle(color: Colors.white,fontSize: 25),
       decoration: InputDecoration(
         border: OutlineInputBorder(borderSide: BorderSide.none),
         hintText: 'ToDo',
         hintStyle: TextStyle(color: Colors.white,fontSize: 30)
       ),
        ),
      ),
    ),
                Container(
                  color: Colors.black38,
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.check_circle_outline,
                          color: Color.fromARGB(255, 220, 217, 217),
                          size: 40,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.star_border,
                          color: Color.fromARGB(255, 220, 217, 217),
                          size: 40,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.delete_outlined,
                          color: Color.fromARGB(255, 220, 217, 217),
                          size: 40,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )));
  }
}
