import 'package:flutter/material.dart';
import './screens/home_page.dart';
import './screens/team_page.dart';
import './screens/compte.dart';

class ContentScreen extends StatefulWidget {
  const ContentScreen({super.key});

  @override
  State createState() => _ContentScreenState();
}

class _ContentScreenState extends State<ContentScreen> {
  final List<Widget> _screenList = [
    HomePage(),
    TeamsPage(),
    const CompteScreen(),
  ];

  int _currentScreen = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        centerTitle: true,
        title: const Text(
          "NBA app",
          style: TextStyle(color: Colors.white), // Set the text color to white
        ),
        leading: IconButton(
          icon: Image.asset(
            'assets/images/logo.jpg', // Ensure the image path is correct
            height: 40, // Adjust height as needed
            width: 40, // Adjust width as needed
            // Set the image color to white if needed
          ),
          onPressed: () {
            setState(() {
              _currentScreen = 0; // Index of the HomeScreen
            });
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle,
                color: Colors.white), // Set the icon color to white
            onPressed: () {
              setState(() {
                _currentScreen = 2; // Index of the CompteScreen
              });
            },
          ),
        ],
      ),
      body: _screenList[_currentScreen],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.black, // Set unselected item color to black
        selectedIconTheme: const IconThemeData(
            color: Colors.black), // Set selected icon color to black
        unselectedIconTheme: const IconThemeData(
            color: Colors.black), // Set unselected icon color to black
        selectedLabelStyle: const TextStyle(
            color: Colors.white), // Set selected label style to white
        unselectedLabelStyle: const TextStyle(
            color: Colors.white), // Set unselected label style to white
        iconSize: 35,
        currentIndex: _currentScreen,
        onTap: (index) {
          setState(() {
            _currentScreen = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Accueil'),
          BottomNavigationBarItem(
              icon: Icon(Icons.group), label: 'Team'), // Update label
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: 'Compte'),
        ],
      ),
    );
  }
}
