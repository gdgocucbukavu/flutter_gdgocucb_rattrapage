import 'package:flutter/material.dart';

AppBar customAppBar(
  BuildContext context, {
  required String title,
  bool showSearchBar = false,
}) {
  return AppBar(
    backgroundColor: Colors.blueAccent.shade200,
    title: Text(title),
    actions: [
      if (title.toLowerCase() == "contacts")
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.search_rounded, color: Colors.white),
        ),
      IconButton(
        onPressed: () {
          Navigator.pushNamed(context, "/notifications");
        },
        icon: Icon(Icons.notifications_outlined, color: Colors.white),
      ),
      InkWell(
        onTap: () {
          Navigator.pushNamed(context, "/profile");
        },
        child: Container(
          margin: const EdgeInsets.only(right: 8.0),
          child: CircleAvatar(
            child: Text("JB", style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ),
      ),
    ],
    bottom: showSearchBar
        ? PreferredSize(
            preferredSize: Size(double.infinity, 80),
            child: Container(
              height: 75,
              color: Colors.white,
              padding: const EdgeInsetsGeometry.all(16.0),
              child: SearchBar(
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(8),
                  ),
                ),
                padding: WidgetStatePropertyAll(
                  EdgeInsets.symmetric(horizontal: 12),
                ),
                elevation: WidgetStatePropertyAll(0),
                leading: Icon(
                  Icons.search_rounded,
                  color: Colors.grey.shade500,
                ),
                backgroundColor: WidgetStatePropertyAll(Colors.grey.shade200),
                hintText: "Search contacts",
                hintStyle: WidgetStatePropertyAll(
                  TextStyle(color: Colors.grey.shade600),
                ),
              ),
            ),
          )
        : null,
  );
}
