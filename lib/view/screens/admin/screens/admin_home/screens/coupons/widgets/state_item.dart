
import 'package:flutter/material.dart';

class StateItem extends StatelessWidget {
  const StateItem({
    super.key, required this.onPressed, required this.title, required this.iconColor, required this.icon, required this.background,
  });
final Function onPressed;
final String title;
final Color iconColor;
final IconData icon; 
final Color background;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
          onTap: () => onPressed(),
          child: Container(
            height: 90,
            decoration: BoxDecoration(
                color:background,
                borderRadius: BorderRadius.circular(10)),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Icon(icon ,color:iconColor),
                  Text(
                   title,
                    style: TextStyle(color: Colors.white),
                  )
                ]),
          )),
    );
  }
}
