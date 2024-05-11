import 'package:airbnb_app/components/myCalender.dart';
import 'package:airbnb_app/components/myOutlineButton.dart';
import 'package:airbnb_app/constants/colors.dart';
import 'package:airbnb_app/models/booking_model/booking_step_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectDateWidget extends ConsumerWidget {
  const SelectDateWidget({super.key, required this.step});
  final StateProvider<BookingStep> step;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var expandedHeight = MediaQuery.sizeOf(context).height - 112 - 60 - 32 - 20;
    return Card(
      color: Theme.of(context).colorScheme.onPrimaryContainer,
      elevation: ref.watch(step) == BookingStep.selectDate ? 8 : 2,
      clipBehavior: Clip.antiAlias,
      child: AnimatedContainer(
        color: Theme.of(context).colorScheme.onPrimaryContainer,
        duration: 300.ms,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 16.0,
        ),
        height: ref.watch(step) == BookingStep.selectDate ? expandedHeight : 60,
        child: ref.watch(step) == BookingStep.selectDate
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'When\'s your trip?',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Row(
                    children: [
                      Expanded(child: CalenderOptionsSegmentedButton()),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  // Calender
                  MyCalender(),
                  const Spacer(),
                  const Divider(),
                  SizedBox(
                    height: 48.h,
                    child: ListView(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      children: [
                        //Exact Dates
                        MyOutlineButton(
                          onPressed: () {},
                          title: 'Exact Dates',
                        ),

                        SizedBox(width: 8.h),

                        MyOutlineButton(
                          onPressed: () {},
                          title: '±1 day',
                        ),
                        SizedBox(width: 8.h),

                        MyOutlineButton(
                          onPressed: () {},
                          title: '±2 day',
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            ref.read(step.notifier).state =
                                BookingStep.selectGuests;
                          },
                          child: Text('Skip'),
                        ),
                        FilledButton(
                          onPressed: () {},
                          child: Text(
                            'Next',
                            style: TextStyle(color: Colors.white),
                          ),
                          style: FilledButton.styleFrom(
                              backgroundColor: themecolor,
                              minimumSize: Size(120, 48),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0))),
                        )
                      ])
                ],
              )
                .animate(delay: const Duration(milliseconds: 300))
                .fadeIn(duration: const Duration(milliseconds: 300))
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'When',
                    style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Any week',
                    style:
                        TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                  )
                ],
              ),
      ),
    );
  }
}
