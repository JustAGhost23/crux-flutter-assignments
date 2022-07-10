//Emulator: Pixel 4a API 31

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Assignment 1",
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //Background and AppBar
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.purple.shade400, Colors.orange.shade200]
        )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          toolbarHeight: 20,
          backgroundColor: Colors.orange.shade700,
          elevation: 0
        ),
        body: Center(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 190),
                child: Row(
                  children: [
                    Container(
                      //Top Left DeepPurple Box
                      decoration: const BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          bottomRight: Radius.circular(50)
                        )
                      ),
                      height: 135,
                      width: 135,
                      margin: const EdgeInsets.only(left: 25),
                    ),
                    const Spacer(),
                    Container(
                      //Top Right DeepPurple Box
                      decoration: const BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(50),
                          bottomLeft: Radius.circular(50))),
                      height: 135,
                      width: 135,
                      margin: const EdgeInsets.only(right: 25),
                    )
                  ],
                )
              ),
              Container(
                //Central Purple Box
                margin: const EdgeInsets.only(top: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.purple,
                        borderRadius: BorderRadius.all(Radius.circular(25))
                      ),
                      height: 105,
                      width: 75,
                    )
                  ],
                )
              ),
              Container(
                //Black Box just below the central Purple Box
                margin: const EdgeInsets.only(top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30)
                        )
                      ),
                      height: 40,
                      width: 250
                    )
                  ],
                )
              ),
              Container(
                margin: const EdgeInsets.only(top: 20, left: 70, right: 70),
                child: Row(
                  children: [
                    Container(
                      //Leftmost Circle
                      decoration: const BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.all(Radius.circular(20))
                      ),
                      height: 40,
                      width: 40,
                    ),
                    const Spacer(),
                    Container(
                      //Circle to the right of the Leftmost Circle
                      decoration: const BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.all(Radius.circular(20))
                      ),
                      height: 40,
                      width: 40,
                    ),
                    const Spacer(),
                    Container(
                      //Circle to the left of the Rightmost Circle
                      decoration: const BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.all(Radius.circular(20))
                      ),
                      height: 40,
                      width: 40,
                    ),
                    const Spacer(),
                    Container(
                      //Rightmost Circle
                      decoration: const BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.all(Radius.circular(20))
                      ),
                      height: 40,
                      width: 40,
                    )
                  ],
                )
              )
            ],
          )
        )
      )
    );
  }
}
