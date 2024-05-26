import 'package:flutter/material.dart';
import 'package:todo/constants/colours.dart';

class Home extends StatefulWidget{
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
      body: Container(
        child: Column(
          children: [

          ]
          ),
      ),
    );
  }
}

