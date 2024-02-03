import 'package:flutter/material.dart';


class favBtn extends StatelessWidget {
  const favBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        right: 0,
        bottom: 0,
        child: InkWell(
          onTap: () {
            //TODO:: Save to fav
            debugPrint("save to fav");
          },
          borderRadius: BorderRadius.circular(50),
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Theme.of(context).colorScheme.inversePrimary,
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context)
                        .colorScheme
                        .shadow
                        .withOpacity(0.2),
                    offset: Offset(5, 4),
                    blurRadius: 2,
                  )
                ]),
            child: Center(
              child: Icon(
                Icons.favorite_border_rounded,
                color: Theme.of(context).colorScheme.outline,
              ),
            ),
          ),
        ));
  }
}
