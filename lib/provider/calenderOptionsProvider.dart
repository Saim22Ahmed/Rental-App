import 'package:airbnb_app/components/myCalender.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final calenderOptionsProvider =
    StateNotifierProvider<CalenderOptionsProvider, CalenderOptions>(
        (ref) => CalenderOptionsProvider());

class CalenderOptionsProvider extends StateNotifier<CalenderOptions> {
  CalenderOptionsProvider() : super(CalenderOptions.day);

  void updateCalenderOption(CalenderOptions option) {
    state = option;
  }
}
