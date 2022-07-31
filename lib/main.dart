import 'package:flutter/material.dart';

// Runs the app
void main() {
  runApp(MyApp());
}

// StatelessWidget means screen will never change
class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String buttonName = 'Click'; // Name of Button

//Matereial App & Scaffold are the most important parts of app
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Welcome'),
        ), //App Bar at top of screen

        body: Center(
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                buttonName = 'clicked';
              });
            },
            child: Text(buttonName),
          ),
        ),

        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: 'Settings',
              icon: Icon(Icons.settings),
            )
          ],
        ),
      ),
    );
  }
}
