import 'package:flutter/material.dart';

/// Hello All, Welcome to mobile apps academy.
/// In this video, we'll develop a custom drop down menu.
/// Lets Start.

void main() {
  runApp(const MyApp());
}

enum Options { search, share, copy, logout }

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  var popupMenuItemIndex = 0;
  String currentPage = "Home";
  var appBarHeight = AppBar().preferredSize.height;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: buildAppBarWidget(),
        backgroundColor: Colors.black,
        body: Center(
          child: Text(currentPage, style: const TextStyle(color: Colors.white, fontSize: 40.0),),
        ),
      ),
    );
  }

  buildAppBarWidget() {
    return AppBar(
      backgroundColor: Colors.black,
      actions: [
        PopupMenuButton(
            elevation: 10,
            iconColor: Colors.white,
            onSelected: (value) {
              onMenuItemSelected(value as int);
            },
            offset: Offset(0.0, appBarHeight),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.0))
            ),
            itemBuilder: (ctx) => [
              buildPopupMenuItemWidget("Search", Icons.search, Options.search.index),
              buildPopupMenuItemWidget("Share", Icons.share, Options.share.index),
              buildPopupMenuItemWidget("Copy", Icons.copy, Options.copy.index),
              buildPopupMenuItemWidget("Logout", Icons.logout, Options.logout.index),
            ])
      ],
    );
  }

  PopupMenuItem buildPopupMenuItemWidget(String title, IconData iconData, int position) {
    return PopupMenuItem(
        value: position,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              iconData,
              color: Colors.black,
            ),
            const SizedBox(width: 10),
            Text(title)
          ],
        )
    );
  }

  onMenuItemSelected(int value) {
    setState(() {
      popupMenuItemIndex = value;
    });

    if (value == Options.search.index) {
      currentPage = "Search";
    } else if (value == Options.share.index) {
      currentPage = "Share";
    } else if (value == Options.copy.index) {
      currentPage = "Copy";
    } else {
      currentPage = "Logout";
    }

  }

}
