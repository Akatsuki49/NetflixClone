import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:netflixclone/LandingPage/titlepage.dart';
import 'package:netflixclone/pages/homepage_items.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false,
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              width: size.height - 80,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 500,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/images/baner.webp"),
                                fit: BoxFit.cover)),
                      ),
                      Container(
                          height: 500,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                Colors.black.withOpacity(0.7),
                                Colors.black.withOpacity(0.0),
                              ],
                                  end: Alignment.topCenter,
                                  begin: Alignment.bottomCenter))),
                      Container(
                        height: 500,
                        width: size.width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/images/title.png",
                              width: 270,
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Text(
                              "Anime - Action - Thriller - Japanese",
                              style:
                                  TextStyle(fontSize: 12, color: Colors.white),
                            ),
                            SizedBox(
                              height: 12,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          GestureDetector(
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 25,
                            ),
                            onTap: () {},
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "My list",
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      GestureDetector(
                        child: Card(
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(
                                      Icons.play_arrow,
                                      color: Colors.black,
                                      size: 30,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "Play",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        onTap: () {},
                      ),
                      GestureDetector(
                        child: Column(
                          children: [
                            Icon(
                              Icons.info_outline,
                              color: Colors.white,
                              size: 25,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Info",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        onTap: () {},
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "My List",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Row(
                              children:
                                  List.generate(myListData.length, (index) {
                                final imageUrl = myListData[index]['imageUrl'];
                                final hasValidImage =
                                    imageUrl != null && imageUrl.isNotEmpty;

                                print(imageUrl);

                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => TitlePage()),
                                    );
                                  },
                                  child: hasValidImage
                                      ? Container(
                                          margin: EdgeInsets.only(right: 8),
                                          height: size.height * 0.17,
                                          width: size.width * 0.25,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: NetworkImage(imageUrl),
                                              fit: BoxFit.cover,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(6),
                                          ),
                                        )
                                      : Container(
                                          height: 0,
                                          width: 0,
                                          // margin: EdgeInsets.only(right: 8),
                                          // height: size.height * 0.17,
                                          // width: size.width * 0.25,
                                          color:
                                              Colors.grey, // Placeholder color
                                        ),
                                );
                              }),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Anime",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Row(
                              children:
                                  List.generate(animeData.length, (index) {
                                final imageUrl = animeData[index]['imageUrl'];
                                final hasValidImage =
                                    imageUrl != null && imageUrl.isNotEmpty;

                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => TitlePage()),
                                    );
                                  },
                                  child: hasValidImage
                                      ? Container(
                                          margin: EdgeInsets.only(right: 8),
                                          height: size.height * 0.17,
                                          width: size.width * 0.25,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: NetworkImage(imageUrl),
                                              fit: BoxFit.cover,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(6),
                                          ),
                                        )
                                      : Container(
                                          height: 0,
                                          width: 0,
                                          // margin: EdgeInsets.only(right: 8),
                                          // height: size.height * 0.17,
                                          // width: size.width * 0.25,
                                          color:
                                              Colors.grey, // Placeholder color
                                        ),
                                );
                              }),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.04,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Popular On Netflix",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Row(
                              children: List.generate(popularListData.length,
                                  (index) {
                                final imageUrl =
                                    popularListData[index]['imageUrl'];
                                final hasValidImage =
                                    imageUrl != null && imageUrl.isNotEmpty;

                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => TitlePage()),
                                    );
                                  },
                                  child: hasValidImage
                                      ? Container(
                                          margin: EdgeInsets.only(right: 8),
                                          height: size.height * 0.17,
                                          width: size.width * 0.25,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: NetworkImage(imageUrl),
                                              fit: BoxFit.cover,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(6),
                                          ),
                                        )
                                      : Container(
                                          height: 0,
                                          width: 0,
                                          // margin: EdgeInsets.only(right: 8),
                                          // height: size.height * 0.17,
                                          // width: size.width * 0.25,
                                          color:
                                              Colors.grey, // Placeholder color
                                        ),
                                );
                              }),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.04,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Trending Now",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Row(
                              children: List.generate(trendingListData.length,
                                  (index) {
                                final imageUrl =
                                    trendingListData[index]['imageUrl'];
                                final hasValidImage =
                                    imageUrl != null && imageUrl.isNotEmpty;

                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => TitlePage()),
                                    );
                                  },
                                  child: hasValidImage
                                      ? Container(
                                          margin: EdgeInsets.only(right: 8),
                                          height: size.height * 0.17,
                                          width: size.width * 0.25,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: NetworkImage(imageUrl),
                                              fit: BoxFit.cover,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(6),
                                          ),
                                        )
                                      : Container(
                                          height: 0,
                                          width: 0,
                                          // margin: EdgeInsets.only(right: 8),
                                          // height: size.height * 0.17,
                                          // width: size.width * 0.25,
                                          color:
                                              Colors.grey, // Placeholder color
                                        ),
                                );
                              }),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.04,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Movies",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Row(
                              children:
                                  List.generate(moviesData.length, (index) {
                                final imageUrl = moviesData[index]['imageUrl'];
                                final hasValidImage =
                                    imageUrl != null && imageUrl.isNotEmpty;

                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => TitlePage()),
                                    );
                                  },
                                  child: hasValidImage
                                      ? Container(
                                          margin: EdgeInsets.only(right: 8),
                                          height: size.height * 0.17,
                                          width: size.width * 0.25,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: NetworkImage(imageUrl),
                                              fit: BoxFit.cover,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(6),
                                          ),
                                        )
                                      : Container(
                                          height: 0,
                                          width: 0,
                                          // margin: EdgeInsets.only(right: 8),
                                          // height: size.height * 0.17,
                                          // width: size.width * 0.25,
                                          color:
                                              Colors.grey, // Placeholder color
                                        ),
                                );
                              }),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: SafeArea(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/images/logo.ico",
                                width: 35,
                                fit: BoxFit.cover,
                              )
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            IconButton(
                                icon: Icon(
                                  Icons.search_rounded,
                                  size: 28,
                                  color: Colors.white,
                                ),
                                onPressed: () {}),
                            IconButton(
                                icon: Image.asset(
                                  'assets/images/ProfileImg.jpg',
                                  fit: BoxFit.cover,
                                  width: 26,
                                  height: 26,
                                ),
                                onPressed: () {}),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "TV Shows",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                        Text(
                          "Movies",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                        Row(
                          children: [
                            Text(
                              "Categories",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Icon(Icons.keyboard_arrow_down)
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
