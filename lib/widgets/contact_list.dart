// lib/widgets/contact_list.dart
import 'package:flutter/material.dart';

class ContactList extends StatelessWidget {
  final Map<String, String> contacts;
  final Function(String) onDelete;

  const ContactList({
    super.key,
    required this.contacts,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    if (contacts.isEmpty) {
      return const Center(
        child: Text('Keine Kontakte vorhanden'),
      );
    }

    return ListView.builder(
      itemCount: contacts.length,
      itemBuilder: (context, index) {
        final name = contacts.keys.elementAt(index);
        final phone = contacts[name]!;

        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: ListTile(
            leading: CircleAvatar(
              child: Text(name[0].toUpperCase()),
            ),
            title: Text(name),
            subtitle: Text(phone),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () => onDelete(name),
            ),
          ),
        );
      },
    );
  }
}
