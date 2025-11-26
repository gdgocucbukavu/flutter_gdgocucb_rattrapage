import 'package:flutter/material.dart';

import '../models/contact_model.dart';

class ContactsPageWithSearchEngine extends StatefulWidget {
  const ContactsPageWithSearchEngine({super.key});

  @override
  State<ContactsPageWithSearchEngine> createState() =>
      _ContactsPageWithSearchEngineState();
}

class _ContactsPageWithSearchEngineState
    extends State<ContactsPageWithSearchEngine> {
  List<ContactModel> _filtered = contacts;

  @override
  void initState() {
    super.initState();
    _filtered = contacts;
  }

  void _updateQuery(String q) {
    final query = q.trim().toLowerCase();
    setState(() {
      if (query.isEmpty) {
        _filtered = contacts;
      } else {
        _filtered = contacts.where((c) {
          final full = c.fullName.toLowerCase();
          final phone = c.phoneNumber.toLowerCase();
          final email = c.email.toLowerCase();
          return full.contains(query) ||
              phone.contains(query) ||
              email.contains(query);
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final favoriteContacts = _filtered
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
          child: Container(
            height: 75,
            color: Colors.white,
            padding: const EdgeInsets.all(16.0),
            child: SearchBar(
              onChanged: _updateQuery,
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              padding: WidgetStatePropertyAll(
                EdgeInsets.symmetric(horizontal: 12),
              ),
              elevation: WidgetStatePropertyAll(0),
              leading: Icon(Icons.search_rounded, color: Colors.grey.shade500),
              backgroundColor: WidgetStatePropertyAll(Colors.grey.shade200),
              hintText: "Search contacts",
              hintStyle: WidgetStatePropertyAll(
                TextStyle(color: Colors.grey.shade600),
              ),
            ),
          ),
        ),
      ),
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
                  // Affiche la section Favorites seulement s'il y a des favoris dans les résultats filtrés
                  if (favoriteContacts.isNotEmpty) ...[
                    Row(
                      children: [
                        Icon(Icons.star_rounded, color: Colors.amber),
                        SizedBox(width: 8),
                        Text("Favorites"),
                      ],
                    ),
                    SizedBox(height: 8),
                    Column(
                      children: List.generate(favoriteContacts.length, (index) {
                        final currentContact = favoriteContacts[index];
                        return Container(
                          margin: const EdgeInsets.only(bottom: 8),
                          padding: const EdgeInsets.all(12.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.grey.shade500,
                              width: 0.5,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.grey.shade200,
                                    foregroundColor: Colors.black54,
                                    child: Text(currentContact.initials),
                                  ),
                                  SizedBox(width: 12),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(currentContact.fullName),
                                          SizedBox(width: 8),
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
                                children: [
                                  Icon(
                                    Icons.phone_outlined,
                                    color: Colors.green,
                                    size: 18,
                                  ),
                                  SizedBox(width: 8),
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
                    SizedBox(height: 12),
                  ],

                  // Section All Contacts — utilise la liste filtrée et affiche le compteur
                  Text("All Contacts (${_filtered.length})"),
                  SizedBox(height: 8),
                  Column(
                    children: List.generate(_filtered.length, (index) {
                      final currentContact = _filtered[index];
                      return Container(
                        margin: const EdgeInsets.only(bottom: 8),
                        padding: const EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.grey.shade500,
                            width: 0.5,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.grey.shade200,
                                  foregroundColor: Colors.black54,
                                  child: Text(currentContact.initials),
                                ),
                                SizedBox(width: 12),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(currentContact.fullName),
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
                              children: [
                                Icon(
                                  Icons.phone_outlined,
                                  color: Colors.green,
                                  size: 18,
                                ),
                                SizedBox(width: 8),
                                Icon(
                                  Icons.email_outlined,
                                  color: Colors.blue,
                                  size: 18,
                                ),
                                SizedBox(width: 8),
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
            ),
          ],
        ),
      ),
    );
  }
}
