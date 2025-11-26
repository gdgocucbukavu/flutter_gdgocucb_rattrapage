import 'package:flutter/material.dart';
import 'package:flutter_gdgocucb_rattrapage/extensions.dart';
import 'package:flutter_gdgocucb_rattrapage/models/contact_model.dart';
import 'package:flutter_gdgocucb_rattrapage/widgets/widgets.dart';

// QUICK MENUS CONSTANTES

const List<IconData> quickMenusIcons = [
  Icons.phone_outlined,
  Icons.messenger_outline_rounded,
  Icons.videocam_outlined,
  Icons.email_outlined,
];

const List<String> quickMenusTexts = ["Call", "Message", "Video", "Email"];

// CONTACTS INFOS CONSTANTES

const List<String> infoTitles = [
  "Mobile",
  "Email",
  "Address",
  "Company",
  "Birthday",
];

const List<IconData> infoIcons = [
  Icons.phone_outlined,
  Icons.email_outlined,
  Icons.location_on_outlined,
  Icons.work_outline,
  Icons.calendar_today_outlined,
];

const List<MaterialColor> infoColors = [
  Colors.green,
  Colors.blue,
  Colors.purple,
  Colors.orange,
  Colors.pink,
];

const List<String> infoRightTexts = ["Call", "Send", "", "", ""];

class ContactDetailsPage extends StatelessWidget {
  final ContactModel currentContact;
  const ContactDetailsPage({super.key, required this.currentContact});

  @override
  Widget build(BuildContext context) {
    final List<String> infoUInfos = [
      currentContact.phoneNumber,
      currentContact.email,
      currentContact.location,
      currentContact.company,
      currentContact.birthday,
    ];

    return Scaffold(
      appBar: AppBar(title: Text("Contact Details")),
      body: ListView(
        children: [
          Container(
            height: 300,
            width: double.infinity,
            color: Colors.blue,
            child: Column(
              mainAxisAlignment: .center,
              spacing: 8,
              children: [
                CircleAvatar(
                  radius: 36,
                  backgroundColor: Colors.grey.shade200,
                  foregroundColor: Colors.black54,
                  child: Text(
                    currentContact.initials,
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                Column(
                  children: [
                    Text(
                      currentContact.fullName,
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    Text(
                      currentContact.phoneNumber,
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ],
                ).bottomGap(),
                Row(
                  mainAxisAlignment: .center,
                  spacing: 16,
                  children: List.generate(4, (index) {
                    return Column(
                      spacing: 8,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white24,
                          ),
                          child: Icon(
                            quickMenusIcons[index],
                            color: Colors.white,
                            size: 14,
                          ),
                        ),
                        Text(
                          quickMenusTexts[index],
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        ),
                      ],
                    );
                  }),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    Text("Contact Information"),
                    Row(
                      spacing: 8,
                      children: [
                        Icon(
                          currentContact.isFavorite
                              ? Icons.star_rounded
                              : Icons.star_outline_rounded,
                          color: Colors.amber,
                          size: 18,
                        ),
                        Icon(Icons.edit_square, color: Colors.blue, size: 18),
                      ],
                    ),
                  ],
                ).bottomGap(),
                Column(
                  children: List.generate(infoUInfos.length, (index) {
                    return Column(
                      children: [
                        _informationContainer(
                          icon: infoIcons[index],
                          color: infoColors[index],
                          title: infoTitles[index],
                          info: infoUInfos[index],
                          rightText: infoRightTexts[index],
                        ),
                        if (!(index == infoUInfos.length - 1))
                          Divider(color: Colors.grey.shade300, thickness: 0.5),
                      ],
                    );
                  }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _informationContainer({
    required IconData icon,
    required String title,
    required String info,
    required MaterialColor color,
    String rightText = "",
  }) {
    return Row(
      mainAxisAlignment: .spaceBetween,
      children: [
        Row(
          spacing: 8,
          children: [
            customIconContainer(icon: icon, color: color),
            Column(
              crossAxisAlignment: .start,
              children: [
                Text(
                  title,
                  style: TextStyle(color: Colors.grey.shade500, fontSize: 12),
                ),
                Text(info),
              ],
            ),
          ],
        ),
        Text(rightText, style: TextStyle(fontSize: 12, color: color)),
      ],
    );
  }
}
