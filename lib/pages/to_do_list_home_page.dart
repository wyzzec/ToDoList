import 'package:flutter/material.dart';
import 'package:to_do_list/widgets/to_do_box_list.dart';
import 'package:to_do_list/widgets/to_do.dart';

class ToDoListHomePage extends StatefulWidget {
  const ToDoListHomePage({Key? key}) : super(key: key);

  @override
  State<ToDoListHomePage> createState() => _ToDoListHomePageState();
}

class _ToDoListHomePageState extends State<ToDoListHomePage> {
  List<ToDo> todos = [];

  final TextEditingController todoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'To do list',
                style: TextStyle(
                  fontSize: 36,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: todoController,
                      decoration: const InputDecoration(
                        labelText: 'Add a task',
                        hintText: 'Ex: studying Flutter',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      String todo = todoController.text;
                      setState(() {
                        ToDo newTodo = ToDo(
                            todo: todo,
                            date: DateTime.now()
                        );
                        todos.add(newTodo);
                        todoController.clear();
                      });
                    },
                    child: const Icon(
                      Icons.add,
                      size: 30,
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      padding: const EdgeInsets.all(13),
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              child: ListView(
                shrinkWrap: true,
                children: [
                  for (ToDo todo in todos)
                    ToDoBoxList(
                      todo: todo.todo,
                      date: todo.date,
                    ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(17),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      '${todos.length} tasks to do',
                      style: TextStyle(),
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Clear all'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void login() {}
