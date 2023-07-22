import 'titlepage.dart';
import 'package:flutter/material.dart';
import '/pages/navigator.dart';

class UpperAppBar extends StatelessWidget {
  final BuildContext context;

  UpperAppBar(this.context);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: Colors.white,
          size: 30,
        ),
        onPressed: () {
          Navigator.pop(
            context,
            MaterialPageRoute(builder: (context) => Navgator()),
          );
        },
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.search,
            color: Colors.white,
            size: 30,
          ),
          onPressed: null,
        ),
        IconButton(
          icon: Image.asset('assets/images/ProfileImg.jpg', width: 30),
          onPressed: null,
        ),
      ],
    );
  }
}
