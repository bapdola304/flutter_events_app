// ignore_for_file: prefer_const_constructors

import 'package:events_app/compoments/button.dart';
import 'package:events_app/compoments/favourites_and_share.dart';
import 'package:events_app/compoments/loading_circle.dart';
import 'package:events_app/constants.dart';
import 'package:events_app/cubit/detail_event_cubit.dart';
import 'package:events_app/cubit/detail_event_state.dart';
import 'package:events_app/cubit/events_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class DetailEvent extends StatefulWidget {
  final String? eventId;
  const DetailEvent({super.key, this.eventId});

  @override
  State<DetailEvent> createState() => _DetailEventState();
}

class _DetailEventState extends State<DetailEvent> {
  bool _isLoading = false;
  late FToast fToast;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fToast = FToast();
    // if you want to use context from globally instead of content we need to pass navigatorKey.currentContext!
    fToast.init(context);
  }

  Future _handleSubmit(BuildContext context) async {
    setState(() {
      _isLoading = true;
    });
    await context.read<EventsCubit>().deleteEventCubit(widget.eventId!);
    setState(() {
      _isLoading = false;
    });
    fToast.showToast(
      child: ButtonCommon(
        textButton: 'Delete Event Success!',
        onPress: () {},
        width: MediaQuery.of(context).size.width * 0.5,
      ),
      gravity: ToastGravity.TOP,
      toastDuration: Duration(seconds: 2),
    );
    if (context.mounted) Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    context.read<EventDetailCubit>().getEvent(widget.eventId!);
    return Scaffold(
      body: Container(
        child: BlocBuilder<EventDetailCubit, EventDetailState>(
          builder: (context, state) {
            if (state is EventDetailStateLoading) {
              return const Column(
                children: [
                  LoadingCirle(),
                ],
              );
            } else if (state is EventDetailStateLoaded) {
              final eventData = state.eventData;
              bool isURLValid =
                  Uri.parse(state.eventData.image).host.isNotEmpty;
              return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(children: [
                      Container(
                          height: 240,
                          decoration: isURLValid
                              ? BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(eventData.image),
                                      fit: BoxFit.fill),
                                )
                              : BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/detail.png'),
                                      fit: BoxFit.fill),
                                )),
                      Positioned(
                        bottom: 16,
                        child: IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            )),
                      ),
                      Positioned(
                        bottom: 22,
                        right: 16,
                        child: FavouritesAndShare(
                          iconColor: Colors.white,
                          isFavourite: eventData.isFavourite,
                        ),
                      )
                    ]),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 20),
                          Text(eventData.name,
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.w600)),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 32),
                              Row(
                                children: [
                                  Icon(Icons.calendar_today_outlined),
                                  SizedBox(width: 8),
                                  Text(
                                    DateFormat('EEE, MMM d, · hh:mm aaa')
                                        .format(DateTime.parse(eventData.time)),
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16),
                                  )
                                ],
                              ),
                              SizedBox(height: 8),
                              Padding(
                                  padding: EdgeInsets.only(left: 32),
                                  child: Text('21:00 Pm - 23.30 Pm')),
                              SizedBox(height: 8),
                              Padding(
                                padding: EdgeInsets.only(left: 32),
                                child: Text(
                                  'Add to calandar',
                                  style: TextStyle(color: blueColor),
                                ),
                              )
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 32),
                              Row(
                                children: [
                                  Icon(Icons.location_on_outlined),
                                  SizedBox(width: 8),
                                  Text(
                                    eventData.location,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16),
                                  )
                                ],
                              ),
                              SizedBox(height: 8),
                              Padding(
                                  padding: EdgeInsets.only(left: 32),
                                  child: Text('34 Ngô Mây, Quy Nhon')),
                              SizedBox(height: 8),
                              Padding(
                                padding: EdgeInsets.only(left: 32),
                                child: Text(
                                  'View on maps',
                                  style: TextStyle(color: blueColor),
                                ),
                              )
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              SizedBox(height: 32),
                              Text('About',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700)),
                              SizedBox(height: 8),
                              Text(
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.')
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 16),
                      decoration: const BoxDecoration(color: Color(0xFFF2F2F2)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                'Price',
                                style: TextStyle(
                                    fontWeight: FontWeight.w700, fontSize: 16),
                              ),
                              Text('\$ ${eventData.price}',
                                  style: TextStyle(fontSize: 16))
                            ],
                          ),
                          ButtonCommon(
                              textButton: 'Delete Event',
                              color: redColor,
                              width: 190,
                              isLoading: _isLoading,
                              onPress: () => _handleSubmit(context))
                        ],
                      ),
                    )
                  ]);
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
