import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ToDoBoxList extends StatelessWidget {
  ToDoBoxList({Key? key, required this.todo, required this.date}) : super(key: key);
  String todo;
  DateTime date;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.grey[200],
        ),
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              DateFormat('dd/MM/yyyy - h:m:s aaa').format(date),
              style: TextStyle(
                fontSize: 10,
              ),
            ),
            Text(
              todo,
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
