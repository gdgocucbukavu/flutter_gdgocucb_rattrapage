// import 'package:flutter/widgets.dart';
// import 'package:flutter_gdgocucb_rattrapage/pages/contacts_page.dart';
// import 'package:flutter_gdgocucb_rattrapage/pages/home_page.dart';
// import 'package:flutter_gdgocucb_rattrapage/router/routes_names.dart';
// import 'package:flutter_gdgocucb_rattrapage/router/routes_paths.dart';
// import 'package:go_router/go_router.dart';

// GoRoute homeRoute = GoRoute(
//   path: RoutesPaths.home,
//   name: RoutesNames.home,
//   builder: (context, state) {
//     return HomePage();
//   },
// );

// GoRoute contactsRoute = GoRoute(
//   path: RoutesPaths.contacts,
//   name: RoutesNames.contacts,
//   builder: (context, state) {
//     return ContactsPage();
//   },
// );

// GoRouter goRouter = GoRouter(
//   initialLocation: RoutesPaths.home,
//   errorBuilder: (context, state) {
//     return Center(child: Text("Error"));
//   },
//   redirect: (context, state) async {
//     return null;
//   },
//   routes: [homeRoute, contactsRoute],
// );
