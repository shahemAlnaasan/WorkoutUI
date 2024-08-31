part of 'sets_bloc.dart';

sealed class SetsEvent extends Equatable {
  const SetsEvent();

  @override
  List<Object> get props => [];
}

class AddSetsEvent extends SetsEvent {
  final int cardIndex;

  @override
  List<Object> get props => [cardIndex];

  const AddSetsEvent({required this.cardIndex});
}

class RemoveSetsEvent extends SetsEvent {
  final int cardIndex;

  @override
  List<Object> get props => [cardIndex];

  const RemoveSetsEvent({required this.cardIndex});
}
