import 'package:flutter/material.dart';

class ContactsPage extends StatelessWidget {
  const ContactsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteContacts = contacts
        .where((contact) => contact.isFavorite)
        .toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent.shade200,
        title: Text("Home"),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search_rounded)),
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications_rounded)),
          Container(
            margin: const EdgeInsets.only(right: 8.0),
            child: CircleAvatar(
              child: Text("GB", style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 80),
          child: Padding(
            padding: const EdgeInsetsGeometry.all(16.0),
            child: SearchBar(),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: .stretch,
          spacing: 16.0,
          children: [
            FilledButton.icon(
              onPressed: () {},
              icon: Icon(Icons.person_add_alt_1_outlined),
              label: Text("Add New Contact"),
            ),
            // SliverList(delegate:
            // SliverChildListDelegate(

            // )),
            Expanded(
              child: ListView(
                children: [
                  Column(
                    spacing: 8,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.star_rounded, color: Colors.red),
                          Text("Favorites"),
                        ],
                      ),
                      Column(
                        children: List.generate(favoriteContacts.length, (
                          index,
                        ) {
                          final currentContact = favoriteContacts[index];
                          return Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: .spaceBetween,
                                spacing: 8,
                                children: [
                                  Row(
                                    spacing: 8.0,
                                    children: [
                                      CircleAvatar(
                                        child: Text(currentContact.initials),
                                      ),
                                      Column(
                                        crossAxisAlignment: .start,
                                        children: [
                                          Text(currentContact.fullName),
                                          Text(currentContact.phoneNumber),
                                          Text(currentContact.email),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Row(
                                    spacing: 8,
                                    children: [
                                      Icon(
                                        Icons.phone_outlined,
                                        color: Colors.green,
                                      ),
                                      Icon(
                                        Icons.email_outlined,
                                        color: Colors.blue,
                                      ),
                                      Icon(
                                        currentContact.isFavorite
                                            ? Icons.star_rounded
                                            : Icons.star_outline_rounded,
                                        color: Colors.red,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Column(
                    crossAxisAlignment: .start,
                    spacing: 8,
                    children: [
                      Text("All Contacts (${contacts.length})"),
                      Column(
                        children: List.generate(contacts.length, (index) {
                          final currentContact = contacts[index];
                          return Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: .spaceBetween,
                                spacing: 8,
                                children: [
                                  Row(
                                    spacing: 8.0,
                                    children: [
                                      CircleAvatar(
                                        child: Text(currentContact.initials),
                                      ),
                                      Column(
                                        crossAxisAlignment: .start,
                                        children: [
                                          Text(currentContact.fullName),
                                          Text(currentContact.phoneNumber),
                                          Text(currentContact.email),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Row(
                                    spacing: 8,
                                    children: [
                                      Icon(
                                        Icons.phone_outlined,
                                        color: Colors.green,
                                      ),
                                      Icon(
                                        Icons.email_outlined,
                                        color: Colors.blue,
                                      ),
                                      Icon(
                                        currentContact.isFavorite
                                            ? Icons.star_rounded
                                            : Icons.star_outline_rounded,
                                        color: Colors.red,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ContactModel {
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String email;
  final String location;

  bool isFavorite;

  ContactModel({
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.email,
    required this.location,
    this.isFavorite = false,
  });

  String get fullName => '$firstName $lastName';
  String get initials => '${firstName[0]}${lastName[0]}'.toUpperCase();
}

List<ContactModel> contacts = [
  // --- Favoris (isFavorite: true) ---
  ContactModel(
    firstName: 'Justin',
    lastName: 'Bashige',
    phoneNumber: '+243 81 123 4567', // Numéro RDC (Fake)
    email: 'bashigejustin0@gmail.com',
    location: 'Bukavu, DRC',
    isFavorite: true,
  ),
  ContactModel(
    firstName: 'Cédro',
    lastName: 'Bisimwa',
    phoneNumber: '+243 97 234 5678', // Numéro RDC (Fake)
    email: 'cebistmus@gmail.com',
    location: 'Bunia, DRC',
  ),
  ContactModel(
    firstName: 'Gancia',
    lastName: 'Maya',
    phoneNumber: '+243 89 345 6789', // Numéro RDC (Fake)
    email: 'nciamaya@gmail.com',
    location: 'Goma, DRC',
    isFavorite: true,
  ),

  // --- Tous les Contacts (isFavorite: false par défaut) ---
  ContactModel(
    firstName: 'Trésor',
    lastName: 'BAHATI',
    phoneNumber: '+243 82 456 7890', // Numéro RDC (Fake)
    email: 'trelasbbt@gmail.com',
    location: 'Nairobi, Kenya',
    isFavorite: true,
  ),
  ContactModel(
    firstName: 'David',
    lastName: 'KAKIRA',
    phoneNumber: '+243 99 567 8901', // Numéro RDC (Fake)
    email: 'davidkakira23@gmail.com',
    location: 'Bukavu, DRC',
  ),
  ContactModel(
    firstName: 'Glodie',
    lastName: 'Ndjali',
    phoneNumber: '+243 85 678 9012', // Numéro RDC (Fake)
    email: 'glodiendjali@gmail.com',
    location: 'Bunia, DRC',
  ),
  ContactModel(
    firstName: 'Nicolas',
    lastName: 'Rutalira',
    phoneNumber: '+243 84 789 0123', // Numéro RDC (Fake)
    email: 'ibuyenicolas@gmail.com',
    location: 'Goma, DRC',
    isFavorite: true,
  ),
  ContactModel(
    // Numéro Kenya (+254) spécifiquement pour ce contact
    firstName: 'Georges',
    lastName: 'Byona',
    phoneNumber: '+254 712 345 678', // Numéro Kenya (Fake)
    email: 'georgesbyona@gmail.com',
    location: 'Nairobi, Kenya',
  ),
  ContactModel(
    firstName: 'Kevin',
    lastName: 'Kish',
    phoneNumber: '+243 81 890 1234', // Numéro RDC (Fake)
    email: 'kevinkish117@gmail.com',
    location: 'Bukavu, DRC',
  ),
  ContactModel(
    firstName: 'Jacques',
    lastName: 'Uwonda',
    phoneNumber: '+243 97 901 2345', // Numéro RDC (Fake)
    email: 'jaquesuwonda@gmail.com',
    location: 'Bunia, DRC',
  ),
  ContactModel(
    firstName: 'Israël',
    lastName: 'Nondine',
    phoneNumber: '+243 89 012 3456', // Numéro RDC (Fake)
    email: 'nondinebarhuk@gmail.com',
    location: 'Goma, DRC',
  ),
];
