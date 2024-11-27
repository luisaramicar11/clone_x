import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final Function(int) onTap;
  final int currentIndex;

  const BottomNavBar({
    required this.onTap,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: onTap,
      currentIndex: currentIndex, // Indica cuál pestaña está activa
      type: BottomNavigationBarType.fixed, // Mantiene los íconos alineados
      selectedItemColor: Colors.black, // Color del ícono seleccionado
      unselectedItemColor: Colors.black54, // Color de íconos no seleccionados
      showSelectedLabels: false, // Oculta el texto del ítem seleccionado
      showUnselectedLabels: false, // Oculta el texto del ítem no seleccionado
      backgroundColor: Colors.white, // Cambia el fondo del BottomNavigationBar a blanco
      items: [
        const BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.browser_not_supported, size: 22), // Icono de lápiz
          label: 'Compose',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.group),
          label: 'Users',
        ),
        BottomNavigationBarItem(
          icon: Stack(
            clipBehavior: Clip.none,
            children: [
              const Icon(Icons.notifications),
              Positioned(
                right: -2,
                top: -2,
                child: Container(
                  padding: const EdgeInsets.all(3),
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                  child: const Text(
                    '1',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          label: 'Notifications',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.mail), // Icono de la carta
          label: 'Messages',
        ),
      ],
    );
  }
}
