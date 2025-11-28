import 'package:flutter/material.dart';

import '../widgets/widgets.dart';
import 'pages.dart';

class HostPage extends StatefulWidget {
  const HostPage({super.key});

  @override
  State<HostPage> createState() => _HostPageState();
}

class _HostPageState extends State<HostPage> {
  int pageIndex = 0;
  List pages = [
    HomePage(),
    WeatherScreen(),
    ContactsPage(),
    ContactsPageWithSearchEngine(),
  ];
  List<String> pagesNames = const ["Home", "Météo", 'Contacts', 'Contacts2'];
  List<IconData> pagesIcons = const [
    Icons.home_filled,
    Icons.cloud_rounded,
    Icons.contact_page,
    Icons.contact_page_outlined,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, title: pagesNames[pageIndex]),
      body: pages[pageIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: pageIndex,
        onDestinationSelected: (value) {
          setState(() {
            pageIndex = value;
          });
        },
        destinations: List.generate(pagesNames.length, (index) {
          return NavigationDestination(
            icon: Icon(pagesIcons[index]),
            label: pagesNames[index],
          );
        }),
      ),
    );
  }
}
