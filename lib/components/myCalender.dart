import 'dart:developer';

import 'package:airbnb_app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

enum CalenderOptions { year, month, week, day }

class MyCalender extends StatefulWidget {
  const MyCalender({super.key});

  @override
  State<MyCalender> createState() => _MyCalenderState();
}

void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
  log(args.value.toString());
}

class _MyCalenderState extends State<MyCalender> {
  @override
  Widget build(BuildContext context) {
    return SfDateRangePicker(
        onSelectionChanged: _onSelectionChanged,
        endRangeSelectionColor: themecolor,
        startRangeSelectionColor: themecolor,
        rangeSelectionColor: themecolor.withOpacity(0.2),
        todayHighlightColor: themecolor,
        selectionColor: themecolor,
        selectionTextStyle: const TextStyle(color: Colors.white),
        headerStyle: const DateRangePickerHeaderStyle(
          backgroundColor: Colors.transparent,
          textStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: themecolor,
          ),
        ),
        backgroundColor: Colors.transparent,
        selectionMode: DateRangePickerSelectionMode.range,
        initialSelectedRange: PickerDateRange(
          DateTime.now().subtract(const Duration(days: 5)),
          DateTime.now().add(const Duration(days: 5)),
        ));
  }
}

class CalenderOptionsSegmentedButton extends StatefulWidget {
  CalenderOptionsSegmentedButton({super.key});

  @override
  State<CalenderOptionsSegmentedButton> createState() =>
      _CalenderOptionsSegmentedButtonState();
}

class _CalenderOptionsSegmentedButtonState
    extends State<CalenderOptionsSegmentedButton> {
  CalenderOptions selected = CalenderOptions.month;

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<CalenderOptions>(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.resolveWith<Color>((states) {
          if (states.contains(MaterialState.selected)) {
            return themecolor; // Theme color when selected
          }
          return Colors.grey; // Grey when not selected
        }),
        backgroundColor: MaterialStateProperty.all(Colors.transparent),
        overlayColor: MaterialStateProperty.all(themecolor.withOpacity(0.2)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.0),
          ),
        ),
      ),
      segments: <ButtonSegment<CalenderOptions>>[
        ButtonSegment<CalenderOptions>(
          value: CalenderOptions.day,
          label: const Text('Day'),
        ),
        ButtonSegment<CalenderOptions>(
          value: CalenderOptions.month,
          label: const Text('Month'),
        ),
        ButtonSegment<CalenderOptions>(
          value: CalenderOptions.year,
          label: const Text('Year'),
        ),
      ],
      selected: <CalenderOptions>{selected},
      onSelectionChanged: (newValue) {
        setState(() {
          selected = newValue.first;
          log(selected.toString());
        });
      },
    );
  }
}
