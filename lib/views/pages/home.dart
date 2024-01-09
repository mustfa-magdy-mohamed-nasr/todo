import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:todo/controller/task_controllers.dart';
import 'package:todo/views/pages/widgets/taskitem_widget.dart';
import '../../util/database_heloer.dart';
import 'addLiset.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController toSearch = TextEditingController();

  var allTaskss = [];
  var items = [];
  @override
  void initState() {
    DataBaseHelper.getTask();
    super.initState();
    // DataBaseHelper.getTask().then((allTasks){
    //   setState(() {
    //     allTaskss=allTasks;
    //     items=allTasks;
    //   });
    // });
  }
  // void filterSearch(String query)async{
  //   var dummSearchList=allTaskss;
  //   if(query.isNotEmpty){
  //     var dummyListData=[];
  //     dummSearchList.forEach((item) {

  //     });
  //   }

  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Center(
              child: Text(
            'To Do',
            style: TextStyle(color: Colors.white),
          )),
          backgroundColor: Colors.black54,
          //icon more
          actions: const [
            Icon(
              Icons.more_vert,
              color: Color.fromARGB(255, 80, 79, 79),
            )
          ],
        ),
        //button add todo
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(AddToDo());
          },
          child: const Icon(Icons.add),
        ),
        body: Column(
          children: [
            //searsh Todo
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 0,
                  ),

                  TextField(
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color.fromARGB(255, 58, 55, 55),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide.none),
                          hintText: 'Search ToDo',
                          suffixIcon: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.search)))),
                  //Text Aoll Nots
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 50, bottom: 20),
                        child: const Text(
                          'All ToDo',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.w500),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),

            Expanded(
                child: Obx(() => ListView.builder(
                    itemCount: Get.put(taskController()).taskListe.length,
                    itemBuilder: (context, index) {
                      return TaskModl(
                          model: Get.put(taskController()).taskListe[index]);
                    })))
          ],
        ),
      ),
    );
  }
}

/*Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 0,
                    ),
                    TextField(
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Color.fromARGB(255, 58, 55, 55),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide.none),
                            hintText: 'Search notes',
                            suffixIcon: IconButton(
                                onPressed: () {}, icon: Icon(Icons.search)))),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 50, bottom: 20),
                          child: Text(
                            'All Notes',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.w500),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
             
            ],
          ),
        ],*/
