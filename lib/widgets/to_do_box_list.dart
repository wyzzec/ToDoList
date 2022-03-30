import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:to_do_list/widgets/to_do.dart';

class ToDoBoxList extends StatelessWidget {
  ToDoBoxList({Key? key, required this.toDo, required this.onDelete}) : super(key: key);
  ToDo toDo;
  Function(ToDo) onDelete;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Slidable(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.grey[200],
          ),
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                DateFormat('dd/MM/yyyy - hh:mm:ss aaa').format(toDo.date),
                style: TextStyle(
                  fontSize: 10,
                ),
              ),
              Text(
                toDo.toDo,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        actionPane: const SlidableDrawerActionPane(),
        secondaryActions: [
          IconSlideAction(
            color: Colors.red,
            icon: Icons.delete,
            caption: 'Delete',
            onTap: () {
              onDelete(toDo);
            },
          ),
        ],
      ),
    );
  }
}
