// import 'package:flick_video_player/flick_video_player.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';
// import 'package:video_player/video_player.dart';

// class VideoController extends StatefulWidget {
//   const VideoController({Key? key}) : super(key: key);

//   @override
//   State<VideoController> createState() => _VideoPlayerState();
// }

// class _VideoPlayerState extends State<VideoController> {
//   late VideoPlayerController controller;
//   final asset = 'assets/videos/SoClose-ThomasShelby.mp4';

//   @override
//   void initState() {
//     super.initState();
//     controller = VideoPlayerController.asset(asset)
//       ..addListener(() => setState(() {}))
//       ..setLooping(
//           true) //if u can after vid finishes : pause it and add a peaky blinders logo
//       ..initialize().then((_) => controller.play());
//   }

//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     final isMuted = controller.value.volume == 0;
//     return Stack(children: [
//       VideoPlayerWidget(controller: controller),
//       if (controller != null && controller.value.isInitialized)
//         Positioned(
//           top: size.height * 0.185,
//           left: size.width * 0.85,
//           child: IconButton(
//             icon: Icon(
//               isMuted ? Icons.volume_off : Icons.volume_up,
//               color: Colors.white,
//               size: 20,
//             ),
//             onPressed: () => controller.setVolume(isMuted ? 1 : 0),
//           ),
//         ),
//       Positioned(
//         top: size.height * 0.205,
//         left: size.width * 0.02,
//         child: Container(
//           width: size.width * 0.16,
//           height: size.height * 0.026,
//           decoration: BoxDecoration(color: Colors.black.withOpacity(0.39)),
//           child: Center(
//             child: Text('Preview',
//                 style: GoogleFonts.ptSans(color: Colors.white, fontSize: 15)),
//           ),
//         ),
//       )
//     ]);
//   }
// }

// class VideoPlayerWidget extends StatelessWidget {
//   final VideoPlayerController controller;

//   const VideoPlayerWidget({
//     Key? key,
//     required this.controller,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return controller != null && controller.value.isInitialized
//         ? Container(
//             alignment: Alignment.topCenter,
//             child: buildVideo(),
//           )
//         : Container(
//             height: 100,
//             child: Center(child: CircularProgressIndicator()),
//           );
//   }

//   Widget buildVideo() => Stack(children: <Widget>[
//         buildVideoPlayer(),
//         Positioned.fill(child: BasicOverlayWidget(controller: controller)),
//       ]);

//   Widget buildVideoPlayer() => AspectRatio(
//       aspectRatio: controller.value.aspectRatio,
//       child: VideoPlayer(controller));
// }

// class BasicOverlayWidget extends StatelessWidget {
//   final VideoPlayerController controller;

//   const BasicOverlayWidget({
//     Key? key,
//     required this.controller,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) => GestureDetector(
//         behavior: HitTestBehavior.opaque,
//         onTap: () =>
//             controller.value.isPlaying ? controller.pause() : controller.play(),
//         child: Stack(
//           children: <Widget>[
//             buildPlay(),
//             Positioned(
//               bottom: 0,
//               left: 0,
//               right: 0,
//               child: buildIndicator(),
//             ),
//           ],
//         ),
//       );

//   Widget buildIndicator() => VideoProgressIndicator(
//         controller,
//         allowScrubbing: true,
//         colors: VideoProgressColors(
//             backgroundColor: Color.fromARGB(255, 115, 11, 3),
//             playedColor: Color.fromARGB(255, 225, 26, 12)),
//       );

//   Widget buildPlay() => controller.value.isPlaying
//       ? Container()
//       : Container(
//           alignment: Alignment.center,
//           color: Colors.black26,
//           child: Icon(Icons.play_arrow, color: Colors.white, size: 80),
//         );
// }

// //whe u press on play this must open up.

// class FullScreenVid extends StatefulWidget {
//   const FullScreenVid({Key? key}) : super(key: key);

//   @override
//   State<FullScreenVid> createState() => _FullScreenVidState();
// }

// class _FullScreenVidState extends State<FullScreenVid> {
//   late FlickManager flickManager;
//   void initState() {
//     super.initState();
//     flickManager = FlickManager(
//       videoPlayerController:
//           VideoPlayerController.asset('assets/videos/SoClose-ThomasShelby.mp4'),
//     );
//   }

//   @override
//   void dispose() {
//     flickManager.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: FlickVideoPlayer(
//         flickManager: flickManager,
//         preferredDeviceOrientation: [
//           DeviceOrientation.landscapeRight,
//           DeviceOrientation.landscapeLeft
//         ],
//         systemUIOverlay: [],
//         flickVideoWithControls: FlickVideoWithControls(
//           controls: LandscapePlayerControls(),
//         ),
//       ),
//     );
//   }
// }

