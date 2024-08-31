import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:workout_ui/view/workout_details.dart';

part 'sets_state.dart';

class SetsCubit extends Cubit<SetsState> {
  SetsCubit() : super(SetsInitial());

  void addCheckbox(int cardIndex) {
    detailsController.isChecked[cardIndex].add(false);
    detailsController.checkAll(cardIndex);
  }

  void removeCheckbox(int cardIndex) {
    detailsController.isChecked[cardIndex].removeLast();
    detailsController.checkAll(cardIndex);
  }
}
