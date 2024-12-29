// lib/screens/contact_directory_screen.dart
import 'package:flutter/material.dart';
import '../widgets/contact_form.dart';
import '../widgets/contact_list.dart';
import '../models/contact_directory.dart';

class ContactDirectoryScreen extends StatefulWidget {
  const ContactDirectoryScreen({super.key});

  @override
  State<ContactDirectoryScreen> createState() => _ContactDirectoryScreenState();
}

class _ContactDirectoryScreenState extends State<ContactDirectoryScreen> {
  // Instanz unseres Kontaktverzeichnisses
  final ContactDirectory _directory = ContactDirectory();

  // Methode zum Hinzufügen eines Kontakts
  void _addContact(String name, String phone) {
    setState(() {
      _directory.addContact(name, phone);
    });
  }

  // Methode zum Entfernen eines Kontakts
  void _removeContact(String name) {
    setState(() {
      _directory.removeContact(name);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EasyContacts'),
      ),
      body: Column(
        children: [
          // Kontaktformular
          ContactForm(onSubmit: _addContact),
          // Liste der Kontakte
          Expanded(
            child: ContactList(
              contacts: _directory.contacts,
              onDelete: _removeContact,
            ),
          ),
        ],
      ),
    );
  }
}
