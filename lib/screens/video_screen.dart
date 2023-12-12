import 'dart:async';

import 'package:flutter/material.dart';
import 'package:project_app/widgetGroup/player_video.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    return _VideoScreenState();
  }
}

class _VideoScreenState extends State<VideoScreen> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  late Timer _timer;
  _startTimer(){
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if(_controller.value.isPlaying){
          setState(() {
          });
        }
    });
  }
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(
      Uri.parse(
        'https://res.cloudinary.com/dwu92ycra/video/upload/v1702295593/Gym-app/5_Shoulder_Excercises_For_Growth_r6io1c.mp4',
      ),
    );
    _initializeVideoPlayerFuture = _controller.initialize();
    _startTimer();
  }
  @override
  void dispose() {
    _controller.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double maxHeight = MediaQuery.of(context).size.height;
    double maxWidth = MediaQuery.of(context).size.width;
    return Scaffold(

      body: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Stack(
                children: [
              Center(
                child: AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller)),
              ),
                  Positioned(
                    bottom: 20,
                    child:
                    PlayerVideo(
                      duration: _controller.value.duration,
                      currentPosition: (_controller.value.position + const Duration(seconds: 1)),
                      isPlay: _controller.value.isPlaying ? true :false ,
                      fn:(){
                        setState(() {
                          _controller.value.isPlaying ? _controller.pause() : _controller.play();
                        });
                      } ,
                    ),
                  )
            ]);

          } else {
            // If the VideoPlayerController is still initializing, show a
            // loading spinner.
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
