import 'package:flutter/material.dart';
import 'package:todo/constants/colours.dart';
import 'package:todo/model/todo.dart';

class ToDoItem extends StatelessWidget{
  final ToDo todoData;
  final onTodoChanged;
  final onDelete;

  ToDoItem({
    required this.todoData,
    required this.onTodoChanged,
    required this.onDelete,
    });



  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
          onTodoChanged(todoData);
        },
        tileColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),

        leading: Icon(
          todoData.isDone? Icons.check_box : Icons.check_box_outline_blank, 
          color: tdBlue,),

        title: Text(
          todoData.todoText!, 
          style: TextStyle(
            color: tdBlack, 
            fontSize: 15, 
            fontWeight: FontWeight.w500, 
            decoration: todoData.isDone? TextDecoration.lineThrough : null
            ),
          ),

        trailing: Container(
          padding: EdgeInsets.all(0),
          margin: EdgeInsets.symmetric(vertical: 12),
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: tdRed,
            borderRadius: BorderRadius.circular(7)
          ),
          child: IconButton(
            icon: Icon(Icons.delete), 
            color: Colors.white,
            iconSize: 18,
            onPressed: () {
              onDelete(todoData.id);
            }
          ),
        ),
      )
    );
  }
  
}