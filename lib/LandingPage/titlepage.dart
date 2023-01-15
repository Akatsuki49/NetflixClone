import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflixclone/LandingPage/tabbar_pg.dart';
import 'package:netflixclone/pages/homepage.dart';
import 'package:netflixclone/pages/navigator.dart';
import 'package:video_player/video_player.dart';

//UpperNavBar
//video preview
//Container
//Name
//{List of particulars}
//Play Btn
//Download Btn
//Description
//Strarring
//creator
//Row List : List, Rate, Share, Download S1.
//Tab Bar : Episodes, TrailersNMore, MoreLikeThis
//DropDownList : Seasons list
//Episodes : E1 : Container :{}..
//TrailersNMore : Vidoes
//MoreLikeThis : 9 random suggestions. : if i can ill do.

class TitlePage extends StatefulWidget {
  const TitlePage({Key? key}) : super(key: key);

  @override
  State<TitlePage> createState() => _TitlePageState();
}

class _TitlePageState extends State<TitlePage> {
  int current = 0;
  @override
  Widget build(BuildContext context) {
    List<String> items = [
      "EPISODES",
      "TRAILERS & MORE",
      "MORE LIKE THIS",
    ];
    List<Widget> itemsPages = [
      Episodes(),
      TrailersNMore(),
      MoreLikeThis(),
    ];
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * 0.05),
        child: UpperAppBar(),
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.only(top: size.height * 0.007),
        child: Column(
          children: [
            Container(child: VideoController()),
            Container(
              child: Padding(
                padding: EdgeInsets.only(
                    left: size.width * 0.02,
                    top: size.height * 0.01,
                    right: size.width * 0.02),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Peaky Blinders",
                        style: GoogleFonts.comfortaa(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w900)),
                    Padding(
                      padding: EdgeInsets.only(top: size.height * 0.008),
                      child: Row(
                        children: [
                          Text("2022",
                              style: GoogleFonts.poppins(
                                  color: Colors.grey.withOpacity(0.99),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500)),
                          SizedBox(width: size.width * 0.03),
                          Container(
                            width: size.width * 0.033,
                            height: size.height * 0.024,
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.5)),
                            child: Center(
                              child: Text("A",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                      color: Colors.grey.withOpacity(0.99),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500)),
                            ),
                          ),
                          SizedBox(width: size.width * 0.03),
                          Text("6-Seasons",
                              style: GoogleFonts.poppins(
                                  color: Colors.grey.withOpacity(0.99),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500)),
                          SizedBox(width: size.width * 0.03),
                          Icon(Icons.comment_rounded,
                              size: 25, color: Colors.white.withOpacity(0.8))
                        ],
                      ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          fixedSize: MaterialStateProperty.all<Size>(
                              Size.fromWidth(size.width))),
                      onPressed: null,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.play_arrow,
                              color: Colors.black,
                              size: 22,
                            ),
                            SizedBox(width: size.width * 0.01),
                            Text('Play',
                                style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold))
                          ]),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.grey.withOpacity(0.25)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          fixedSize: MaterialStateProperty.all<Size>(
                              Size.fromWidth(size.width))),
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
                            Text('Download',
                                style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(width: size.width * 0.01),
                            Text('S1:E1',
                                style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold)),
                          ]),
                    ),
                    Text(
                      'A notorious gang in 1919 Birminham, England, is led by the fierce Tommy Shelby, a crime boss set on moving up in the world no matter the cost.',
                      style: GoogleFonts.poppins(
                          color: Colors.white, fontSize: 12),
                    ),
                    SizedBox(height: size.height * 0.01),
                    Row(
                      children: [
                        Text(
                          'Starring: ',
                          style: GoogleFonts.poppins(
                              color: Colors.grey.withOpacity(0.99),
                              fontSize: 12),
                        ),
                        Text(
                          'Cillian Murphy,Sam Neill, Helen McCory',
                          style: GoogleFonts.poppins(
                              color: Colors.grey.withOpacity(0.7),
                              fontSize: 12),
                        ),
                        GestureDetector(
                          onTap: () => null,
                          child: Text(
                            '...more',
                            style: GoogleFonts.poppins(
                                color: Colors.grey.withOpacity(0.99),
                                fontSize: 12),
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
                              fontSize: 12),
                        ),
                        Text(
                          'Steven Knight',
                          style: GoogleFonts.poppins(
                              color: Colors.grey.withOpacity(0.7),
                              fontSize: 12),
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
                                  )),
                              Text(
                                'My List',
                                style: GoogleFonts.poppins(
                                    color: Colors.grey.withOpacity(0.7),
                                    fontSize: 10),
                              )
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
                                  )),
                              Text(
                                'Rate',
                                style: GoogleFonts.poppins(
                                    color: Colors.grey.withOpacity(0.7),
                                    fontSize: 10),
                              )
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
                                  )),
                              Text(
                                'Share',
                                style: GoogleFonts.poppins(
                                    color: Colors.grey.withOpacity(0.7),
                                    fontSize: 10),
                              )
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
                                  )),
                              Text(
                                'Download Season 1',
                                style: GoogleFonts.poppins(
                                    color: Colors.grey.withOpacity(0.7),
                                    fontSize: 10),
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Divider(
              height: size.height * 0.02,
              color: Colors.grey.withOpacity(0.7),
            ),
            //TabBar :
            // Padding(
            //   padding: EdgeInsets.only(
            //       left: size.width * 0.03, right: size.width * 0.03),
            //   child: SizedBox(
            //     width: double.infinity,
            //     height: 60,
            //     child: ListView.builder(
            //       physics: const BouncingScrollPhysics(),
            //       itemCount: items.length,
            //       scrollDirection: Axis.horizontal,
            //       itemBuilder: (ctx, index) {
            //         return GestureDetector(
            //           onTap: () => setState(() {
            //             current = index;
            //           }),
            //           child: Padding(
            //             padding: EdgeInsets.only(right: size.width * 0.1),
            //             child: AnimatedContainer(
            //               duration: const Duration(milliseconds: 300),
            //               decoration: BoxDecoration(
            //                 border: current == index
            //                     ? Border(
            //                         top: BorderSide(
            //                             color: Color.fromARGB(255, 225, 26, 12),
            //                             width: size.height * 0.005),
            //                       )
            //                     : Border(
            //                         top: BorderSide(
            //                             color: Colors.black,
            //                             width: size.height * 0.005),
            //                       ),
            //               ),
            //               child: Text(items[index],
            //                   style: GoogleFonts.bebasNeue(
            //                       fontSize: 22,
            //                       fontWeight: FontWeight.w500,
            //                       color: current == index
            //                           ? Colors.white
            //                           : Colors.grey.withOpacity(0.99))),
            //             ),
            //           ),
            //         );
            //       },
            //     ),
            //   ),
            // ),
            // itemsPages[current],
            //Episodes()
            // Container(
            //   width: double.infinity,
            //   child: itemsPages[current],
            // ),
          ],
        ),
      ),
    );
  }

  Widget UpperAppBar() {
    return AppBar(
      backgroundColor: Colors.black,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: Colors.white,
          size: 30,
        ),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Navgator()));
        },
      ),
      // leading: Icon(
      //   Icons.arrow_back,
      //   color: Colors.white,
      //   size: 30,
      // ),
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
        )
      ],
    );
  }
}

