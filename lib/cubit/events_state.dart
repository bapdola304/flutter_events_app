import 'package:equatable/equatable.dart';

abstract class EventsState extends Equatable {
  const EventsState();
  @override
  List<Object> get props => [];
}

class EventsInitial extends EventsState {}

class EventsInitialLoading extends EventsState {}

class EventsInitialLoaded extends EventsState {
  final postList;

  const EventsInitialLoaded({this.postList});

  @override
  List<Object> get props => [postList];
}

class EventsError extends EventsState {}
