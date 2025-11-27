import 'package:flutter/material.dart';
import 'package:flutter_gdgocucb_rattrapage/pages/profile_page.dart';
import 'package:flutter_gdgocucb_rattrapage/router/routes_config.dart';

import 'pages/pages.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: goRouter,
    );
  }
}
