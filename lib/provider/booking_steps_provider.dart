import 'dart:developer';

import 'package:airbnb_app/models/booking_model/booking_step_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final bookingStepProvider = ChangeNotifierProvider<BookingStepProvider>(
  (ref) => BookingStepProvider(),
);

class BookingStepProvider extends ChangeNotifier {
  BookingStep _step = BookingStep.selectDate;

  BookingStep get step => _step;

  set step(BookingStep step) {
    _step = step;
    notifyListeners();
  }

  changeStep(BookingStep value) {
    step = value;
    log('Step changed : ' + step.toString());
    notifyListeners();
  }
}
