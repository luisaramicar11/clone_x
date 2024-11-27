import 'package:flutter/material.dart';
import '../data/mock_trends.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

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
        title: TextField(
          decoration: InputDecoration(
            hintText: "Buscar X",
            filled: true,
            fillColor: Colors.grey[200],
            contentPadding: const EdgeInsets.symmetric(vertical: 8),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none,
            ),
            prefixIcon: const Icon(Icons.search),
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
          _buildTabs(),
          Expanded(child: _buildTrendsList()),
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

  Widget _buildTabs() {
    return Container(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildTab("Para ti", isSelected: true),
          _buildTab("Tendencias"),
          _buildTab("Noticias"),
          _buildTab("Deportes"),
        ],
      ),
    );
  }

  Widget _buildTab(String label, {bool isSelected = false}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: TextStyle(
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            color: isSelected ? Colors.black : Colors.grey,
          ),
        ),
        if (isSelected)
          Container(
            width: 30,
            height: 2,
            color: Colors.black,
            margin: const EdgeInsets.only(top: 4),
          ),
      ],
    );
  }

  Widget _buildTrendsList() {
    return ListView.builder(
      itemCount: mockTrends.length,
      itemBuilder: (context, index) {
        final trend = mockTrends[index];
        return ListTile(
          title: Text(trend.title, style: const TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(trend.location, style: const TextStyle(color: Colors.grey)),
              if (trend.tweetCount.isNotEmpty)
                Text(trend.tweetCount, style: const TextStyle(color: Colors.grey)),
            ],
          ),
          trailing: const Icon(Icons.more_vert),
        );
      },
    );
  }
}
