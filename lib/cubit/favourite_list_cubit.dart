import 'package:events_app/cubit/favourite_list_state.dart';
import 'package:events_app/models/event.dart';
import 'package:events_app/repository/events_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteListCubit extends Cubit<FavouriteListState> {
  FavouriteListCubit(this.eventRepository) : super(FavouriteListInitial());

  final EventRepository eventRepository;

  Future<void> getFavouriteList() async {
    emit(FavouriteListLoading());
    try {
      final List<EventModel> favouriteList =
          await eventRepository.getFavouriteList();
      emit(FavouriteListLoaded(favouriteList: favouriteList));
    }
    // on Failure catch (err) {
    //   emit(PostFetchError(failure: err));
    // }
    catch (err) {
      print("Error :$err");
    }
  }
}
