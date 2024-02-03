import 'package:flutter/material.dart';
import 'package:shop_app/resources/string_manager.dart';
import 'package:shop_app/resources/values_manager.dart';
import '../bag/bag.dart';
import '../cart/cart.dart';
import '../favourite/favourite.dart';
import '../home/home.dart';
import '../profile/profile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

List<Widget> screens = const [
  Home(),
  Cart(),
  Bag(),
  Favourite(),
  Profile(),
];
List<BottomNavigationBarItem> items = const [
  BottomNavigationBarItem(
    activeIcon: Icon(Icons.home),
    icon: Icon(Icons.home_outlined),
    label: StringManager.home,
  ),
  BottomNavigationBarItem(
      activeIcon: Icon(Icons.shopping_cart_rounded),
      icon: Icon(Icons.shopping_cart_outlined),
      label: StringManager.cart),
  BottomNavigationBarItem(
      activeIcon: Icon(Icons.shopping_bag_rounded),
      icon: Icon(Icons.shopping_bag_outlined),
      label: StringManager.bag),
  BottomNavigationBarItem(
      activeIcon: Icon(Icons.favorite_rounded),
      icon: Icon(Icons.favorite_border_rounded),
      label: StringManager.favourite),
  BottomNavigationBarItem(
      activeIcon: Icon(Icons.person),
      icon: Icon(Icons.person_outline_rounded),
      label: StringManager.profile),
];

int currentIndex = 0;
PageController controller = PageController(initialPage: currentIndex);

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(SizeManager.radiusOfBNB),
            topRight: Radius.circular(SizeManager.radiusOfBNB),
          ),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Theme.of(context).colorScheme.surface,
              offset: SizeManager.shadowOffsetBNB,
              spreadRadius: SizeManager.sSpace,
              blurRadius: SizeManager.elevationOfBNB,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(SizeManager.radiusOfBNB),
            topRight: Radius.circular(SizeManager.radiusOfBNB),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            elevation: SizeManager.elevationOfBNB,
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            items: items,
            currentIndex: currentIndex,
            onTap: (index) {
              setState(() {
                currentIndex = index;
                // controller.jumpToPage(index);
                controller.animateToPage(index,
                    duration: const Duration(seconds: 1),
                    curve: Curves.fastEaseInToSlowEaseOut);
              });
            },
          ),
        ),
      ),
      body: PageView(
          controller: controller,
          children: screens,
          onPageChanged: (value) => setState(() {
                currentIndex = value;
              })),
    );
  }
}
