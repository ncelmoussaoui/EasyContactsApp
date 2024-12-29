// lib/main.dart
import 'package:flutter/material.dart';
import 'screens/contact_directory_screen.dart';

void main() {
  runApp(const EasyContactsApp());
}

class EasyContactsApp extends StatelessWidget {
  const EasyContactsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EasyContacts',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true, // Modernes Material 3 Design
      ),
      home: const ContactDirectoryScreen(),
    );
  }
}
