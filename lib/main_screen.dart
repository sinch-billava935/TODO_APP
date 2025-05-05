import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:feather_icons/feather_icons.dart';
import 'package:todo_app/addTodo.dart';
import 'package:todo_app/widgets/todoList.dart';
import 'package:url_launcher/url_launcher.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<String> todoList = [];

  void addTodo({required String todoText}) {
    if (todoList.contains(todoText)) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Already Exists'),
            content: Text('This todo already exists.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Close'),
              ),
            ],
          );
        },
      );
      return; // Prevent further execution
    }

    setState(() {
      todoList.insert(0, todoText);
    });
    updateLocalData();
    Navigator.pop(context); // Only pop when item is added
  }

  void updateLocalData() async {
    // Obtain shared preferences.
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    // Save an list of strings to 'items' key.
    await prefs.setStringList('todoList', todoList);
  }

  void localData() async {
    // Obtain shared preferences.
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      todoList = (prefs.getStringList("todoList") ?? []);
    });
  }

  void showAddTodoBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Container(
            //this is the child
            padding: EdgeInsets.all(20),
            height: 250,
            child: AddTodo(
              addTodo: addTodo,
            ), //function passed from parent to child
          ),
        );
      },
    );
  }

  @override
  void initState() {
    //to presevre the loaded todo after hot restart
    super.initState();
    localData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        backgroundColor: const Color.fromARGB(255, 61, 118, 147),
        child: Icon(Icons.add, color: const Color.fromARGB(255, 255, 255, 255)),
        onPressed: showAddTodoBottomSheet,
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              color: const Color.fromARGB(255, 42, 64, 75),
              height: 200,
              width: double.infinity,
              child: Center(
                child: Text(
                  "Todo App",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            ListTile(
              onTap: () {
                launchUrl(
                  Uri.parse(
                    "https://sinch-billava935.github.io/Portfolio-Website/",
                  ),
                );
              },
              leading: Icon(Icons.person),
              title: Text(
                "About Me",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              onTap: () {
                launchUrl(
                  Uri.parse("mailto:sinchana@example.com"),
                ); //mailto will be helped in mail access
              },
              leading: Icon(Icons.email),
              title: Text(
                "Contact me",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(centerTitle: true, title: Text('TODO APP')),
      body: todoListBuilder(
        todoList: todoList,
        updateLocalData: updateLocalData,
      ), //called for the child here
    );
  }
}
