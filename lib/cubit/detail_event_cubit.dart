import 'package:events_app/cubit/detail_event_state.dart';
import 'package:events_app/models/event.dart';
import 'package:events_app/repository/events_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EventDetailCubit extends Cubit<EventDetailState> {
  EventDetailCubit(this.eventRepository) : super(EventDetailStateInitial());

  final EventRepository eventRepository;

  Future<void> getEvent(String id) async {
    emit(EventDetailStateLoading());
    try {
      final EventModel? eventData = await eventRepository.getEvent(id);
      emit(EventDetailStateLoaded(eventData: eventData!));
    }
    // on Failure catch (err) {
    //   emit(PostFetchError(failure: err));
    // }
    catch (err) {
      print("Error :$err");
    }
  }
}
