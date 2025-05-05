// main.dart
import 'package:flutter/material.dart';
import 'package:todo_app/main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 28, 63, 92),
          brightness: Brightness.light,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: const Color.fromARGB(255, 5, 41, 77),
          foregroundColor: const Color.fromARGB(255, 217, 204, 204),
          centerTitle: true,
          elevation: 2,
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: const Color.fromARGB(255, 33, 63, 94),
          foregroundColor: const Color.fromARGB(255, 236, 190, 190),
        ),
        drawerTheme: DrawerThemeData(backgroundColor: Colors.blue.shade50),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(foregroundColor: Colors.blue.shade700),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 9, 52, 90),
            foregroundColor: Colors.white,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: const Color.fromARGB(255, 14, 50, 81),
              width: 2,
            ),
          ),
        ),
      ),
      home: MainScreen(),
    );
  }
}
