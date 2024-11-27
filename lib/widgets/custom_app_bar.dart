import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white, 
      elevation: 0, 
      leading: const Padding(
        padding: EdgeInsets.all(12), 
        child: CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(
              "https://img.freepik.com/foto-gratis/retrato-expresivo-mujer-joven_1258-48167.jpg"),
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
          onPressed: () {
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0); 
}

