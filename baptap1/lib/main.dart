import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _roundButton(
                    icon: Icons.arrow_back_ios_new,
                    iconColor: Colors.grey.shade700,
                    onTap: () {},
                  ),
                  _roundButton(
                    icon: Icons.edit_square,
                    iconColor: const Color.fromARGB(255, 183, 242, 144),
                    onTap: () {},
                  ),
                ],
              ),
            ),

            const SizedBox(height: 60),

            CircleAvatar(
              radius: 65,
              backgroundImage: NetworkImage(
                "https://tse1.mm.bing.net/th/id/OIP.G383Ov_adOGe12B8ZsxZDQHaEJ?cb=ucfimg2&ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3",
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              "Red Panda",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            Text(
              "California, USA",
              style: TextStyle(fontSize: 17, color: Colors.grey.shade600),
            ),
          ],
        ),
      ),
    );
  }

  Widget _roundButton({
    required IconData icon,
    required VoidCallback onTap,
    Color iconColor = Colors.black,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Container(
        height: 48,
        width: 48,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),

          border: Border.all(color: const Color(0xFFDDE2E6), width: 1.4),
        ),
        child: Icon(icon, size: 26, color: iconColor),
      ),
    );
  }
}