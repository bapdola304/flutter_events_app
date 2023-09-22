import 'package:events_app/cubit/favourite_state.dart';
import 'package:events_app/models/event.dart';
import 'package:events_app/models/favourite.dart';
import 'package:events_app/repository/events_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteCubit extends Cubit<FavouriteState> {
  FavouriteCubit(this.eventRepository) : super(FavouriteInitial());

  final EventRepository eventRepository;

  Future<void> addFavourite(String id, FavouriteRequest data) async {
    emit(FavouriteLoading());
    try {
      final EventModel favouriteData =
          await eventRepository.addFavourite(id, data);
      emit(FavouriteLoaded(favouriteData: favouriteData));
    }
    // on Failure catch (err) {
    //   emit(PostFetchError(failure: err));
    // }
    catch (err) {
      print("Error :$err");
    }
  }
}
