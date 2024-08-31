import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:workout_ui/view/workout_details.dart';

part 'sets_event.dart';
part 'sets_state.dart';

class SetsBloc extends Bloc<SetsEvent, SetsState> {
  SetsBloc() : super(SetsInitial()) {
    on<SetsEvent>((event, emit) {
      if (event is AddSetsEvent) {
        detailsController.isChecked[event.cardIndex].add(false);
        detailsController.checkAll(event.cardIndex);
      } else if (event is RemoveSetsEvent) {
        detailsController.isChecked[event.cardIndex].removeLast();
        detailsController.checkAll(event.cardIndex);
      }
    });
  }
}
