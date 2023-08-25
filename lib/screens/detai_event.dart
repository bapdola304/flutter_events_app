import 'package:events_app/compoments/button.dart';
import 'package:events_app/compoments/favourites_and_share.dart';
import 'package:events_app/constants.dart';
import 'package:flutter/material.dart';

class DetailEvent extends StatelessWidget {
  const DetailEvent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Stack(children: [
          Container(
              height: 240,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/detail.png'),
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
          const Positioned(
            bottom: 22,
            right: 16,
            child: FavouritesAndShare(iconColor: Colors.white),
          )
        ]),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text('La Rosalia',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 32),
                  Row(
                    children: [
                      Icon(Icons.calendar_today_outlined),
                      SizedBox(width: 8),
                      Text(
                        'Mon, Apr 18 · 21:00 Pm',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 16),
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
                        'Quy Nhon City',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 16),
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
                children: [
                  SizedBox(height: 32),
                  Text('About',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
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
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          decoration: const BoxDecoration(color: Color(0xFFF2F2F2)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                children: [
                  Text(
                    'Price',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                  ),
                  Text('\$ 35.00', style: TextStyle(fontSize: 16))
                ],
              ),
              ButtonCommon(
                  textButton: 'Delete Event',
                  color: redColor,
                  width: 190,
                  onPress: () {})
            ],
          ),
        )
      ]),
    );
  }
}
