import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Water Tracker",
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return MyHomePageUI();
  }
}

class MyHomePageUI extends State<MyHomePage> {
  final TextEditingController _amountOfGlassTEController = TextEditingController(text: '1');
  List<DateTime> waterConsumeList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Center(
            child: Text(
          "Water Tracker",
          style: TextStyle(color: Colors.black),
        )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              "Total Consume",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              '${waterConsumeList.length}',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 50,
                  child: TextField(
                    controller: _amountOfGlassTEController,
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: () {
                        waterConsumeList.add(DateTime.now());
                        setState(() {});
                      },
                      child: Text("Add")),
                ),
              ],
            ),
            Expanded(child: ListView.builder(
                itemCount: waterConsumeList.length,
                itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  leading: CircleAvatar(
                    child: Text("${index + 1}"),
                  ),
                  title: Text(DateFormat('HH:mm:ss, dd-MM-yyyy').format(waterConsumeList[index])),
                ),
              );
            }))
          ],
        ),
      ),
    );
  }
}
