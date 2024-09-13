import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FibonacciChecker(),
    );
  }
}

class FibonacciChecker extends StatefulWidget {
  @override
  _FibonacciCheckerState createState() => _FibonacciCheckerState();
}

class _FibonacciCheckerState extends State<FibonacciChecker> {
  final TextEditingController _controller = TextEditingController();
  String _result = '';

  bool isFibonacci(int num) {
    int a = 0, b = 1;
    while (b <= num) {
      if (b == num) return true;
      int temp = a;
      a = b;
      b = temp + b;
    }
    return false;
  }

  void checkFibonacci() {
    int number = int.tryParse(_controller.text) ?? 0;
    if (isFibonacci(number)) {
      setState(() {
        _result = "O número $number pertence à sequência de Fibonacci.";
      });
    } else {
      setState(() {
        _result = "O número $number não pertence à sequência de Fibonacci.";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true, // Centraliza o título
        title: Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), // Bordas arredondadas
          ),
          child: Text(
            "Verificando  Fibonacii",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Digite um número",
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: checkFibonacci,
              child: Text("Verificar"),
            ),
            SizedBox(height: 20),
            Text(
              _result,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
