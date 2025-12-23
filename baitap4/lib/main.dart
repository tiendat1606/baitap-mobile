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
      home: Practice02(),
    );
  }
}

class Practice02 extends StatefulWidget {
  const Practice02({super.key});

  @override
  State<Practice02> createState() => _Practice02State();
}

class _Practice02State extends State<Practice02> {
  final TextEditingController emailController = TextEditingController();
  String message = '';

  void checkEmail() {
    String email = emailController.text.trim();

    if (email.isEmpty) {
      setState(() {
        message = 'Email không hợp lệ';
      });
    } else if (!email.contains('@')) {
      setState(() {
        message = 'Email không đúng định dạng';
      });
    } else {
      setState(() {
        message = 'Bạn đã nhập email hợp lệ';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thực hành 02'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: checkEmail,
              child: const Text('Kiểm tra'),
            ),
            const SizedBox(height: 20),
            Text(
              message,
              style: TextStyle(
                color: message.contains('hợp lệ')
                    ? Colors.green
                    : Colors.red,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
