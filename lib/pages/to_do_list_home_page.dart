import 'package:flutter/material.dart';
import 'package:to_do_list/widgets/to_do_box_list.dart';
import 'package:to_do_list/widgets/to_do.dart';

class ToDoListHomePage extends StatefulWidget {
  const ToDoListHomePage({Key? key}) : super(key: key);

  @override
  State<ToDoListHomePage> createState() => _ToDoListHomePageState();
}

class _ToDoListHomePageState extends State<ToDoListHomePage> {
  List<ToDo> toDos = [];

  final TextEditingController toDoController = TextEditingController();

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
                      controller: toDoController,
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
                      String toDo = toDoController.text;
                      setState(() {
                        ToDo newTodo = ToDo(toDo: toDo, date: DateTime.now());
                        toDos.add(newTodo);
                        toDoController.clear();
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
                  for (ToDo toDo in toDos)
                    ToDoBoxList(
                      toDo: toDo,
                      onDelete: onDelete,
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
                      '${toDos.length} tasks to do',
                      style: const TextStyle(),
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      List<ToDo> undoListToDosSaver;
                      undoListToDosSaver = toDos;
                      deleteAllToDosConfirmationDialog();
                    },
                    child: const Text('Clear all'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onDelete(ToDo toDo) {
    final ToDo undoSaver = toDo;
    final int undoSaverPos = toDos.indexOf(toDo);
    setState(() {
      toDos.remove(toDo);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          '${toDo.toDo} has been removed.',
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black87,
        action: SnackBarAction(
          label: 'Undo',
          textColor: Colors.blue,
          onPressed: () {
            setState(() {
              toDos.insert(undoSaverPos, undoSaver);
            });
          },
        ),
      ),
    );
  }
  void deleteAllToDos(){
    setState(() {
      toDos.clear();
    });
  }


  void deleteAllToDosConfirmationDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Clear all'),
        content: const Text('Are you sure?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              deleteAllToDos();
            },
            style: TextButton.styleFrom(primary: Colors.red),
            child: const Text('Clear'),
          ),
        ],
      ),
    );
  }
}
