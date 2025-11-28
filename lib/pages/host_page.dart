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
  List pages = [HomePage(), WeatherScreen(), ContactsPage()];
  List<String> pagesNames = const ["Home", "Météo", 'Contacts'];

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
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.home_filled),
            label: pagesNames.first,
          ),
          NavigationDestination(icon: Icon(Icons.cloud), label: pagesNames[1]),
          NavigationDestination(
            icon: Icon(Icons.contact_mail_sharp),
            label: pagesNames[2],
          ),
        ],
      ),
    );
  }
}
