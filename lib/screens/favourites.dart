import 'package:events_app/compoments/event_item.dart';
import 'package:events_app/compoments/loading_circle.dart';
import 'package:events_app/constants.dart';
import 'package:events_app/cubit/events_cubit.dart';
import 'package:events_app/cubit/favourite_cubit.dart';
import 'package:events_app/cubit/favourite_list_cubit.dart';
import 'package:events_app/cubit/favourite_list_state.dart';
import 'package:events_app/models/event.dart';
import 'package:events_app/models/favourite.dart';
import 'package:events_app/screens/detai_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Favourites extends StatefulWidget {
  const Favourites({super.key});

  @override
  State<Favourites> createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {
  List<EventModel> eventList = [
    EventModel(
      id: "1",
      price: 10000,
      name: "Music concert",
      image: "https://picsum.photos/200",
      time: '2023-08-25T03:23:08.073Z',
      location: 'Quy Nhon',
    ),
    EventModel(
      id: "2",
      price: 20000,
      name: "Football",
      image: "https://picsum.photos/200",
      time: '2023-09-25T03:23:08.073Z',
      location: 'Quy Nhon',
    ),
    EventModel(
      id: "3",
      price: 30000,
      name: "Black Pink",
      image: "https://picsum.photos/200",
      time: '2023-08-25T03:23:08.073Z',
      location: 'Hà nội',
    ),
    EventModel(
      id: "4",
      price: 30000,
      name: "The Wombats",
      image: "https://picsum.photos/200",
      time: '2023-08-25T03:23:08.073Z',
      location: 'Hà nội',
    ),
    EventModel(
      id: "5",
      price: 30000,
      name: "Foster The People",
      image: "https://picsum.photos/200",
      time: '2023-08-25T03:23:08.073Z',
      location: 'Hà nội',
    )
  ];

  @override
  Widget build(BuildContext context) {
    context.read<FavouriteListCubit>().getFavouriteList();
    return Scaffold(
      body: Container(
        child: BlocBuilder<FavouriteListCubit, FavouriteListState>(
          builder: (context, state) {
            if (state is FavouriteListLoading) {
              return const Column(
                children: [
                  LoadingCirle(),
                ],
              );
            } else if (state is FavouriteListLoaded) {
              final favouriteList = state.favouriteList;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: favouriteList.isEmpty
                    ? const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.favorite,
                              color: Color.fromRGBO(242, 242, 242, 1),
                              size: 100,
                            ),
                            SizedBox(
                              height: 32,
                            ),
                            Text(
                              'No favourites yet',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Text(
                                'Make sure you have added event’s in this section')
                          ],
                        ),
                      )
                    : FavouriteList(eventList: state.favouriteList),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}

class FavouriteList extends StatelessWidget {
  const FavouriteList({
    super.key,
    required this.eventList,
  });

  final List<EventModel> eventList;

  Future _handleAddFavourite(EventModel event, BuildContext context) async {
    await context.read<FavouriteCubit>().addFavourite(
        event.id, FavouriteRequest(isFavourite: !event.isFavourite!));
    context.read<FavouriteListCubit>().getFavouriteList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 64,
        ),
        Row(
          children: [
            Text(
              'Favourites',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            SizedBox(
              width: 4,
            ),
            CircleAvatar(
              backgroundColor: primaryColor,
              radius: 14,
              child: Center(
                child: Text(
                  '${eventList.length}',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
        Expanded(
          child: ListView.builder(
              itemCount: eventList.length,
              itemBuilder: (context, index) => EventItem(
                    isFavourite: true,
                    event: eventList[index],
                    onFavourited: () =>
                        _handleAddFavourite(eventList[index], context),
                    onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const DetailEvent(),
                      ),
                    ),
                  )),
        )
      ],
    );
  }
}
