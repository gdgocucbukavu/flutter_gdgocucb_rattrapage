import 'package:flutter/material.dart';

import '../models/contact_model.dart';
import '../widgets/custom_app_bar.dart';

class ContactsPage extends StatelessWidget {
  const ContactsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteContacts = contacts
        .where((contact) => contact.isFavorite)
        .toList();

    return Scaffold(
      appBar: customAppBar(title: "Contacts", showSearchBar: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: .stretch,
          spacing: 16.0,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.blue,
              ),
              child: Row(
                mainAxisAlignment: .center,
                spacing: 8,
                children: [
                  Icon(Icons.person_add_alt_1_outlined, color: Colors.white),
                  Text(
                    "Add New Contact",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  Column(
                    spacing: 8,
                    children: [
                      Row(
                        spacing: 8,
                        children: [
                          Icon(Icons.star_rounded, color: Colors.amber),
                          Text("Favorites"),
                        ],
                      ),
                      Column(
                        children: List.generate(favoriteContacts.length, (
                          index,
                        ) {
                          final currentContact = favoriteContacts[index];
                          return Container(
                            margin: const EdgeInsets.only(bottom: 8),
                            padding: const EdgeInsets.all(12.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: BoxBorder.all(
                                color: Colors.grey.shade500,
                                width: 0.5,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisAlignment: .spaceBetween,
                              spacing: 16,
                              children: [
                                Row(
                                  spacing: 16.0,
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Colors.grey.shade200,
                                      foregroundColor: Colors.black54,
                                      child: Text(currentContact.initials),
                                    ),
                                    Column(
                                      crossAxisAlignment: .start,
                                      children: [
                                        Row(
                                          spacing: 8,
                                          children: [
                                            Text(currentContact.fullName),
                                            Icon(
                                              currentContact.isFavorite
                                                  ? Icons.star_rounded
                                                  : Icons.star_outline_rounded,
                                              color: Colors.amber,
                                              size: 14,
                                            ),
                                          ],
                                        ),
                                        Text(
                                          currentContact.phoneNumber,
                                          style: TextStyle(
                                            color: Colors.grey.shade600,
                                            fontSize: 12,
                                          ),
                                        ),
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
                                      size: 18,
                                    ),
                                    Icon(
                                      Icons.email_outlined,
                                      color: Colors.blue,
                                      size: 18,
                                    ),
                                  ],
                                ),
                              ],
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
                          return Container(
                            margin: const EdgeInsets.only(bottom: 8),
                            padding: const EdgeInsets.all(12.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: BoxBorder.all(
                                color: Colors.grey.shade500,
                                width: 0.5,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisAlignment: .spaceBetween,
                              spacing: 16.0,
                              children: [
                                Row(
                                  spacing: 16.0,
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Colors.grey.shade200,
                                      foregroundColor: Colors.black54,
                                      child: Text(currentContact.initials),
                                    ),
                                    Column(
                                      crossAxisAlignment: .start,
                                      children: [
                                        Row(
                                          spacing: 8,
                                          children: [
                                            Text(currentContact.fullName),
                                          ],
                                        ),
                                        Text(
                                          currentContact.phoneNumber,
                                          style: TextStyle(
                                            color: Colors.grey.shade600,
                                            fontSize: 12,
                                          ),
                                        ),
                                        Text(
                                          currentContact.email,
                                          style: TextStyle(
                                            color: Colors.grey.shade600,
                                            fontSize: 12,
                                          ),
                                        ),
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
                                      size: 18,
                                    ),
                                    Icon(
                                      Icons.email_outlined,
                                      color: Colors.blue,
                                      size: 18,
                                    ),
                                    GestureDetector(
                                      onTap: () {},
                                      child: Icon(
                                        currentContact.isFavorite
                                            ? Icons.star_rounded
                                            : Icons.star_outline_rounded,
                                        color: Colors.amber,
                                        size: 18,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
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
