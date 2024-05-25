
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/utils/dialog_box.dart';

import '../todo_tile.dart';

class  HomePage extends StatefulWidget {
  const  HomePage({super.key});

  @override
  State< HomePage> createState() => _HomePageState();
}

class _HomePageState extends State< HomePage> {
  //text Controller
  final _controller  = TextEditingController();

  //list of todo tasks
  List toDoList = [
    ["Estudar math" , true],
    ["Estudar Flutter" , false],
    ["Estudar ORGA" , false],
  ];
  // checkbox was tapped
  void checkBoxChanged(bool? value , int index){
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }
  //save new task 
  void saveNewTask(){
    setState(() {
      toDoList.add([_controller.text,false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }
  //create new task
  void createNewTask(){
    showDialog(
        context: context,
        builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave:saveNewTask ,
          onCancel: ()=>Navigator.of(context).pop(),
        );
      },
    );
  }
//create new task
  void deleteTask(int index){
    setState(() {
      toDoList.removeAt(index);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900 ,
      appBar: AppBar(
      backgroundColor: Colors.grey.shade700,
        title: const Text("TO DO" ,
        style: TextStyle(color: Colors.white,)
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context , index){
          return ToDoTile(
          taskName: toDoList[index][0],
          taskCompleted:toDoList[index][1] ,
          onChanged: (value)=> checkBoxChanged(value,index) ,
            deleteFunction: (context)=> deleteTask(index),
        );
      }

      ),

    );
  }
}