//Video Mfknn shit.

class VideoController extends StatefulWidget {
  const VideoController({Key? key}) : super(key: key);

  @override
  State<VideoController> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoController> {
  late VideoPlayerController controller;
  final asset = 'assets/videos/SoClose-ThomasShelby.mp4';

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.asset(asset)
      ..addListener(() => setState(() {}))
      ..setLooping(
          true) //if u can after vid finishes : pause it and add a peaky blinders logo
      ..initialize().then((_) => controller.play());
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final isMuted = controller.value.volume == 0;
    return Stack(children: [
      VideoPlayerWidget(controller: controller),
      if (controller != null && controller.value.isInitialized)
        Positioned(
          top: size.height * 0.185,
          left: size.width * 0.85,
          child: IconButton(
            icon: Icon(
              isMuted ? Icons.volume_off : Icons.volume_up,
              color: Colors.white,
              size: 20,
            ),
            onPressed: () => controller.setVolume(isMuted ? 1 : 0),
          ),
        ),
      Positioned(
        top: size.height * 0.205,
        left: size.width * 0.02,
        child: Container(
          width: size.width * 0.16,
          height: size.height * 0.026,
          decoration: BoxDecoration(color: Colors.black.withOpacity(0.39)),
          child: Center(
            child: Text('Preview',
                style: GoogleFonts.ptSans(color: Colors.white, fontSize: 15)),
          ),
        ),
      )
    ]);
  }
}

class VideoPlayerWidget extends StatelessWidget {
  final VideoPlayerController controller;

  const VideoPlayerWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return controller != null && controller.value.isInitialized
        ? Container(
            alignment: Alignment.topCenter,
            child: buildVideo(),
          )
        : Container(
            height: 100,
            child: Center(child: CircularProgressIndicator()),
          );
  }

  Widget buildVideo() => Stack(children: <Widget>[
        buildVideoPlayer(),
        Positioned.fill(child: BasicOverlayWidget(controller: controller)),
      ]);

  Widget buildVideoPlayer() => AspectRatio(
      aspectRatio: controller.value.aspectRatio,
      child: VideoPlayer(controller));
}

class BasicOverlayWidget extends StatelessWidget {
  final VideoPlayerController controller;

  const BasicOverlayWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () =>
            controller.value.isPlaying ? controller.pause() : controller.play(),
        child: Stack(
          children: <Widget>[
            buildPlay(),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: buildIndicator(),
            ),
          ],
        ),
      );

  Widget buildIndicator() => VideoProgressIndicator(
        controller,
        allowScrubbing: true,
        colors: VideoProgressColors(
            backgroundColor: Color.fromARGB(255, 115, 11, 3),
            playedColor: Color.fromARGB(255, 225, 26, 12)),
      );

  Widget buildPlay() => controller.value.isPlaying
      ? Container()
      : Container(
          alignment: Alignment.center,
          color: Colors.black26,
          child: Icon(Icons.play_arrow, color: Colors.white, size: 80),
        );
}
