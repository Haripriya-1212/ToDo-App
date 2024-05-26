import 'package:flutter/material.dart';
import 'package:todo/constants/colours.dart';
import 'package:todo/model/todo.dart';
import 'package:todo/widgets/todoItem.dart';

class Home extends StatefulWidget{

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todosList = ToDo.todoList();
  final addTodoTextController = TextEditingController();
  List<ToDo> foundTodo = [];

  @override
  void initState() {
    // TODO: implement initState
    foundTodo = todosList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: tdBGColor,
      appBar: AppBar(
        backgroundColor: tdBGColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.menu, color: tdBlack, size: 30,),
            Icon(Icons.notifications, color: tdBlack, size: 30)
          ]
          ),
      ),
      body: Stack(
        children: [
          Container(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              SizedBox(height: 20,),
              searchBox(),
              Expanded(
                child: ListView(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top:40, bottom: 20),
                      child: Text(
                        'All ToDos',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 30,
                        ),
                        ),
                    ),
                    for(ToDo todoitem in foundTodo)
                      ToDoItem(
                        todoData: todoitem,
                        onTodoChanged: _handleTodoChange,
                        onDelete: _deleteTodo,
                      ),
        
                  ],
                ),
              )
            ]
            ),
        ),


        Align(
          alignment: Alignment.bottomCenter,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(bottom: 20, right: 20, left: 20),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 0.0),
                      blurRadius: 10.0,
                      spreadRadius: 0.0
                    )]
                  ),

                  child: TextField(
                    controller: addTodoTextController,
                    decoration: InputDecoration(
                      hintText: 'Add a new todo',
                      border: InputBorder.none
                    ),
                  ),
                )
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20, right: 20),
                child: ElevatedButton(
                  onPressed: (){
                    _addToDoItem(addTodoTextController.text);
                  }, 
                  child: Text('+', style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500),),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: tdBlue,
                    foregroundColor: Colors.white,
                    minimumSize: Size(60, 60),
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                    )
                  ),
                ),
              )
            ],
          ),
        )
        ]
      ),
    );


  }

  void _handleTodoChange(ToDo todo){
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _deleteTodo(String id){
    setState(() {
      todosList.removeWhere((item) => item.id == id);
    });
  }

  void _addToDoItem(String todoStr){
    setState(() {
      todosList.add(ToDo(id: DateTime.now().toString(), todoText: todoStr));
    });
    addTodoTextController.clear();
  }

  void _runFilter(String enteredKeyword){    
    List<ToDo> searchResults = [];
    if(enteredKeyword.isEmpty){
      searchResults = todosList;
    }
    else{
      searchResults = todosList.where((item) => item.todoText!.toLowerCase().contains(enteredKeyword.toLowerCase())).toList();
    }

    setState(() {
      foundTodo = searchResults;
    });
  }

  Widget searchBox(){
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: TextField(
          onChanged: (value) => _runFilter(value),
          decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(Icons.search),
            hintText: 'Search',
            hintStyle: TextStyle(color: tdGrey)
          ),
        ),
      );
    }
}


