import 'package:flutter/material.dart';
import '../data/mock_data.dart';
import '../widgets/tweet_card.dart';
import '../widgets/top_navigation_bar.dart';
import '../widgets/bottom_navigation_bar.dart';
import '../widgets/custom_app_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedBottomIndex = 0;
  int _selectedTopIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Fondo blanco para todo el HomeScreen
      extendBodyBehindAppBar: false, // Evita que el contenido pase detrás del AppBar
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60), // Tamaño del AppBar
        child: Container(
          color: Colors.white, // Fondo blanco explícito para evitar colores extraños
          child: CustomAppBar(),
        ),
      ), // Widget de AppBar
      body: Container(
        color: Colors.white, // Fondo blanco explícito para el contenido del cuerpo
        child: ListView(
          children: [
            TopNavigationBar(
              selectedIndex: _selectedTopIndex,
              onTabSelected: (index) {
                setState(() => _selectedTopIndex = index);
              },
            ),
            _buildPageContent(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.blue,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        child: Icon(Icons.add, color: Colors.white, size: 30),
      ),
      bottomNavigationBar: BottomNavBar(
        onTap: (index) {
          setState(() => _selectedBottomIndex = index);
        },
        currentIndex: _selectedBottomIndex,
      ),
    );
  }

  Widget _buildPageContent() {
    // Ambas pestañas mostrarán la misma lista de TweetCard
    return Column(
      children: List.generate(
        mockTweets.length,
        (index) => TweetCard(tweet: mockTweets[index]),
      ),
    );
  }
}