// class LandscapePlayerControls extends StatelessWidget {
//   const LandscapePlayerControls(
//       {Key? key, this.iconSize = 20, this.fontSize = 12})
//       : super(key: key);
//   final double iconSize;
//   final double fontSize;

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: <Widget>[
//         FlickShowControlsAction(
//           child: FlickSeekVideoAction(
//             child: Center(
//               child: FlickVideoBuffer(
//                 child: FlickAutoHideChild(
//                   showIfVideoNotInitialized: false,
//                   child: LandscapePlayToggle(),
//                 ),
//               ),
//             ),
//           ),
//         ),
//         Positioned.fill(
//           child: FlickAutoHideChild(
//             child: Column(
//               children: <Widget>[
//                 Expanded(
//                   child: Container(),
//                 ),
//                 Container(
//                   padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//                   color: Color.fromRGBO(0, 0, 0, 0.4),
//                   child: Row(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: <Widget>[
//                       FlickPlayToggle(
//                         size: 20,
//                       ),
//                       SizedBox(
//                         width: 10,
//                       ),
//                       FlickCurrentPosition(
//                         fontSize: fontSize,
//                       ),
//                       SizedBox(
//                         width: 10,
//                       ),
//                       Expanded(
//                         child: Container(
//                           child: FlickVideoProgressBar(
//                             flickProgressBarSettings: FlickProgressBarSettings(
//                               height: 10,
//                               handleRadius: 10,
//                               padding: EdgeInsets.symmetric(
//                                 horizontal: 8.0,
//                                 vertical: 8,
//                               ),
//                               backgroundColor: Colors.white24,
//                               bufferedColor: Colors.white38,
//                               getPlayedPaint: (
//                                   {double? handleRadius,
//                                   double? height,
//                                   double? playedPart,
//                                   double? width}) {
//                                 return Paint()
//                                   ..shader = LinearGradient(colors: [
//                                     Color.fromRGBO(108, 165, 242, 1),
//                                     Color.fromRGBO(97, 104, 236, 1)
//                                   ], stops: [
//                                     0.0,
//                                     0.5
//                                   ]).createShader(
//                                     Rect.fromPoints(
//                                       Offset(0, 0),
//                                       Offset(width!, 0),
//                                     ),
//                                   );
//                               },
//                               getHandlePaint: (
//                                   {double? handleRadius,
//                                   double? height,
//                                   double? playedPart,
//                                   double? width}) {
//                                 return Paint()
//                                   ..shader = RadialGradient(
//                                     colors: [
//                                       Color.fromRGBO(97, 104, 236, 1),
//                                       Color.fromRGBO(97, 104, 236, 1),
//                                       Colors.white,
//                                     ],
//                                     stops: [0.0, 0.4, 0.5],
//                                     radius: 0.4,
//                                   ).createShader(
//                                     Rect.fromCircle(
//                                       center: Offset(playedPart!, height! / 2),
//                                       radius: handleRadius!,
//                                     ),
//                                   );
//                               },
//                             ),
//                           ),
//                         ),
//                       ),
//                       FlickTotalDuration(
//                         fontSize: fontSize,
//                       ),
//                       SizedBox(
//                         width: 10,
//                       ),
//                       FlickSoundToggle(
//                         size: 20,
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         Positioned(
//           right: 20,
//           top: 10,
//           child: GestureDetector(
//             onTap: () {
//               SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
//                   overlays: SystemUiOverlay.values);
//               SystemChrome.setPreferredOrientations(
//                   [DeviceOrientation.portraitUp]);
//               Navigator.pop(context);
//             },
//             child: Icon(
//               Icons.cancel,
//               size: 30,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// class LandscapePlayToggle extends StatelessWidget {
//   const LandscapePlayToggle({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     FlickControlManager controlManager =
//         Provider.of<FlickControlManager>(context);
//     FlickVideoManager videoManager = Provider.of<FlickVideoManager>(context);

//     double size = 50;
//     Color color = Colors.white;

//     Widget playWidget = Icon(
//       Icons.play_arrow,
//       size: size,
//       color: color,
//     );
//     Widget pauseWidget = Icon(
//       Icons.pause,
//       size: size,
//       color: color,
//     );
//     Widget replayWidget = Icon(
//       Icons.replay,
//       size: size,
//       color: color,
//     );

//     Widget child = videoManager.isVideoEnded
//         ? replayWidget
//         : videoManager.isPlaying
//             ? pauseWidget
//             : playWidget;

//     return Material(
//       color: Colors.transparent,
//       child: InkWell(
//         borderRadius: BorderRadius.circular(50),
//         splashColor: Color.fromRGBO(108, 165, 242, 0.5),
//         key: key,
//         onTap: () {
//           videoManager.isVideoEnded
//               ? controlManager.replay()
//               : controlManager.togglePlay();
//         },
//         child: Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(50),
//           ),
//           padding: EdgeInsets.all(10),
//           child: child,
//         ),
//       ),
//     );
//   }
// }
// import 'package:flick_video_player/flick_video_player.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';
// import 'package:video_player/video_player.dart';

// class VideoController extends StatefulWidget {
//   final String videoAsset;

//   const VideoController({Key? key, required this.videoAsset}) : super(key: key);

//   @override
//   State<VideoController> createState() => _VideoPlayerState();
// }

// class _VideoPlayerState extends State<VideoController> {
//   late VideoPlayerController controller;

//   @override
//   void initState() {
//     super.initState();
//     controller = VideoPlayerController.asset(widget.videoAsset)
//       ..addListener(() => setState(() {}))
//       ..setLooping(true)
//       ..initialize().then((_) => controller.play());
//   }

//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     final isMuted = controller.value.volume == 0;
//     return Stack(
//       children: [
//         VideoPlayerWidget(controller: controller),
//         if (controller.value.isInitialized)
//           Positioned(
//             top: size.height * 0.185,
//             left: size.width * 0.85,
//             child: IconButton(
//               icon: Icon(
//                 isMuted ? Icons.volume_off : Icons.volume_up,
//                 color: Colors.white,
//                 size: 20,
//               ),
//               onPressed: () => controller.setVolume(isMuted ? 1 : 0),
//             ),
//           ),
//         Positioned(
//           top: size.height * 0.205,
//           left: size.width * 0.02,
//           child: Container(
//             width: size.width * 0.16,
//             height: size.height * 0.026,
//             decoration: BoxDecoration(color: Colors.black.withOpacity(0.39)),
//             child: Center(
//               child: Text(
//                 'Preview',
//                 style: GoogleFonts.ptSans(
//                   color: Colors.white,
//                   fontSize: 15,
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// class VideoPlayerWidget extends StatefulWidget {
//   final VideoPlayerController controller;

//   const VideoPlayerWidget({
//     Key? key,
//     required this.controller,
//   }) : super(key: key);

//   @override
//   State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
// }

// class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return widget.controller != null && widget.controller.value.isInitialized
//         ? Container(
//             alignment: Alignment.topCenter,
//             child: buildVideo(),
//           )
//         : Container(
//             height: 100,
//             child: Center(child: CircularProgressIndicator()),
//           );
//   }

//   Widget buildVideo() => Stack(
//         children: <Widget>[
//           buildVideoPlayer(),
//           Positioned.fill(
//               child: BasicOverlayWidget(controller: widget.controller)),
//         ],
//       );

//   Widget buildVideoPlayer() => AspectRatio(
//         aspectRatio: widget.controller.value.aspectRatio,
//         child: VideoPlayer(widget.controller),
//       );
// }

// class BasicOverlayWidget extends StatefulWidget {
//   final VideoPlayerController controller;

//   const BasicOverlayWidget({
//     Key? key,
//     required this.controller,
//   }) : super(key: key);

//   @override
//   State<BasicOverlayWidget> createState() => _BasicOverlayWidgetState();
// }

// class _BasicOverlayWidgetState extends State<BasicOverlayWidget> {
//   @override
//   Widget build(BuildContext context) => GestureDetector(
//         behavior: HitTestBehavior.opaque,
//         onTap: () => widget.controller.value.isPlaying
//             ? widget.controller.pause()
//             : widget.controller.play(),
//         child: Stack(
//           children: <Widget>[
//             buildPlay(),
//             Positioned(
//               bottom: 0,
//               left: 0,
//               right: 0,
//               child: buildIndicator(),
//             ),
//           ],
//         ),
//       );

//   Widget buildIndicator() => VideoProgressIndicator(
//         widget.controller,
//         allowScrubbing: true,
//         colors: VideoProgressColors(
//           backgroundColor: Color.fromARGB(255, 115, 11, 3),
//           playedColor: Color.fromARGB(255, 225, 26, 12),
//         ),
//       );

//   Widget buildPlay() => widget.controller.value.isPlaying
//       ? Container()
//       : Container(
//           alignment: Alignment.center,
//           color: Colors.black26,
//           child: Icon(
//             Icons.play_arrow,
//             color: Colors.white,
//             size: 80,
//           ),
//         );
// }

// class FullScreenVid extends StatefulWidget {
//   final String videoUrl;

//   const FullScreenVid({Key? key, required this.videoUrl}) : super(key: key);

//   @override
//   State<FullScreenVid> createState() => _FullScreenVidState();
// }

// class _FullScreenVidState extends State<FullScreenVid> {
//   late FlickManager flickManager;

//   @override
//   void initState() {
//     super.initState();
//     flickManager = FlickManager(
//       videoPlayerController: VideoPlayerController.network(widget.videoUrl),
//     );
//   }

//   @override
//   void dispose() {
//     flickManager.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: FlickVideoPlayer(
//         flickManager: flickManager,
//         preferredDeviceOrientation: [
//           DeviceOrientation.landscapeRight,
//           DeviceOrientation.landscapeLeft,
//         ],
//         systemUIOverlay: [],
//         flickVideoWithControls: FlickVideoWithControls(
//           controls: LandscapePlayerControls(),
//         ),
//       ),
//     );
//   }
// }

// class LandscapePlayerControls extends StatelessWidget {
//   const LandscapePlayerControls({
//     Key? key,
//     this.iconSize = 20,
//     this.fontSize = 12,
//   }) : super(key: key);

//   final double iconSize;
//   final double fontSize;

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: <Widget>[
//         FlickShowControlsAction(
//           child: FlickSeekVideoAction(
//             child: Center(
//               child: FlickVideoBuffer(
//                 child: FlickAutoHideChild(
//                   showIfVideoNotInitialized: false,
//                   child: LandscapePlayToggle(),
//                 ),
//               ),
//             ),
//           ),
//         ),
//         Positioned.fill(
//           child: FlickAutoHideChild(
//             child: Column(
//               children: <Widget>[
//                 Expanded(
//                   child: Container(),
//                 ),
//                 Container(
//                   padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//                   color: Color.fromRGBO(0, 0, 0, 0.4),
//                   child: Row(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: <Widget>[
//                       FlickPlayToggle(
//                         size: 20,
//                       ),
//                       SizedBox(
//                         width: 10,
//                       ),
//                       FlickCurrentPosition(
//                         fontSize: fontSize,
//                       ),
//                       SizedBox(
//                         width: 10,
//                       ),
//                       Expanded(
//                         child: Container(
//                           child: FlickVideoProgressBar(
//                             flickProgressBarSettings: FlickProgressBarSettings(
//                               height: 10,
//                               handleRadius: 10,
//                               padding: EdgeInsets.symmetric(
//                                 horizontal: 8.0,
//                                 vertical: 8,
//                               ),
//                               backgroundColor: Colors.white24,
//                               bufferedColor: Colors.white38,
//                               getPlayedPaint: ({
//                                 double? handleRadius,
//                                 double? height,
//                                 double? playedPart,
//                                 double? width,
//                               }) {
//                                 return Paint()
//                                   ..shader = LinearGradient(
//                                     colors: [
//                                       Color.fromRGBO(108, 165, 242, 1),
//                                       Color.fromRGBO(97, 104, 236, 1),
//                                     ],
//                                     stops: [
//                                       0.0,
//                                       0.5,
//                                     ],
//                                   ).createShader(
//                                     Rect.fromPoints(
//                                       Offset(0, 0),
//                                       Offset(width!, 0),
//                                     ),
//                                   );
//                               },
//                               getHandlePaint: ({
//                                 double? handleRadius,
//                                 double? height,
//                                 double? playedPart,
//                                 double? width,
//                               }) {
//                                 return Paint()
//                                   ..shader = RadialGradient(
//                                     colors: [
//                                       Color.fromRGBO(97, 104, 236, 1),
//                                       Color.fromRGBO(97, 104, 236, 1),
//                                       Colors.white,
//                                     ],
//                                     stops: [0.0, 0.4, 0.5],
//                                     radius: 0.4,
//                                   ).createShader(
//                                     Rect.fromCircle(
//                                       center: Offset(playedPart!, height! / 2),
//                                       radius: handleRadius!,
//                                     ),
//                                   );
//                               },
//                             ),
//                           ),
//                         ),
//                       ),
//                       FlickTotalDuration(
//                         fontSize: fontSize,
//                       ),
//                       SizedBox(
//                         width: 10,
//                       ),
//                       FlickSoundToggle(
//                         size: 20,
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         Positioned(
//           right: 20,
//           top: 10,
//           child: GestureDetector(
//             onTap: () {
//               SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
//                   overlays: SystemUiOverlay.values);
//               SystemChrome.setPreferredOrientations(
//                   [DeviceOrientation.portraitUp]);
//               Navigator.pop(context);
//             },
//             child: Icon(
//               Icons.cancel,
//               size: 30,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// class LandscapePlayToggle extends StatelessWidget {
//   const LandscapePlayToggle({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     FlickControlManager controlManager =
//         Provider.of<FlickControlManager>(context);
//     FlickVideoManager videoManager = Provider.of<FlickVideoManager>(context);

//     double size = 50;
//     Color color = Colors.white;

//     Widget playWidget = Icon(
//       Icons.play_arrow,
//       size: size,
//       color: color,
//     );
//     Widget pauseWidget = Icon(
//       Icons.pause,
//       size: size,
//       color: color,
//     );
//     Widget replayWidget = Icon(
//       Icons.replay,
//       size: size,
//       color: color,
//     );

//     Widget child = videoManager.isVideoEnded
//         ? replayWidget
//         : videoManager.isPlaying
//             ? pauseWidget
//             : playWidget;

//     return Material(
//       color: Colors.transparent,
//       child: InkWell(
//         borderRadius: BorderRadius.circular(50),
//         splashColor: Color.fromRGBO(108, 165, 242, 0.5),
//         key: key,
//         onTap: () {
//           videoManager.isVideoEnded
//               ? controlManager.replay()
//               : controlManager.togglePlay();
//         },
//         child: Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(50),
//           ),
//           padding: EdgeInsets.all(10),
//           child: child,
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';

class VideoController extends StatefulWidget {
  final String? videoUrl;

  const VideoController({Key? key, this.videoUrl}) : super(key: key);

  @override
  State<VideoController> createState() => _VideoControllerState();
}

class _VideoControllerState extends State<VideoController> {
  late VideoPlayerController? controller;

  @override
  void initState() {
    super.initState();
    if (widget.videoUrl != null && widget.videoUrl!.isNotEmpty) {
      initializeVideoPlayer();
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  void initializeVideoPlayer() {
    controller = VideoPlayerController.network(widget.videoUrl!);
    controller!
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..initialize().then((_) => controller!.play());
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    if (widget.videoUrl == null || widget.videoUrl!.isEmpty) {
      return Center(
        child: Text(
          'Video not found',
          style: GoogleFonts.ptSans(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    }

    if (controller == null || !controller!.value.isInitialized) {
      return Container(
        height: size.height * 0.4,
        child: Center(child: CircularProgressIndicator()),
      );
    }

    final isMuted = controller!.value.volume == 0;
    return Stack(
      children: [
        VideoPlayerWidget(controller: controller!),
        Positioned(
          top: size.height * 0.185,
          left: size.width * 0.85,
          child: IconButton(
            icon: Icon(
              isMuted ? Icons.volume_off : Icons.volume_up,
              color: Colors.white,
              size: 20,
            ),
            onPressed: () => controller!.setVolume(isMuted ? 1 : 0),
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
              child: Text(
                'Preview',
                style: GoogleFonts.ptSans(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class VideoPlayerWidget extends StatefulWidget {
  final VideoPlayerController controller;

  const VideoPlayerWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return widget.controller != null && widget.controller.value.isInitialized
        ? Container(
            alignment: Alignment.topCenter,
            child: buildVideo(),
          )
        : Container(
            height: size.height * 0.4,
            child: Center(child: CircularProgressIndicator()),
          );
  }

  Widget buildVideo() => Stack(
        children: <Widget>[
          buildVideoPlayer(),
          Positioned.fill(
              child: BasicOverlayWidget(controller: widget.controller)),
        ],
      );

  Widget buildVideoPlayer() => AspectRatio(
        aspectRatio: widget.controller.value.aspectRatio,
        child: VideoPlayer(widget.controller),
      );
}

class BasicOverlayWidget extends StatefulWidget {
  final VideoPlayerController controller;

  const BasicOverlayWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<BasicOverlayWidget> createState() => _BasicOverlayWidgetState();
}

class _BasicOverlayWidgetState extends State<BasicOverlayWidget> {
  @override
  Widget build(BuildContext context) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => widget.controller.value.isPlaying
            ? widget.controller.pause()
            : widget.controller.play(),
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
        widget.controller,
        allowScrubbing: true,
        colors: VideoProgressColors(
          backgroundColor: Color.fromARGB(255, 115, 11, 3),
          playedColor: Color.fromARGB(255, 225, 26, 12),
        ),
      );

  Widget buildPlay() => widget.controller.value.isPlaying
      ? Container()
      : Container(
          alignment: Alignment.center,
          color: Colors.black26,
          child: Icon(
            Icons.play_arrow,
            color: Colors.white,
            size: 80,
          ),
        );
}
