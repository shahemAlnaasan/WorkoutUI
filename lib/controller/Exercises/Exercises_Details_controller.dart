import 'package:get/get.dart';
import 'package:workout_ui/controller/Exercises/Exercises_Controller.dart';

class DetailsController extends GetxController {
  List<ExcercisesContoller> exercises = [
    ExcercisesContoller(
      exerciseName: "Standard Push-Ups",
      proTip:
          "Focus on sitting \"back\" and down, Keep your knees \"pushed\" outwards",
      setsPerExercise: 3,
    ),
    ExcercisesContoller(
      exerciseName: "Chest Dips",
      proTip: "Keep your knees \"pushed\" outwards",
      setsPerExercise: 4,
    ),
    ExcercisesContoller(
      exerciseName: "Machine fly",
      proTip: "Keep your knees \"pushed\" outwards",
      setsPerExercise: 3,
    )
  ];
}
