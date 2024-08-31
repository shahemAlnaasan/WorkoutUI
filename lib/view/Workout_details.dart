import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:video_player/video_player.dart';
import 'package:workout_ui/bloc/sets_bloc.dart';
import 'package:workout_ui/controller/Exercises/exercises_details_controller.dart';
import 'package:workout_ui/controller/video_controller.dart';
import 'package:workout_ui/cubit/sets_cubit.dart';
import 'package:workout_ui/view/components/card_section_title.dart';
import 'package:workout_ui/view/components/check_box.dart';
import 'package:workout_ui/view/components/chest_workout_details.dart';
import 'package:workout_ui/view/components/custom_button.dart';
import 'package:workout_ui/view/components/text_form.dart';
import 'package:workout_ui/view/components/video_player.dart';

class WorkoutDetails extends StatefulWidget {
  const WorkoutDetails({super.key});

  @override
  State<WorkoutDetails> createState() => _WorkoutDetailsState();
}

VideoController videoController = Get.find();
DetailsController detailsController = Get.find();

class _WorkoutDetailsState extends State<WorkoutDetails> {
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
    // videoController.videoPlayerController.play();
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
                child: ListView(
                  children: [
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Exercises",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        Text(
                            "${detailsController.exercisesDone}/${detailsController.isChecked.length}",
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
                                CustomcheckBox(
                                  value: detailsController.exersiseCheck[i],
                                  onChanged: (val) {
                                    if (val == false) {
                                      setState(
                                        () {
                                          detailsController.isChecked[i]
                                              .fillRange(
                                                  0,
                                                  detailsController
                                                      .isChecked[i].length,
                                                  false);
                                          detailsController.exersiseCheck[i] =
                                              val!;
                                          detailsController.exercisesDone--;
                                        },
                                      );
                                    } else {
                                      setState(
                                        () {
                                          detailsController.isChecked[i]
                                              .fillRange(
                                                  0,
                                                  detailsController
                                                      .isChecked[i].length,
                                                  true);
                                          detailsController.exersiseCheck[i] =
                                              val!;
                                          detailsController.exercisesDone++;
                                        },
                                      );
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
                              child: Column(
                                children: [
                                  // Section Title
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: 5.screenWidth),
                                    child: const SectionTitle(),
                                  ),

                                  // sets
                                  ListView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount:
                                        detailsController.isChecked[i].length,
                                    itemBuilder: (context, cardIndex) {
                                      return Padding(
                                        padding: EdgeInsets.only(
                                            left: 5.screenWidth),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                                "${detailsController.setsCount[cardIndex]}",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 4.screenWidth)),
                                            const CustomtextForm(),
                                            const CustomtextForm(),
                                            CustomcheckBox(
                                              value: detailsController
                                                  .isChecked[i][cardIndex],
                                              onChanged: (val) {
                                                setState(
                                                  () {
                                                    detailsController
                                                            .isChecked[i]
                                                        [cardIndex] = val!;
                                                    detailsController
                                                        .checkAll(i);
                                                    setState(() {});
                                                  },
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 3.screenWidth),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        detailsController.isChecked[i].length >
                                                detailsController.exercises[i]
                                                    .setsPerExercise
                                            ? InkWell(
                                                onTap: () {
                                                  //with BloC
                                                  context.read<SetsBloc>().add(
                                                      RemoveSetsEvent(
                                                          cardIndex: i));

                                                  //With Cubit
                                                  // context
                                                  //     .read<SetsCubit>()
                                                  //     .removeCheckbox(i);
                                                },
                                                child: const Icon(
                                                  Icons.remove,
                                                  color:
                                                      Colors.deepOrangeAccent,
                                                ),
                                              )
                                            : const SizedBox(
                                                width: 0,
                                                height: 0,
                                              ),
                                        detailsController.isChecked[i].length !=
                                                6
                                            ? InkWell(
                                                onTap: () {
                                                  //with BloC
                                                  context.read<SetsBloc>().add(
                                                      AddSetsEvent(
                                                          cardIndex: i));
                                                  //With Cubit
                                                  // context
                                                  //     .read<SetsCubit>()
                                                  //     .addCheckbox(i);
                                                  // setState(() {});
                                                },
                                                child: const Icon(
                                                  Icons.add,
                                                  color:
                                                      Colors.deepOrangeAccent,
                                                ),
                                              )
                                            : const SizedBox(
                                                width: 0,
                                                height: 0,
                                              ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            const CustomButton(
              title: 'Next workout',
            ),
          ],
        ),
      ),
    );
  }
}
