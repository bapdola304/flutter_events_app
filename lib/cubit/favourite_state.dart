import 'package:equatable/equatable.dart';
import 'package:events_app/models/event.dart';

abstract class FavouriteState extends Equatable {
  const FavouriteState();
  @override
  List<Object> get props => [];
}

class FavouriteInitial extends FavouriteState {}

class FavouriteLoading extends FavouriteState {}

class FavouriteLoaded extends FavouriteState {
  final EventModel favouriteData;
  const FavouriteLoaded({required this.favouriteData});

  @override
  List<Object> get props => [favouriteData];
}
