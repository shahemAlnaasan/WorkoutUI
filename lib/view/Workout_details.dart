import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:video_player/video_player.dart';
import 'package:workout_ui/controller/Exercises/Exercises_Details_controller.dart';
import 'package:workout_ui/controller/Video_Controller.dart';
import 'package:workout_ui/view/Card_SectionTitle.dart';
import 'package:workout_ui/view/Check_Box.dart';
import 'package:workout_ui/view/ChestWorkout_Details.dart';
import 'package:workout_ui/view/Custom_Button.dart';
import 'package:workout_ui/view/Text_Form.dart';
import 'package:workout_ui/view/Video_Player.dart';

class WorkoutDetails extends StatefulWidget {
  const WorkoutDetails({super.key});

  @override
  State<WorkoutDetails> createState() => _WorkoutDetailsState();
}

VideoController videoController = Get.find();
DetailsController detailsController = Get.find();

class _WorkoutDetailsState extends State<WorkoutDetails> {
  int exercisesDone = 0;
  final List<int> setsCount = List.generate(10, (index) => index + 1);

  //List of the sets count in each card
  List<List<bool>> isChecked = [
    List<bool>.filled(3, false),
    List<bool>.filled(4, false),
    List<bool>.filled(3, false),
  ];

  // Exercise Chekbox value
  List<bool> exersiseCheck = [false, false, false];

  //change the Exercise Chekbox value to true if all the checkBox in the card were true
  void checkAll(int cardIndex) {
    setState(() {
      bool allTrue = isChecked[cardIndex].every((element) => element);

      if (allTrue && !exersiseCheck[cardIndex]) {
        exercisesDone++;
      } else if (!allTrue && exersiseCheck[cardIndex]) {
        exercisesDone--;
      }
      exersiseCheck[cardIndex] =
          isChecked[cardIndex].every((element) => element);
    });
  }

  @override
  void initState() {
    videoController.videoPlayerController = VideoPlayerController.asset(
        "video/The_Perfect_Push_Up_-_Do_it_right!_001_001.mp4");
    videoController.initializeVideoPlayerFuture =
        videoController.videoPlayerController.initialize().then(
      (value) {
        setState(() {});
      },
    );
    videoController.videoPlayerController.play();
    Duration position = videoController.videoPlayerController.value.position;

    //Update Video Position every second
    videoController.timer =
        Timer.periodic(const Duration(microseconds: 10), (Timer t) {
      setState(
        () {
          position;
        },
      );
    });

    super.initState();
  }

