import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UI Components Demo',
      theme: ThemeData(useMaterial3: true),
      home: const WelcomeScreen(),
    );
  }
}

/// ===================
/// 1️⃣ WELCOME SCREEN
/// ===================
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.widgets, size: 100, color: Colors.blue),
              const SizedBox(height: 16),
              const Text(
                'Flutter UI Components',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              const Text(
                'Demo các thành phần UI cơ bản trong Flutter',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const ComponentsScreen()),
                  );
                },
                child: const Text("I'm ready"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// ===================
/// 2️⃣ COMPONENTS LIST
/// ===================
class ComponentsScreen extends StatelessWidget {
  const ComponentsScreen({super.key});

  final List<Map<String, String>> components = const [
    {'title': 'Text', 'desc': 'Displays text'},
    {'title': 'Image', 'desc': 'Displays an image'},
    {'title': 'TextField', 'desc': 'Input field for text'},
    {'title': 'PasswordField', 'desc': 'Input field for passwords'},
    {'title': 'Column', 'desc': 'Arranges elements vertically'},
    {'title': 'Row', 'desc': 'Arranges elements horizontally'},
    {'title': 'Button', 'desc': 'Clickable button'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('UI Components List')),
      body: ListView.builder(
        itemCount: components.length,
        itemBuilder: (context, index) {
          final item = components[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              title: Text(item['title']!),
              subtitle: Text(item['desc']!),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DetailScreen(title: item['title']!),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final String title;
  const DetailScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('$title Detail')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Center(child: buildComponent()),
      ),
    );
  }

  Widget buildComponent() {
    switch (title) {
      case 'Text':
        return const Text(
          'The quick Brown fox jumps over the lazy dog.',
          style: TextStyle(fontSize: 20),
        );
      case 'Image':
        return Image.network(
          'https://flutter.dev/assets/homepage/carousel/slide_1-bg-opaque-2x.png',
          height: 150,
        );
      case 'TextField':
        return const TextField(
          decoration: InputDecoration(labelText: 'Enter text'),
        );
      case 'PasswordField':
        return const TextField(
          obscureText: true,
          decoration: InputDecoration(labelText: 'Password'),
        );
      case 'Column':
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text('Item 1'),
            Text('Item 2'),
            Text('Item 3'),
          ],
        );
      case 'Row':
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.star),
            SizedBox(width: 8),
            Icon(Icons.star),
            SizedBox(width: 8),
            Icon(Icons.star),
          ],
        );
      case 'Button':
        return ElevatedButton(
          onPressed: () {},
          child: const Text('Click me'),
        );
      default:
        return const Text('Unknown component');
    }
  }
}
