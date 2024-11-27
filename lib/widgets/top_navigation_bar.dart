import 'package:flutter/material.dart';

class TopNavigationBar extends StatelessWidget {
  final int selectedIndex; // Índice de la pestaña activa
  final Function(int) onTabSelected; // Función para manejar clics en las pestañas

  const TopNavigationBar({
    required this.selectedIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildTabItem(
                context: context,
                label: 'Para ti',
                index: 0,
              ),
              _buildTabItem(
                context: context,
                label: 'Siguiendo',
                index: 1,
              ),
            ],
          ),
        ),
        Container(
          height: 1, // Altura de la línea gris
          color: Colors.grey.shade300, // Color de la línea gris
        ),
      ],
    );
  }

  Widget _buildTabItem({
    required BuildContext context,
    required String label,
    required int index,
  }) {
    final isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () => onTabSelected(index), // Llama a la función con el índice de la pestaña
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.black : Colors.grey,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          SizedBox(height: 4), // Espacio entre el texto y la barra
          Container(
            height: 2,
            width: 40,
            color: isSelected ? Colors.blue : Colors.transparent,
          ),
        ],
      ),
    );
  }
}



