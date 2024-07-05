import 'package:flutter/material.dart';
import 'second_screen.dart';

class FirstScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Primera Pantalla'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Ingresa una operación (e.g., 2+2)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Ir a la Segunda Pantalla'),
              onPressed: () {
                String operation = _controller.text;
                double result = _evaluateExpression(operation);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SecondScreen(data: 'Resultado: $result'),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  double _evaluateExpression(String expression) {
    List<String> parts = expression.split('+');
    double num1 = double.parse(parts[0]);
    double num2 = double.parse(parts[1]);
    return num1 + num2;
  }
}
