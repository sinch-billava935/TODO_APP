// ignore: file_names
import 'package:flutter/material.dart';

class todoListBuilder extends StatefulWidget {
  List<String> todoList;
  final VoidCallback updateLocalData;
  todoListBuilder({
    super.key,
    required this.todoList,
    required this.updateLocalData,
  });
  @override
  State<todoListBuilder> createState() => _todoListBuilderState();
}

class _todoListBuilderState extends State<todoListBuilder> {
  void onItemClicked({required int index}) {
    showModalBottomSheet(
      //button sheet for each todo
      context: context,
      builder: (context) {
        return Container(
          width: double.infinity,
          padding: EdgeInsets.all(20),
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                widget.todoList.removeAt(index);
              });
              widget.updateLocalData(); //same when removed too
              Navigator.pop(context);
            },
            child: Text('Mark as done!'),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return (widget.todoList.isEmpty)
        ? Center(child: Text("No items on your todo list"))
        : ListView.builder(
          itemCount: widget.todoList.length,
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
              key: UniqueKey(),
              direction: DismissDirection.startToEnd,
              background: Container(
                color: Colors.green,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.check),
                    ),
                  ],
                ),
              ),
              onDismissed: (direction) {
                setState(() {
                  widget.todoList.removeAt(index);
                });
                widget.updateLocalData();
              },
              child: ListTile(
                onTap: () {
                  onItemClicked(index: index);
                },
                title: Text(widget.todoList[index]),
              ),
            );
          },
        );
  }
}
