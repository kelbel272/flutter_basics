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
  int currentIndex = 0;

//Matereial App & Scaffold are the most important parts of app
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //Removes debug banner from app

      home: Scaffold(
        appBar: AppBar(
          title: const Text('Welcome'),
        ), //App Bar at top of screen

        // Centers everything in the body
        body: Center(
          // If the current index is Home, display the container
          child: currentIndex == 0
              ? Container(
                  //Size of the container
                  width: double.infinity,
                  height: double.infinity,

                  color: Colors.blue[100], //Background color

                  child: Row(
                    // y-axis allignment
                    mainAxisAlignment: MainAxisAlignment.center,

                    //Button column
                    children: [
                      ElevatedButton(
                        //Style of the button
                        //ElevatedButton.styleFrom() restyles a button
                        style: ElevatedButton.styleFrom(
                          //onPrimary colors the button font
                          onPrimary: Colors.white,

                          //primary colors the button
                          primary: Colors.orange,
                        ),
                        onPressed: () {
                          setState(() {
                            buttonName = 'clicked';
                          });
                        },
                        child: Text(buttonName),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            buttonName = 'clicked';
                          });
                        },
                        child: Text(buttonName),
                      ),
                    ],
                  ),
                )
              // If home not selected, display the image from url
              : Image.asset('images/deep-space.jpg'),
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

          //Highlights selected nav button
          currentIndex: currentIndex,
          onTap: (int index) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
