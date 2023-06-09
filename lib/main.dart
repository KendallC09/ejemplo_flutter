import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

//widgets que no cambian de estado
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) { //estructura básica, título y tema
    return MaterialApp(
      title: 'Sumador',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Sumador'),
    );
  }
}

//widgets que cambian de estado
class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController number1Controller = TextEditingController();
  TextEditingController number2Controller = TextEditingController();
  int sum = 0;

  void calculateSum() {
    int num1 = int.parse(number1Controller.text);
    int num2 = int.parse(number2Controller.text);
    int result = num1 + num2;
    setState(() {
      sum = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold( //widget scaffold
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: TextField(
                    controller: number1Controller,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Número 1',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: TextField(
                    controller: number2Controller,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Número 2',
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: calculateSum,
                  child: Text('Sumar'),
                ),
                SizedBox(height: 16.0),
                Text(
                  'Resultado: $sum',
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                ),
              ],
            ),
        ),
    );
    }
}