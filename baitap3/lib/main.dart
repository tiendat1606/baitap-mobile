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
      home: Practice03(),
    );
  }
}

class Practice03 extends StatefulWidget {
  const Practice03({super.key});

  @override
  State<Practice03> createState() => _Practice03State();
}

class _Practice03State extends State<Practice03> {
  final TextEditingController aController = TextEditingController();
  final TextEditingController bController = TextEditingController();

  double? result;

  void calculate(String op) {
    final a = double.tryParse(aController.text);
    final b = double.tryParse(bController.text);

    if (a == null || b == null) {
      setState(() {
        result = null;
      });
      return;
    }

    double res = 0;

    switch (op) {
      case '+':
        res = a + b;
        break;
      case '-':
        res = a - b;
        break;
      case '×':
        res = a * b;
        break;
      case '÷':
        if (b == 0) return;
        res = a / b;
        break;
    }

    setState(() {
      result = res;
    });
  }

  Widget operatorButton(String text, Color color) {
    return GestureDetector(
      onTap: () => calculate(text),
      child: Container(
        width: 60,
        height: 50,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  InputDecoration inputStyle(String hint) {
    return InputDecoration(
      hintText: hint,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 14,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Number'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 60),
            const Text(
              'Thực hành 03',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: aController,
              keyboardType: TextInputType.number,
              decoration: inputStyle('Nhập số thứ nhất'),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                operatorButton('+', Colors.red),
                operatorButton('-', Colors.orange),
                operatorButton('×', Colors.purple),
                operatorButton('÷', Colors.black),
              ],
            ),
            const SizedBox(height: 16),
            TextField(
              controller: bController,
              keyboardType: TextInputType.number,
              decoration: inputStyle('Nhập số thứ hai'),
            ),
            const SizedBox(height: 20),
            if (result != null)
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Kết quả: ${result!.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
