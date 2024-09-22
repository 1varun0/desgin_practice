import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ToDoApp extends StatefulWidget {
  const ToDoApp({super.key});

  @override
  State<ToDoApp> createState() => _ToDoAppState();
}

class _ToDoAppState extends State<ToDoApp> {
  final namecontroller = TextEditingController();
  TodoPriority priority = TodoPriority.medium;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue.shade50,
      appBar: _appbarsection(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addTodo();
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.blue,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

      body: MyTodo.todos.isEmpty
          ? Center(
            child: Text('Nothing to do'),
          )
          : ListView.builder(
              itemCount: MyTodo.todos.length,
              itemBuilder: (context, index) {
                final todo = MyTodo.todos[index];
                return TodoItem(
                  todo: todo,
                  onchanged: (value) {
                    setState(() {
                      MyTodo.todos[index].completed = value;
                    });
                  },
                );
              },
            ),
    );
  }

  AppBar _appbarsection(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
      ),
      title: Text(
        'ToDo',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.blue,
    );
  }

  void addTodo() {
    showModalBottomSheet(
      context: context,
      // isScrollControlled: true,
      builder: (context) => StatefulBuilder(
        builder: (context, setBuilderState) => Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 18.0,
            vertical: 8.0,
          ),
          child: Column(
            children: [
              _inputname(),
              _priorityradio(setBuilderState)
            ],
          ),
        ),
      ),
    );
  }

  TextField _inputname() {
    return TextField(
              controller: namecontroller,
              decoration: InputDecoration(
                hintText: '   Add a task',
                suffixIcon: IconButton(
                  onPressed: _save,
                  icon: Icon(Icons.arrow_circle_up_outlined),
                ),
              ),
            );
  }

  Padding _priorityradio(StateSetter setBuilderState) {
    return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Priority: ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  _lowradio(setBuilderState),
                  _mediumradio(setBuilderState),
                  _highradio(setBuilderState),
                ],
              ),
            );
  }

  Row _highradio(StateSetter setBuilderState) {
    return Row(
                    children: [
                      Radio(
                          value: TodoPriority.high,
                          groupValue: priority,
                          onChanged: (value) {
                            setBuilderState(() {
                              priority = value!;
                            });
                          }),
                      Text('high'),
                    ],
                  );
  }

  Row _mediumradio(StateSetter setBuilderState) {
    return Row(
                    children: [
                      Radio(
                          value: TodoPriority.medium,
                          groupValue: priority,
                          onChanged: (value) {
                            setBuilderState(() {
                              priority = value!;
                            });
                          }),
                      Text('medium'),
                    ],
                  );
  }

  Row _lowradio(StateSetter setBuilderState) {
    return Row(
                    children: [
                      Radio(
                          value: TodoPriority.low,
                          groupValue: priority,
                          onChanged: (value) {
                            setBuilderState(() {
                              priority = value!;
                            });
                          }),
                      Text('low'),
                    ],
                  );
  }

  void _save() {
    if (namecontroller.text.isEmpty) {
      showMsg(context, 'Input must not be empty');
      return;
    }
    final todo = MyTodo(
      id: DateTime.now().millisecondsSinceEpoch,
      name: namecontroller.text,
      priority: priority,
    );

    setState(() {
      MyTodo.todos.add(todo);
      Navigator.pop(context);
      namecontroller.clear();
    });
  }
}

void showMsg(BuildContext context, String s) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(
        'Caution',
      ),
      content: Text(s),
    ),
  );
}

class TodoItem extends StatelessWidget {
  final MyTodo todo;
  final Function(bool) onchanged;

  const TodoItem({super.key, required this.todo, required this.onchanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          color: Colors.lightBlue.shade100,
        ),
        child: CheckboxListTile(
          title: Text(
            todo.name,
            style: TextStyle(
                decoration: todo.completed
                    ? TextDecoration.lineThrough
                    : TextDecoration.none),
          ),
          subtitle: Text('Priority: ${todo.priority.name}'),
          value: todo.completed,
          onChanged: (value) {
            onchanged(value!);
          },
          // tileColor: Colors.lightBlue.shade100,
        ),
      ),
    );
  }
}

class MyTodo {
  int id;
  String name;
  bool completed;
  TodoPriority priority;

  MyTodo({
    required this.id,
    required this.name,
    required this.priority,
    this.completed = false,
  });

  static List<MyTodo> todos = [];
}

enum TodoPriority {
  high,
  low,
  medium,
}
