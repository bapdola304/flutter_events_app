import 'package:events_app/compoments/button.dart';
import 'package:events_app/constants.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(height: 30),
              Row(
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Find events in',
                        style: TextStyle(color: grayText, fontSize: 12),
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.location_on_outlined),
                          SizedBox(width: 4),
                          Text(
                            'Barcelona',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          )
                        ],
                      )
                    ],
                  ),
                  const Spacer(),
                  ButtonCommon(
                    textButton: 'New Event',
                    width: 120,
                    onPress: () {},
                  )
                ],
              ),
              const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Text(
                    'Popular in Barcelona',
                    style: TextStyle(fontSize: 16),
                  )),
              Container(
                child: Column(
                  children: [
                    Image.asset('assets/images/card_home.png'),
                    Container(
                      color: const Color(0xFFF2F2F2),
                      padding:
                          EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10))),
                      child: const Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Mon, Apr 18 · 21:00 Pm '),
                              Text('La Rosalia'),
                              Row(
                                children: [
                                  Icon(Icons.location_on_outlined),
                                  SizedBox(width: 4),
                                  Text(
                                    'Barcelona',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ])),
      ),
    );
  }
}
