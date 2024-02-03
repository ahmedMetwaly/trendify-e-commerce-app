import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({
    super.key,
  });

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final List<BottomNavigationBarItem> items = const [
    BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "Home"),
    BottomNavigationBarItem(
        icon: Icon(Icons.shopping_cart_outlined), label: "Cart"),
    BottomNavigationBarItem(
        icon: Icon(Icons.shopping_bag_outlined), label: "Bag"),
    BottomNavigationBarItem(
        icon: Icon(Icons.favorite_border_rounded), label: "Favourite"),
    BottomNavigationBarItem(
        icon: Icon(Icons.person_outline_rounded), label: "Profile"),
  ];

  int current_index = 0;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(12),
        topRight: Radius.circular(12.0),
      ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        items: items,
        currentIndex: current_index,
        onTap: (index) {
          setState(() {
            current_index = index;
          });
        },
      ),
    );
  }
}
