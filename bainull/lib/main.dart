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
      home: NullableScreen(),
    );
  }
}

class NullableScreen extends StatefulWidget {
  const NullableScreen({super.key});

  @override
  State<NullableScreen> createState() => _NullableScreenState();
}

class _NullableScreenState extends State<NullableScreen> {
  final TextEditingController ageController = TextEditingController();

  int? age;
  String message = '';

  void checkAge() {
    if (ageController.text.isEmpty) {
      setState(() {
        age = null;
        message = 'Tuổi hiện tại là null (chưa nhập)';
      });
    } else {
      setState(() {
        age = int.tryParse(ageController.text);
        if (age == null) {
          message = 'Giá trị nhập không hợp lệ';
        } else {
          message = 'Tuổi của bạn là $age';
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Demo Nullable'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Nhập tuổi để kiểm tra nullable',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: ageController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Tuổi',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: checkAge,
              child: const Text('Kiểm tra'),
            ),
            const SizedBox(height: 16),
            Text(
              message,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
