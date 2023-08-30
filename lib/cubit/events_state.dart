import 'package:equatable/equatable.dart';
import 'package:events_app/models/event.dart';

abstract class EventsState extends Equatable {
  const EventsState();
  @override
  List<Object> get props => [];
}

class EventsInitial extends EventsState {}

class EventsInitialLoading extends EventsState {}

class EventsInitialLoaded extends EventsState {
  final List<EventModel> postList;
  const EventsInitialLoaded({required this.postList});

  @override
  List<Object> get props => [postList];
}

class EventsError extends EventsState {}
