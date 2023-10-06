import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Project",
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget{
  const MyHomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return MyHomePageUI();
  }
}

class MyHomePageUI extends State<MyHomePage>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Icon(Icons.search, color: Colors.black,),
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              "My Bag",
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [

              ],
            )
          ],
        ),
      ),
    );
  }
}