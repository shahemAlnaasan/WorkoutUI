import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:video_player/video_player.dart';
import 'package:workout_ui/controller/video_controller.dart';

VideoController videoController = Get.find();

class Videoplayer extends StatelessWidget {
  const Videoplayer({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(microseconds: 1),
      opacity: 0.8,
      child: SizedBox(
          width: 100.screenWidth,
          height: 25.screenHeight,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: VideoPlayer(videoController.videoPlayerController))),
    );
  }
}

class VideoIndicator extends StatefulWidget {
  const VideoIndicator({super.key});

  @override
  State<VideoIndicator> createState() => _VideoIndacatorState();
}

class _VideoIndacatorState extends State<VideoIndicator> {
  @override
  Widget build(BuildContext context) {
    return VideoProgressIndicator(videoController.videoPlayerController,
        allowScrubbing: true,
        colors: const VideoProgressColors(
            backgroundColor: Colors.white,
            playedColor: Colors.deepOrangeAccent));
  }
}

class VideoPlayButton extends StatefulWidget {
  const VideoPlayButton({super.key});

  @override
  State<VideoPlayButton> createState() => _VideoPlayButtonState();
}

class _VideoPlayButtonState extends State<VideoPlayButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          if (videoController.videoPlayerController.value.isPlaying) {
            videoController.videoPlayerController.pause();
            videoController.isPlaying = true;
          } else {
            videoController.videoPlayerController.play();
            videoController.isPlaying = false;
          }
        });
      },
      child: Icon(
        videoController.isPlaying ? Icons.play_arrow : Icons.pause,
        color: Colors.white,
        size: 5.screenWidth,
      ),
    );
  }
}
