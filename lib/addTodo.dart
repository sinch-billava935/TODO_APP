// ignore: file_names
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AddTodo extends StatefulWidget {
  final Function({required String todoText}) addTodo;

  const AddTodo({super.key, required this.addTodo});

  @override
  State<AddTodo> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<AddTodo> {
  TextEditingController todoText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Add Todo:"),
        TextField(
          onSubmitted: (value) {
            if (todoText.text.isNotEmpty) {
              widget.addTodo(todoText: todoText.text);
            }
            todoText.text = "";
          },
          autofocus: true,
          controller: todoText,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(5),
            hintText: "Write here...",
          ),
        ), //explore the textfield it has so much in there
        ElevatedButton(
          onPressed: () {
            if (kDebugMode) {
              print(todoText.text);
            }
            if (todoText.text.isNotEmpty) {
              //function call in child widget
              widget.addTodo(todoText: todoText.text);
            }
            todoText.text =
                ""; //after adding the text the text in the textfield will be empty
          },
          child: Text('Add'),
        ),
      ],
    );
  }
}