  @override
  void dispose() {
    videoController.videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        reverse: true,
        child: Column(
          children: [
            Container(
              width: 100.screenWidth,
              height: 90.screenHeight,
              color: const Color(0xff151515),
              child: Padding(
                padding: EdgeInsets.only(
                    left: 6.screenWidth,
                    right: 6.screenWidth,
                    top: 6.screenHeight),
                child: ListView(children: [
                  //
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      //Main Video
                      const Videoplayer(),

                      //Video Progress indecator
                      Positioned(
                        height: 0.9.screenHeight,
                        width: 80.screenWidth,
                        bottom: 1.5.screenHeight,
                        child: const VideoIndicator(),
                      ),

                      //
                      Positioned(
                        left: 3.screenWidth,
                        bottom: 2.screenHeight,
                        child: Row(
                          children: [
                            // Video Play button
                            const VideoPlayButton(),

                            // video Time Position
                            Row(
                              children: [
                                Text(
                                  videoController.videoPlayerController.value
                                              .position.inMinutes <
                                          10
                                      ? "0${videoController.videoPlayerController.value.position.inMinutes}"
                                      : "${videoController.videoPlayerController.value.position.inMinutes}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 2.5.screenWidth),
                                ),
                                Text(":",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 2.5.screenWidth)),
                                Text(
                                  videoController.videoPlayerController.value
                                              .position.inSeconds <
                                          10
                                      ? "0${videoController.videoPlayerController.value.position.inSeconds}"
                                      : "${videoController.videoPlayerController.value.position.inSeconds}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 2.5.screenWidth),
                                ),
                              ],
                            ),

                            Text(" / ",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 2.5.screenWidth)),

                            //Total Video Time
                            Row(
                              children: [
                                Text(
                                  videoController.videoPlayerController.value
                                              .duration.inMinutes <
                                          10
                                      ? "0${videoController.videoPlayerController.value.duration.inMinutes}"
                                      : "${videoController.videoPlayerController.value.duration.inMinutes}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 2.5.screenWidth),
                                ),
                                Text(":",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 2.5.screenWidth)),
                                Text(
                                  videoController.videoPlayerController.value
                                              .duration.inSeconds <
                                          10
                                      ? "0${videoController.videoPlayerController.value.duration.inSeconds}"
                                      : "${videoController.videoPlayerController.value.duration.inSeconds}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 2.5.screenWidth),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        left: 3.screenWidth,
                        top: 1.screenHeight,
                        child: Row(
                          children: [
                            Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                              size: 5.screenWidth,
                            ),
                            SizedBox(width: 2.screenWidth),
                            Text(
                              "Standard Push-Ups",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 4.screenWidth,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        right: 5.screenWidth,
                        bottom: 2.screenHeight,
                        child: Icon(
                          Icons.fullscreen_exit_outlined,
                          color: Colors.white,
                          size: 4.5.screenWidth,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 3.screenHeight),

                  //
                  const ChestWorkoutDetails(),

                  //
                  Row(
                    children: [
                      Text(
                        "Exercises",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      SizedBox(width: 50.screenWidth),
                      Text("$exercisesDone/12",
                          style: TextStyle(
                              color: Colors.deepOrangeAccent,
                              fontSize: 5.screenWidth)),
                    ],
                  ),

                  //

                  ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: detailsController.exercises.length,
                      itemBuilder: (context, i) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 1.screenHeight),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    detailsController.exercises[i].exerciseName,
                                    style:
                                        Theme.of(context).textTheme.bodyMedium),
                                SizedBox(width: 36.screenWidth),
                                checkBox(
                                  value: exersiseCheck[i],
                                  onChanged: (val) {
                                    if (val == false) {
                                      setState(() {
                                        isChecked[i].fillRange(
                                            0, isChecked[i].length, false);
                                        exersiseCheck[i] = val!;
                                        exercisesDone--;
                                      });
                                    } else {
                                      setState(() {
                                        isChecked[i].fillRange(
                                            0, isChecked[i].length, true);
                                        exersiseCheck[i] = val!;
                                        exercisesDone++;
                                      });
                                    }
                                  },
                                )
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Pro Tip:",
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                                Text(
                                  detailsController.exercises[i].proTip,
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                                SizedBox(height: 1.screenHeight),
                              ],
                            ),
                            Card(
                              color: const Color(0xff202022),
                              child: Column(children: [
                                // Section Title
                                Padding(
                                  padding: EdgeInsets.only(left: 5.screenWidth),
                                  child: const SectionTitle(),
                                ),

                                // sets
                                ListView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: isChecked[i].length,
                                    itemBuilder: (context, checkBoxIndex) {
                                      return Padding(
                                        padding: EdgeInsets.only(
                                            left: 5.screenWidth),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("${setsCount[checkBoxIndex]}",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 4.screenWidth)),
                                            const textForm(),
                                            const textForm(),
                                            checkBox(
                                              value: isChecked[i]
                                                  [checkBoxIndex],
                                              onChanged: (val) {
                                                setState(() {
                                                  isChecked[i][checkBoxIndex] =
                                                      val!;
                                                  checkAll(i);
                                                });
                                              },
                                            )
                                          ],
                                        ),
                                      );
                                    })
                              ]),
                            ),
                          ],
                        );
                      }),
                ]),
              ),
            ),
            CustomButton(
              title: 'Next workout',
            ),
          ],
        ),
      ),
    );
  }
}
