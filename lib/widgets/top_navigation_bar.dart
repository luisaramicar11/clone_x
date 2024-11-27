import 'package:flutter/material.dart';

class TopNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabSelected;

  const TopNavigationBar({
    super.key,
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
          height: 1,
          color: Colors.grey.shade300,
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
      onTap: () => onTabSelected(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.black : Colors.grey,
              fontSize: isSelected ? 16 : 14, // Cambia el tamaño de la fuente
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          const SizedBox(height: 4),
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            height: 2,
            width: 40,
            color: isSelected ? Colors.blue : Colors.transparent,
          ),
        ],
      ),
    );
  }
}




