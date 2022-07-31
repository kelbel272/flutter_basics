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
//Matereial App & Scaffold are the most important parts of app
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //Removes debug banner from app

      home: MyAppExtension(),
    );
  }
}

class MyAppExtension extends StatefulWidget {
  MyAppExtension({Key? key}) : super(key: key);

  @override
  State<MyAppExtension> createState() => _MyAppExtensionState();
}

class _MyAppExtensionState extends State<MyAppExtension> {
  String buttonName = 'Click'; // Name of Button
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      //When button is pressed, go to the next page
                      onPressed: () {},
                      child: Text(buttonName),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const NextPage(),
                          ),
                        );
                      },
                      child: const Text('Next Page'),
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
    );
  }
}

class NextPage extends StatelessWidget {
  const NextPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
