import 'package:flutter/material.dart';
import '../widgets/bottom_navigation_bar.dart';
import './search_screen.dart'; 
import './messages_screen.dart';
import './home_content.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedBottomIndex = 0;

  final List<Widget> _screens = [
    const HomeContent(),
    const SearchScreen(),
    const Placeholder(),
    const Placeholder(),
    const Placeholder(),
    const MessagesScreen(), 
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedBottomIndex],
      bottomNavigationBar: BottomNavBar(
        onTap: (index) {
          setState(() {
            _selectedBottomIndex = index;
          });
        },
        currentIndex: _selectedBottomIndex,
      ),
    );
  }
}
