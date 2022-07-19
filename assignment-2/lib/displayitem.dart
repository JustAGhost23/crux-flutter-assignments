import 'package:assignment/todoitem.dart';
import 'package:flutter/material.dart';

class DisplayItem extends StatelessWidget {
  const DisplayItem({Key? key, required this.item}) : super(key: key);

  final TodoItem item;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(item.title),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text(
          item.description,
          style: TextStyle(
            fontSize: height / 30,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
