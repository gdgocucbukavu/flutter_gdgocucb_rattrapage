import 'package:flutter/material.dart';
import 'package:flutter_gdgocucb_rattrapage/routes/routes_names.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

import 'data/data.dart';
import 'pages/pages.dart';

void main() {
  usePathUrlStrategy();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RoutesNames.host,
      routes: {
        RoutesNames.notifications: (context) => NotificationScreen(),
        RoutesNames.profile: (context) => ProfilePage(),
        RoutesNames.host: (context) => HostPage(),
      },
      onGenerateRoute: (routeSettings) {
        // Gestion des routes dynamiques pour /contact-details-<email>
        if (routeSettings.name?.startsWith(RoutesNames.contactDetails) ==
            true) {
          final contact = routeSettings.arguments as ContactModel?;
          if (contact != null) {
            return MaterialPageRoute(
              builder: (context) => ContactDetailsPage(currentContact: contact),
              settings: routeSettings,
            );
          }
        }

        // Routes statiques
        switch (routeSettings.name) {
          case RoutesNames.host:
            return MaterialPageRoute(builder: (context) => HostPage());
          default:
            return MaterialPageRoute(
              builder: (context) {
                return Scaffold(body: Center(child: Text('Route not found')));
              },
            );
        }
      },
    );
  }
}
