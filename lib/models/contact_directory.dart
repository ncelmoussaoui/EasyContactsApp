class ContactDirectory {
  final Map<String, String> contacts = {};

  void addContact(String name, String phoneNumber) {
    contacts[name] = phoneNumber;
  }

  bool removeContact(String name) {
    return contacts.remove(name) != null;
  }
}
