import 'package:flutter/material.dart';

import '../data/data.dart';
import '../routes/routes.dart';

class ContactsPage extends StatefulWidget {
  const ContactsPage({super.key});

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  @override
  Widget build(BuildContext context) {
    final favoriteContacts = localContactsData.where((contact) {
      setState(() {});
      return contact.isFavorite;
    }).toList();

    return Scaffold(
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
                          return ContactCardView(
                            currentContact: currentContact,
                            isFavorite: true,
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
                      Text("All Contacts (${localContactsData.length})"),
                      Column(
                        children: List.generate(localContactsData.length, (
                          index,
                        ) {
                          final currentContact = localContactsData[index];
                          return ContactCardView(
                            currentContact: currentContact,
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

class ContactCardView extends StatefulWidget {
  const ContactCardView({
    super.key,
    required this.currentContact,
    this.isFavorite = false,
  });

  final ContactModel currentContact;
  final bool isFavorite;

  @override
  State<ContactCardView> createState() => _ContactCardViewState();
}

class _ContactCardViewState extends State<ContactCardView> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        RoutesConfig.goToContactDetails(
          context,
          contact: widget.currentContact,
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: BoxBorder.all(color: Colors.grey.shade500, width: 0.5),
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
                  child: Text(widget.currentContact.initials),
                ),
                Column(
                  crossAxisAlignment: .start,
                  children: [
                    Row(
                      spacing: 8,
                      children: [
                        Text(widget.currentContact.fullName),
                        if (widget.isFavorite)
                          Icon(
                            widget.currentContact.isFavorite
                                ? Icons.star_rounded
                                : Icons.star_outline_rounded,
                            color: Colors.amber,
                            size: 14,
                          ),
                      ],
                    ),
                    Text(
                      widget.currentContact.phoneNumber,
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 12,
                      ),
                    ),
                    if (!widget.isFavorite)
                      Text(
                        widget.currentContact.email,
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
                Icon(Icons.phone_outlined, color: Colors.green, size: 18),
                Icon(Icons.email_outlined, color: Colors.blue, size: 18),
                if (!widget.isFavorite)
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        widget.currentContact.changeFavoriteState();
                      });
                    },
                    child: Icon(
                      widget.currentContact.isFavorite
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
      ),
    );
  }
}
