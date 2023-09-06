import 'package:equatable/equatable.dart';
import 'package:events_app/models/event.dart';

abstract class EventDetailState extends Equatable {
  const EventDetailState();
  @override
  List<Object> get props => [];
}

class EventDetailStateInitial extends EventDetailState {}

class EventDetailStateLoading extends EventDetailState {}

class EventDetailStateLoaded extends EventDetailState {
  final EventModel eventData;

  const EventDetailStateLoaded({required this.eventData});

  @override
  List<Object> get props => [eventData];
}
