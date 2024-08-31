part of 'sets_bloc.dart';

sealed class SetsState extends Equatable {
  const SetsState();
  
  @override
  List<Object> get props => [];
}

final class SetsInitial extends SetsState {}
