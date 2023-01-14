import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:netflixclone/pages/homepage.dart';
import 'package:netflixclone/pages/homepage_items.dart';

class Navgator extends StatefulWidget {
  const Navgator({Key? key}) : super(key: key);

  @override
  State<Navgator> createState() => _NavgatorState();
}

class _NavgatorState extends State<Navgator> {
  int activeTab = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false,
      body: getBody(),
      bottomNavigationBar: getFooter(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return IndexedStack(
      index: activeTab,
      children: [
        HomePage(),
        Center(
          child: Text(
            "Downloads",
            style: TextStyle(fontSize: 25, color: Colors.white),
          ),
        )
      ],
    );
  }

  Widget getFooter() {
    return Container(
      height: 80,
      decoration: BoxDecoration(color: Colors.black),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(nvbar.length, (index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                activeTab = index;
              });
            },
            child: Column(
              children: [
                Icon(
                  nvbar[index]['icon'],
                  color: activeTab == index
                      ? Colors.white
                      : Colors.white.withOpacity(0.5),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  nvbar[index]['text'],
                  style: TextStyle(
                      fontSize: 10,
                      color: activeTab == index
                          ? Colors.white
                          : Colors.white.withOpacity(0.5)),
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
