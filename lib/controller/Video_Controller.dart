import 'dart:async';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class VideoController extends GetxController {
  late VideoPlayerController videoPlayerController;
  late Future<void> initializeVideoPlayerFuture;
  late Timer timer;
  late bool isPlaying = true;
}
