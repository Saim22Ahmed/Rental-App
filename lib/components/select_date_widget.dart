import 'dart:developer';

import 'package:airbnb_app/components/myCalender.dart';
import 'package:airbnb_app/components/myOutlineButton.dart';
import 'package:airbnb_app/constants/colors.dart';
import 'package:airbnb_app/models/booking_model/booking_step_model.dart';
import 'package:airbnb_app/provider/calenderOptionsProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';

class SelectDateWidget extends ConsumerWidget {
  SelectDateWidget({super.key, required this.step});
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
                  ref.watch(calenderOptionsProvider) == CalenderOptions.day ||
                          ref.watch(calenderOptionsProvider) ==
                              CalenderOptions.year
                      ? Expanded(
                          child: Column(
                            children: [
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
                            ],
                          )
                              .animate()
                              .fadeIn(
                                  duration: const Duration(milliseconds: 300))
                              .slideX(
                                  duration: const Duration(milliseconds: 200)),
                        )
                      : Expanded(
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // SizedBox(
                                //   height: 30.h,
                                // ),
                                Neumorphic(
                                  padding: const EdgeInsets.all(20.0),
                                  style: NeumorphicStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .background,
                                    boxShape: NeumorphicBoxShape.circle(),
                                    depth: -8,
                                    oppositeShadowLightSource: false,
                                  ),
                                  child: Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .background,
                                        // boxShadow: [
                                        //   BoxShadow(
                                        //       color: Colors.red,
                                        //       blurRadius: 0,
                                        //       spreadRadius: 0,
                                        //       offset: const Offset(1, 1))
                                        // ],
                                      ),
                                      // height: 300.h,
                                      // width: 300.w,
                                      child: SleekCircularSlider(
                                        initialValue: 4,
                                        min: 1,
                                        max: 12,
                                        onChange: (double value) {
                                          log(value.toString());
                                          // callback providing a value while its being changed (with a pan gesture)
                                        },
                                        onChangeStart: (double startValue) {
                                          // callback providing a starting value (when a pan gesture starts)
                                        },
                                        onChangeEnd: (double endValue) {
                                          // ucallback providing an ending value (when a pan gesture ends)
                                        },
                                        // innerWidget: (double value) {
                                        //   // use your custom widget inside the slider (gets a slider value from the callback)
                                        // },
                                        appearance: CircularSliderAppearance(
                                            angleRange: 360,
                                            infoProperties: InfoProperties(
                                                bottomLabelText: 'months',
                                                bottomLabelStyle: TextStyle(
                                                  color: Colors.grey[600],
                                                  fontSize: 18.sp,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                modifier: (percentage) {
                                                  return '${percentage.round()}';
                                                },
                                                mainLabelStyle: TextStyle(
                                                    fontSize: 80.sp,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            size: 300.h,
                                            customColors: CustomSliderColors(
                                              gradientStartAngle: 180,
                                              gradientEndAngle: 360,
                                              progressBarColor: themecolor,
                                              progressBarColors: [
                                                themecolor.withOpacity(0.1),
                                                themecolor.withOpacity(0.2),
                                                themecolor.withOpacity(0.3),
                                                themecolor.withOpacity(0.4),
                                                themecolor.withOpacity(0.5),
                                                themecolor.withOpacity(0.6),
                                                themecolor.withOpacity(0.7),
                                                themecolor.withOpacity(0.8),
                                                themecolor.withOpacity(0.9),
                                              ],
                                              trackColor: Colors.grey[100]!,
                                              shadowColor:
                                                  themecolor.withOpacity(0.2),
                                              dotColor: Colors.white,
                                              shadowStep: 10,
                                            ),
                                            customWidths: CustomSliderWidths(
                                              handlerSize: 10,
                                              trackWidth: 35,
                                              progressBarWidth: 38,
                                            )),
                                      )),
                                ),
                                SizedBox(height: 50.h),

                                Text('Starting from June 1st!',
                                    style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ],
                            ),
                          ),
                        )
                          .animate()
                          .fadeIn(duration: const Duration(milliseconds: 200))
                          .saturate(
                              duration: const Duration(milliseconds: 300)),
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
                          onPressed: () {
                            ref.read(step.notifier).state =
                                BookingStep.selectGuests;
                          },
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
