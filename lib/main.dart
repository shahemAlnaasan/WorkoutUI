import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:workout_ui/bloc/sets_bloc.dart';
import 'package:workout_ui/controller/Exercises/exercises_details_controller.dart';
import 'package:workout_ui/view/workout_details.dart';
import 'controller/video_controller.dart';

void main() {
  VideoController videoController = Get.put(VideoController());
  DetailsController detailsController = Get.put(DetailsController());
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SetsBloc()),
      ],
      child: ResponsiveApp(
        builder: (context) => GetMaterialApp(
          theme: ThemeData(
            textTheme: TextTheme(
              bodySmall: const TextStyle(
                color: Color(0xff565455),
                fontWeight: FontWeight.w600,
              ),
              bodyMedium: TextStyle(
                fontSize: 4.5.screenWidth,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              bodyLarge: TextStyle(
                fontSize: 5.5.screenWidth,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          debugShowCheckedModeBanner: false,
          home: const WorkoutDetails(),
        ),
      ),
    );
  }
}
