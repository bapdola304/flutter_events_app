import 'package:events_app/compoments/ticket_item.dart';
import 'package:events_app/constants.dart';
import 'package:events_app/models/ticket.dart';
import 'package:flutter/material.dart';

class Tickets extends StatefulWidget {
  const Tickets({super.key});

  @override
  State<Tickets> createState() => _TicketsState();
}

class _TicketsState extends State<Tickets> {
  List<TicketModel> ticketList = [
    const TicketModel(
      id: 1,
      name: "Music concert",
      image: "https://picsum.photos/200",
      time: '2023-08-25T03:23:08.073Z',
      quantity: 2,
    ),
    const TicketModel(
      id: 2,
      name: "Football",
      image: "https://picsum.photos/200",
      time: '2023-09-25T03:23:08.073Z',
      quantity: 1,
    ),
    const TicketModel(
      id: 3,
      name: "Black Pink",
      image: "https://picsum.photos/200",
      time: '2023-08-25T03:23:08.073Z',
      quantity: 3,
    ),
    const TicketModel(
      id: 4,
      name: "The Wombats",
      image: "https://picsum.photos/200",
      time: '2023-08-25T03:23:08.073Z',
      quantity: 1,
    ),
    const TicketModel(
      id: 5,
      name: "Foster The People",
      image: "https://picsum.photos/200",
      time: '2023-08-25T03:23:08.073Z',
      quantity: 2,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(30.0),
        child: AppBar(
          backgroundColor: primaryColor,
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: DefaultTabController(
        length: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: primaryColor,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Tickets',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                    const Spacer(),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: const TabBar(
                        padding: EdgeInsets.only(bottom: 10),
                        indicatorColor: Colors.white,
                        dividerColor: Colors.transparent,
                        labelColor: Colors.white,
                        labelPadding: EdgeInsets.zero,
                        unselectedLabelColor:
                            Color.fromRGBO(242, 242, 242, 0.75),
                        unselectedLabelStyle:
                            TextStyle(fontWeight: FontWeight.normal),
                        labelStyle: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w700),
                        tabs: [
                          Tab(text: 'Upcoming'),
                          Tab(text: 'Past Tickets'),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: TabBarView(
                  children: [
                    Column(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(top: 16),
                            height: 30,
                            child: ListView.builder(
                                itemCount: ticketList.length,
                                itemBuilder: (context, index) => TicketItem(
                                      ticket: ticketList[index],
                                      // onPressed: () => Navigator.of(context).push(
                                      //   MaterialPageRoute(
                                      //     builder: (context) => const DetailEvent(),
                                      //   ),
                                      // ),
                                    )),
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(top: 16),
                            height: 30,
                            child: ListView.builder(
                                itemCount: ticketList.length,
                                itemBuilder: (context, index) => TicketItem(
                                      ticket: ticketList[index],
                                      // onPressed: () => Navigator.of(context).push(
                                      //   MaterialPageRoute(
                                      //     builder: (context) => const DetailEvent(),
                                      //   ),
                                      // ),
                                    )),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
