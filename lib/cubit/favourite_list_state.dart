import 'package:equatable/equatable.dart';
import 'package:events_app/models/event.dart';

abstract class FavouriteListState extends Equatable {
  const FavouriteListState();
  @override
  List<Object> get props => [];
}

class FavouriteListInitial extends FavouriteListState {}

class FavouriteListLoading extends FavouriteListState {}

class FavouriteListLoaded extends FavouriteListState {
  final List<EventModel> favouriteList;
  const FavouriteListLoaded({required this.favouriteList});

  @override
  List<Object> get props => [favouriteList];
}
