import 'package:flutter/material.dart';
import '../data/mock_data.dart';
import '../widgets/tweet_card.dart';
import '../widgets/top_navigation_bar.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  final PageController _pageController = PageController(); // Controlador de páginas
  int _selectedIndex = 0;

  @override
  void dispose() {
    _pageController.dispose(); // Limpia el controlador al destruir el widget
    super.dispose();
  }

  void _onTabSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Padding(
          padding: EdgeInsets.all(12),
          child: CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage(
              "https://img.freepik.com/foto-gratis/retrato-expresivo-mujer-joven_1258-48167.jpg",
            ),
            backgroundColor: Colors.transparent,
          ),
        ),
        title: Center(
          child: Image.network(
            "https://images.freeimages.com/image/large-previews/b2e/x-twitter-black-isolated-logo-5694253.png?fmt=webp&w=500",
            height: 30,
            fit: BoxFit.contain,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          TopNavigationBar(
            selectedIndex: _selectedIndex,
            onTabSelected: _onTabSelected,
          ),
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              children: [
                _buildTweetList("Para ti"),
                _buildTweetList("Siguiendo"),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Acción del botón flotante en Home
        },
        backgroundColor: Colors.blue,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        child: const Icon(Icons.add, color: Colors.white, size: 30),
      ),
    );
  }

  Widget _buildTweetList(String title) {
    return ListView.builder(
      itemCount: mockTweets.length,
      itemBuilder: (context, index) {
        return TweetCard(tweet: mockTweets[index]);
      },
    );
  }
}
