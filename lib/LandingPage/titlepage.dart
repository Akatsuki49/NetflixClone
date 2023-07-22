import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflixclone/LandingPage/tabbar_pg.dart';
import 'package:netflixclone/LandingPage/video_controller.dart';
import 'package:netflixclone/pages/homepage.dart';
import 'package:netflixclone/pages/navigator.dart';
import 'package:video_player/video_player.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'UpperAppbar.dart';

class TitlePage extends StatefulWidget {
  final String title;
  final String videoUrl;

  const TitlePage({Key? key, required this.title, required this.videoUrl})
      : super(key: key);

  @override
  State<TitlePage> createState() => _TitlePageState();
}

class _TitlePageState extends State<TitlePage> {
  int current = 0;

  @override
  Widget build(BuildContext context) {
    print("TitlePage");
    print(widget.title);
    print(widget.videoUrl);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * 0.05),
        child: UpperAppBar(context),
      ),
      backgroundColor: Colors.black,
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance.collection('Titles').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var documents = snapshot.data!.docs;

            var matchingDocuments = documents.where(
              (document) => document.data()['title'] == widget.title,
            );

            if (matchingDocuments.isNotEmpty) {
              var matchingDocument = matchingDocuments.first;
              var data = matchingDocument.data() as Map<String, dynamic>;
              // print("Data ${data}"); just checking the data was getting a lotta errors lol
              return Padding(
                padding: EdgeInsets.only(top: size.height * 0.007),
                child: Column(
                  children: [
                    Container(
                        child: VideoController(
                      videoUrl: widget.videoUrl,
                    )),
                    Container(
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: size.width * 0.02,
                            top: size.height * 0.01,
                            right: size.width * 0.02),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.title,
                              style: GoogleFonts.comfortaa(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w900),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(top: size.height * 0.008),
                              child: Row(
                                children: [
                                  Text(
                                    data['year'].toString() ?? 'year not found',
                                    style: GoogleFonts.poppins(
                                        color: Colors.grey.withOpacity(0.99),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(width: size.width * 0.03),
                                  Container(
                                    width: size.width * 0.033,
                                    height: size.height * 0.024,
                                    decoration: BoxDecoration(
                                        color: Colors.grey.withOpacity(0.5)),
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(1.0),
                                        child: Text(
                                          data['rating'].toString() ??
                                              'rating not found',
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.poppins(
                                              color:
                                                  Colors.grey.withOpacity(0.99),
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: size.width * 0.03),
                                  Text(
                                    data['seasons'].toString() ?? '0',
                                    style: GoogleFonts.poppins(
                                        color: Colors.grey.withOpacity(0.99),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(width: size.width * 0.03),
                                  Icon(
                                    Icons.comment_rounded,
                                    size: 25,
                                    color: Colors.white.withOpacity(0.8),
                                  ),
                                ],
                              ),
                            ),
                            ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                                fixedSize: MaterialStateProperty.all<Size>(
                                    Size.fromWidth(size.width)),
                              ),
                              onPressed: () => {},
                              // onPressed: () => {}Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) => FullScreenVid(
                              //             videoUrl: widget.videoUrl,
                              //           )),
                              // ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.play_arrow,
                                    color: Colors.black,
                                    size: 22,
                                  ),
                                  SizedBox(width: size.width * 0.01),
                                  Text(
                                    'Play',
                                    style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.grey.withOpacity(0.25)),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                                fixedSize: MaterialStateProperty.all<Size>(
                                    Size.fromWidth(size.width)),
                              ),
                              onPressed: null,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.download_outlined,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                  SizedBox(width: size.width * 0.01),
                                  Text(
                                    'Download',
                                    style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(width: size.width * 0.01),
                                  Text(
                                    'S1:E1',
                                    style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              data['desc'].toString() ?? 'desc not found',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                            SizedBox(height: size.height * 0.01),
                            Row(
                              children: [
                                Text(
                                  'Starring: ',
                                  style: GoogleFonts.poppins(
                                    color: Colors.grey.withOpacity(0.99),
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  data['starring'].toString() ??
                                      'starring not found',
                                  style: GoogleFonts.poppins(
                                    color: Colors.grey.withOpacity(0.7),
                                    fontSize: 12,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () => null,
                                  child: Text(
                                    '...more',
                                    style: GoogleFonts.poppins(
                                      color: Colors.grey.withOpacity(0.99),
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'Creator: ',
                                  style: GoogleFonts.poppins(
                                    color: Colors.grey.withOpacity(0.99),
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  data['creators'].toString() ??
                                      'creator not found',
                                  style: GoogleFonts.poppins(
                                    color: Colors.grey.withOpacity(0.7),
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: size.height * 0.01),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InkWell(
                                  splashColor: Colors.grey.withOpacity(0.8),
                                  child: Column(
                                    children: [
                                      IconButton(
                                        onPressed: () => null,
                                        icon: Icon(
                                          Icons.check,
                                          color: Colors.white,
                                          size: 30,
                                        ),
                                      ),
                                      Text(
                                        'My List',
                                        style: GoogleFonts.poppins(
                                          color: Colors.grey.withOpacity(0.7),
                                          fontSize: 10,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                InkWell(
                                  splashColor: Colors.grey.withOpacity(0.8),
                                  child: Column(
                                    children: [
                                      IconButton(
                                        onPressed: () => null,
                                        icon: Icon(
                                          Icons.thumb_up_alt_outlined,
                                          color: Colors.white,
                                          size: 30,
                                        ),
                                      ),
                                      Text(
                                        'Rate',
                                        style: GoogleFonts.poppins(
                                          color: Colors.grey.withOpacity(0.7),
                                          fontSize: 10,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                InkWell(
                                  splashColor: Colors.grey.withOpacity(0.8),
                                  child: Column(
                                    children: [
                                      IconButton(
                                        onPressed: () => null,
                                        icon: Icon(
                                          Icons.share,
                                          color: Colors.white,
                                          size: 30,
                                        ),
                                      ),
                                      Text(
                                        'Share',
                                        style: GoogleFonts.poppins(
                                          color: Colors.grey.withOpacity(0.7),
                                          fontSize: 10,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                InkWell(
                                  splashColor: Colors.grey.withOpacity(0.8),
                                  child: Column(
                                    children: [
                                      IconButton(
                                        onPressed: () => null,
                                        icon: Icon(
                                          Icons.download_rounded,
                                          color: Colors.white,
                                          size: 30,
                                        ),
                                      ),
                                      Text(
                                        'Download Season 1',
                                        style: GoogleFonts.poppins(
                                          color: Colors.grey.withOpacity(0.7),
                                          fontSize: 10,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Divider(
                      height: size.height * 0.02,
                      color: Colors.grey.withOpacity(0.7),
                    ),
                  ],
                ),
              );
            } else {
              return Center(
                child: Text(
                  'Error: Document not found',
                  style: TextStyle(color: Colors.red),
                ),
              );
            }
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error: ${snapshot.error}',
                style: TextStyle(color: Colors.red),
              ),
            );
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
