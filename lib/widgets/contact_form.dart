// lib/widgets/contact_form.dart
import 'package:flutter/material.dart';

class ContactForm extends StatefulWidget {
  final Function(String name, String phone) onSubmit;

  const ContactForm({super.key, required this.onSubmit});

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      widget.onSubmit(_nameController.text, _phoneController.text);
      _nameController.clear();
      _phoneController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
              validator: (value) => value?.isEmpty ?? true
                  ? 'Bitte geben Sie einen Namen ein'
                  : null,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _phoneController,
              decoration: const InputDecoration(
                labelText: 'Telefonnummer',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.phone),
              ),
              validator: (value) => value?.isEmpty ?? true
                  ? 'Bitte geben Sie eine Telefonnummer ein'
                  : null,
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: _submitForm,
              icon: const Icon(Icons.add),
              label: const Text('Kontakt hinzufügen'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }
}
