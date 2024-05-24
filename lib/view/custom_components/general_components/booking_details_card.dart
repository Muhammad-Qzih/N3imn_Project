import 'package:flutter/material.dart';


class BookingDetailsCard extends StatefulWidget {
  const BookingDetailsCard({
    super.key,
  });

  @override
  State<BookingDetailsCard> createState() => _BookingDetailsCardState();
}

class _BookingDetailsCardState extends State<BookingDetailsCard> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return const Text("cardDetailsService");
  }
}
