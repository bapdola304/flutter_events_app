import 'package:events_app/models/ticket.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TicketItem extends StatelessWidget {
  final TicketModel ticket;
  const TicketItem({
    super.key,
    required this.ticket,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          border: Border.all(
              width: 1, color: const Color.fromRGBO(242, 242, 242, 1))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/icons/ticket.png',
                      width: 31,
                      height: 31,
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          ticket.name,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(height: 4),
                        Text(DateFormat('EEE, MMM d, · hh:mm aaa')
                            .format(DateTime.parse(ticket.time)))
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 10),
                Text('${ticket.quantity} Tickets')
              ],
            ),
          ),
          Image.asset(
            'assets/images/ticket.png',
            width: 140,
            height: 96,
          ),
        ],
      ),
    );
  }
}
