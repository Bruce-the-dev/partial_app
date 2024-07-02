import 'package:flutter/material.dart';
import 'drawer.dart';

class CalculatorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator Screen'),
      ),
      drawer: AppDrawer(currentRoute: '/calculator'),
      body: Center(
        child: const Calculator(),
      ),
    );
  }
}

class Calculator extends StatelessWidget {
  const Calculator({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              child: const Text(
                '0',
                style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Column(
            children: [
              buildButtonRow(['7', '8', '9', '/']),
              buildButtonRow(['4', '5', '6', 'x']),
              buildButtonRow(['1', '2', '3', '-']),
              buildButtonRow(['0', '.', '=', '+']),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildButtonRow(List<String> buttons) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: buttons.map((buttonText) {
        return CalculatorButton(text: buttonText);
      }).toList(),
    );
  }
}

class CalculatorButton extends StatelessWidget {
  final String text;

  const CalculatorButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            backgroundColor: Color.fromARGB(255, 78, 138, 216),
            padding: const EdgeInsets.all(20),
          ),
          child: Text(
            text,
            style: const TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
