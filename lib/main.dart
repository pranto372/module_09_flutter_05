import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Sum Calculator",
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
  final TextEditingController _field1Controller = TextEditingController();
  final TextEditingController _field2Controller = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  double result = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sum Calculator"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              TextFormField(
                controller: _field1Controller,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  hintText: "First Number"
                ),
                validator: (String? value){
                  if(value?. isEmpty ?? true){
                    return 'Enter Valid Value';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _field2Controller,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: "Second Number"
                ),
                validator: (String? value){
                  if(value?. isEmpty ?? true){
                    return 'Enter Valid Value';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 15,
              ),
              ButtonBar(
                alignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      if(_formkey.currentState!.validate()){
                        double FirstNumber = double.parse(_field1Controller.text.trim());
                        double SecondNumber = double.parse(_field2Controller.text.trim());
                        print(FirstNumber);
                        print(SecondNumber);
                        result = FirstNumber + SecondNumber;
                        setState(() {

                        });
                      }
                    },
                    icon: const Icon(Icons.add),
                    label: const Text('Add'),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      if(_formkey.currentState!.validate()){
                        double FirstNumber = double.parse(_field1Controller.text.trim());
                        double SecondNumber = double.parse(_field2Controller.text.trim());
                        print(FirstNumber);
                        print(SecondNumber);
                        result = FirstNumber - SecondNumber;
                        setState(() {

                        });
                      }
                    },
                    icon: const Icon(Icons.remove),
                    label: const Text('Sub'),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Text("Result is: $result", style: const TextStyle(
                fontSize: 20
              ),)
            ],
          ),
        ),
      ),
    );
  }
}