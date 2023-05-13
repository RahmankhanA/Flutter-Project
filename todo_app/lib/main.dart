import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:todo_app/models/todo_model.dart';

void main() {
  return runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(useMaterial3: true),
      themeMode: ThemeMode.dark,
      home: const MyHomePage(),
    ),
  );
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<TodoModel> todoList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo App'),
        centerTitle: true,
      ),
      body: Visibility(
        replacement: const Center(
          child: Text(
            "Add Some Todo's",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
          ),
        ),
        visible: todoList.isNotEmpty,
        child: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onLongPress: () {
                showPopUp(isUpdate: true, text:todoList[index].name, index: index );
                },
                child: Card(
                  child: ListTile(
                    title: Text(
                      todoList[index].name,
                      style: TextStyle(
                          fontSize: 25,
                          decoration: todoList[index].isCompleted
                              ? TextDecoration.lineThrough
                              : null),
                    ),
                    trailing: Checkbox(
                        value: todoList[index].isCompleted,
                        onChanged: (value) {
                          todoList[index].isCompleted = value!;
                          setState(() {});
                        }),
                  ),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showPopUp(isUpdate: false);
        },
        child: const Icon(
          Icons.add,
          size: 30,
        ),
      ),
    );
  }

  void showPopUp({required bool isUpdate, String text = '', int index = -1}) {
    String inputText = text;
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(isUpdate ? 'Update Todo' : 'Add Todo'),
          content: TextFormField(
            initialValue: inputText,
            decoration: InputDecoration(
              focusedBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
              enabledBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
            ),
            onChanged: (value) {
              inputText = value;
            },
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(120, 40)),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Cance')),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(120, 40)),
                    onPressed: () {
                      if (inputText != '') {
                        try {
                          todoList[index] = TodoModel(name: inputText);
                        } catch (err) {
                          log('error is : $err');
                          todoList.add(TodoModel(name: inputText));
                        }
                        setState(() {});
                        Navigator.pop(context);
                      }
                    },
                    child: Text(isUpdate ? 'Update' : 'Add')),
              ],
            )
          ],
        );
      },
    );
  }
}
