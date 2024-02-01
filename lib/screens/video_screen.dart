import 'dart:async';

import 'package:flutter/material.dart';
import 'package:project_app/block/models/lesson.dart';
import 'package:project_app/widgetGroup/player_video.dart';
import 'package:project_app/widgetGroup/recommend_widget.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends StatefulWidget {
  final List<LessonModel> lessons;
  final LessonModel lesson;
  const VideoScreen({super.key, required this.lesson, required this.lessons});
  @override
  State<StatefulWidget> createState() {
    return _VideoScreenState();
  }
}

class _VideoScreenState extends State<VideoScreen> {
  late VideoPlayerController _controller;
  int indexVideo = 0;
  bool isShowRecommend = false;
  bool isShowPlayer = true;
  late Future<void> _initializeVideoPlayerFuture;
  late Timer _timer;
  void handlePosition(double value) {
    setState(() {
      _controller.seekTo(Duration(seconds: value.round()));
    });
  }

  void handleVolume() {
    setState(() {
      if (_controller.value.volume == 0) {
        _controller.setVolume(1.0);
      } else {
        _controller.setVolume(0.0);
      }
    });
  }

  void handleRepeat() {
    setState(() {
      _controller.value.isLooping
          ? _controller.setLooping(false)
          : _controller.setLooping(true);
    });
  }

  void handlePlay() {
    setState(() {
      if (_controller.value.isPlaying) {
        isShowRecommend = true;
        _controller.pause();
      } else {
        isShowRecommend = false;
        _controller.play();
      }
    });
  }

  void handleSwitch(String type) {
    setState(() {
      if (type == 'prev' && indexVideo > 0) {
        indexVideo -= 1;
        _controller = VideoPlayerController.networkUrl(
            Uri.parse(widget.lessons[indexVideo].video!));
        _initializeVideoPlayerFuture = _controller.initialize();
      }
      if (type == 'next' && indexVideo < widget.lessons.length - 1) {
        indexVideo += 1;
        _controller = VideoPlayerController.networkUrl(
            Uri.parse(widget.lessons[indexVideo].video!));
        _initializeVideoPlayerFuture = _controller.initialize();
      }
    });
  }

  void handleShowPlayer() {
    setState(() {
      isShowPlayer ? isShowPlayer = false : isShowPlayer = true;
    });
  }

  _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 0), (timer) {
      if (_controller.value.isPlaying) {
        setState(() {});
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(
      Uri.parse(widget.lessons[indexVideo].video!),
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
    TextStyle recommendStyle = Theme.of(context)
        .textTheme
        .headline3!
        .copyWith(color: Theme.of(context).colorScheme.onSecondary);
    return Scaffold(
      body: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Stack(fit: StackFit.expand, children: [
              Center(
                child: AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller)),
              ),
              if (isShowRecommend)
                InkWell(
                  onTap: () {
                    setState(() {
                      isShowRecommend = false;
                    });
                  },
                  child: Container(
                    height: maxWidth,
                    width: maxWidth,
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
              if (isShowRecommend)
                Positioned(
                  bottom: 150,
                  left: 50,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Recommended', style: recommendStyle),
                      Container(
                        margin: const EdgeInsets.only(top: 5),
                        width: maxWidth,
                        child: const Recommend(),
                      ),
                    ],
                  ),
                ),
              Positioned(
                bottom: 20,
                child: PlayerVideo(
                  isVolume: _controller.value.volume == 1,
                  isLoop: _controller.value.isLooping,
                  onPosition: (double value) {
                    handlePosition(value);
                  },
                  onVolume: () {
                    handleVolume();
                  },
                  onSwitch: (String type) {
                    handleSwitch(type);
                  },
                  onLoop: () {
                    handleRepeat();
                  },
                  description: widget.lesson.typeLesson!,
                  duration: _controller.value.duration,
                  currentPosition:
                      (_controller.value.position + const Duration(seconds: 0)),
                  isPlay: _controller.value.isPlaying ? true : false,
                  onPlay: () {
                    handlePlay();
                  },
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
