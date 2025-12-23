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
      home: LibraryScreen(),
    );
  }
}

class Book {
  final String name;
  bool isBorrowed;

  Book(this.name, {this.isBorrowed = false});
}

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({super.key});

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  final List<Book> books = [
    Book('Sách 01'),
    Book('Sách 02'),
    Book('Sách 03'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Quản lý thư viện')),
      body: ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) {
          final book = books[index];
          return ListTile(
            title: Text(book.name),
            trailing: Checkbox(
              value: book.isBorrowed,
              onChanged: (value) {
                setState(() {
                  book.isBorrowed = value ?? false;
                });
              },
            ),
          );
        },
      ),
    );
  }
}
