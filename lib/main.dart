import 'package:flutter/material.dart';
import 'package:mini_project/page/dashboard.dart';
import 'package:mini_project/page/detail.dart';
import 'package:mini_project/page/history.dart';
import 'package:mini_project/page/inbox.dart';
import 'package:mini_project/page/login_registration.dart';
import 'package:mini_project/page/profile.dart';
import 'constants.dart';
import 'package:google_fonts/google_fonts.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
        primaryColor : kPrimaryColor,
        accentColor: kPrimaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginScreen(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int index = 0;
  final screens = [
    DashboardScreen(),
    HistoryScreen(),
    InboxScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) =>Scaffold(
    body: screens[index],
    bottomNavigationBar: NavigationBarTheme(
      data: NavigationBarThemeData(
        indicatorColor: kPrimaryColor.withOpacity(0.4),
        labelTextStyle: MaterialStateProperty.all(
          TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: kTextColor)
        )
      ),
      child: NavigationBar(
        height: 60,
        backgroundColor: kBackgroundColor,
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        selectedIndex: index,
        onDestinationSelected: (index) =>
            setState(() => this.index = index),
      destinations: [
        NavigationDestination(icon: Icon(Icons.explore), label: "Explore",),
        NavigationDestination(icon: Icon(Icons.history), label: "History"),
        NavigationDestination(icon: Icon(Icons.email), label: "Inbox"),
        NavigationDestination(icon: Icon(Icons.person), label: "Profile"),
      ],
    ),
    ),
  );
}


