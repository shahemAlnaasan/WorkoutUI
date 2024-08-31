import 'package:get/get.dart';
import 'package:workout_ui/controller/Exercises/exercises_controller.dart';
import 'package:workout_ui/view/workout_details.dart';

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

  int exercisesDone = 0;
  final List<int> setsCount = List.generate(6, (index) => index + 1);

  //List of the sets count in each card
  List<List<bool>> isChecked = [
    List<bool>.filled(3, false, growable: true),
    List<bool>.filled(4, false, growable: true),
    List<bool>.filled(3, false, growable: true),
  ];

  // Exercise Chekbox value
  List<bool> exersiseCheck = [false, false, false];

  //change the Exercise Chekbox value to true if all the checkBox in the card were true
  void checkAll(int cardIndex) {
    bool allTrue =
        detailsController.isChecked[cardIndex].every((element) => element);

    if (allTrue && !detailsController.exersiseCheck[cardIndex]) {
      detailsController.exercisesDone++;
    } else if (!allTrue && detailsController.exersiseCheck[cardIndex]) {
      detailsController.exercisesDone--;
    }
    detailsController.exersiseCheck[cardIndex] =
        detailsController.isChecked[cardIndex].every((element) => element);
  }
}
