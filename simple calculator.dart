import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculatorPage(),
    );
  }
}

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  final TextEditingController num1Controller = TextEditingController();
  final TextEditingController num2Controller = TextEditingController();

  double result = 0;

  void calculate(String operation) {
    double n1 = double.parse(num1Controller.text);
    double n2 = double.parse(num2Controller.text);

    setState(() {
      if (operation == '+') {
        result = n1 + n2;
      } else if (operation == '-') {
        result = n1 - n2;
      } else if (operation == '*') {
        result = n1 * n2;
      } else if (operation == '/') {
        result = n1 / n2;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Simple Calculator"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: num1Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Enter first number",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: num2Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Enter second number",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => calculate('+'),
                  child: const Text("+"),
                ),
                ElevatedButton(
                  onPressed: () => calculate('-'),
                  child: const Text("-"),
                ),
                ElevatedButton(
                  onPressed: () => calculate('*'),
                  child: const Text("×"),
                ),
                ElevatedButton(
                  onPressed: () => calculate('/'),
                  child: const Text("÷"),
                ),
              ],
            ),

            const SizedBox(height: 30),
            Text(
              "Result: $result",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
