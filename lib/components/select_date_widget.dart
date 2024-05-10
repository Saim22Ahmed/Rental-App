import 'package:airbnb_app/models/booking_model/booking_step_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectDateWidget extends StatelessWidget {
  const SelectDateWidget({super.key, required this.step});
  final StateProvider<BookingStep> step;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      color: Colors.red,
    );
  }
}
