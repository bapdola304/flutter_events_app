import 'package:events_app/cubit/events_state.dart';
import 'package:events_app/models/event.dart';
import 'package:events_app/repository/events_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EventsCubit extends Cubit<EventsState> {
  EventsCubit(this.eventRepository) : super(EventsInitial());

  final EventRepository eventRepository;

  Future<void> fetchPostApi() async {
    emit(EventsInitialLoading());
    try {
      final List<EventModel>? postList = await eventRepository.getPostList();
      emit(EventsInitialLoaded(postList: postList!));
    }
    // on Failure catch (err) {
    //   emit(PostFetchError(failure: err));
    // }
    catch (err) {
      print("Error :$err");
    }
  }
}
