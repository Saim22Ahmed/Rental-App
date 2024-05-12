import 'package:airbnb_app/components/myTextField.dart';
import 'package:airbnb_app/gen/assets.gen.dart';
import 'package:airbnb_app/models/booking_model/booking_step_model.dart';
import 'package:airbnb_app/provider/booking_steps_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:redacted/redacted.dart';

class SelectDestination extends ConsumerWidget {
  SelectDestination({
    super.key,
    required this.step,
  });

  final StateProvider<BookingStep> step;

  final destinations = ['I\'m Flexible', 'Middle East', 'UAE', 'Europe', 'UK'];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Material(
        type: MaterialType.transparency,
        borderRadius: BorderRadius.circular(16.r),
        child: Card(
          color: Theme.of(context).colorScheme.onPrimaryContainer,
          elevation: ref.watch(step) == BookingStep.selectDestination ? 8 : 2,
          clipBehavior: Clip.antiAlias,
          child: AnimatedContainer(
            color: Theme.of(context).colorScheme.onPrimaryContainer,
            duration: const Duration(milliseconds: 300),
            height:
                ref.watch(step) == BookingStep.selectDestination ? 340.h : 60.h,
            padding: EdgeInsets.all(16),
            child: ref.watch(step) == BookingStep.selectDestination
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Where to?',
                          style: TextStyle(
                              fontSize: 18.sp, fontWeight: FontWeight.bold)),
                      SizedBox(height: 16.h),
                      MyTextFormField(
                          prefixIcon: Icon(
                            color: Colors.grey,
                            Icons.search_outlined,
                            size: 20.h,
                          ),
                          hintText: 'Search destination',
                          obscuretext: false),
                      16.verticalSpace,
                      SizedBox(
                        height: 190.h,
                        child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            cacheExtent: 500,
                            scrollDirection: Axis.horizontal,
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.only(right: 8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(16.r),
                                        child: Image.network(
                                          'https://picsum.photos/200/300?random=$index',
                                          width: 150.w,
                                          height: 150.h,
                                          fit: BoxFit.cover,
                                        )),
                                    8.verticalSpace,
                                    Padding(
                                      padding: EdgeInsets.only(left: 8),
                                      child: Text(
                                        '${destinations[index]}',
                                        style: TextStyle(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ],
                                ),
                              );
                            }),
                      ),
                    ],
                  ).animate(delay: 300.ms).fadeIn(duration: 300.ms)
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Where',
                        style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'I\'m flexible',
                        style: TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
          ),
        ));
  }
}
