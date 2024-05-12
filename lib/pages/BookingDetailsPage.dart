import 'dart:developer';
import 'dart:ui';

import 'package:airbnb_app/components/myNavBar.dart';
import 'package:airbnb_app/components/select_date_widget.dart';
import 'package:airbnb_app/components/select_destination.dart';
import 'package:airbnb_app/constants/colors.dart';
import 'package:airbnb_app/models/booking_model/booking_step_model.dart';
import 'package:airbnb_app/pages/SelectGuestsWidget.dart';
import 'package:airbnb_app/provider/booking_steps_provider.dart';
import 'package:airbnb_app/provider/guest_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:icons_plus/icons_plus.dart';

class BookingDetailsPage extends StatefulWidget {
  const BookingDetailsPage({super.key});

  @override
  State<BookingDetailsPage> createState() => _BookingDetailsPageState();
}

class _BookingDetailsPageState extends State<BookingDetailsPage> {
  final stepProvider =
      StateProvider<BookingStep>((ref) => BookingStep.selectDestination);

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
        child: Consumer(builder: (context, ref, child) {
          return Scaffold(

              // resizeToAvoidBottomInset: false,
              // backgroundColor: Colors.white,
              backgroundColor: Theme.of(context).colorScheme.background,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                leading: IconButton(
                  icon: Icon(
                    IonIcons.close,
                    size: 24.sp,
                  ),
                  onPressed: () {
                    // Navigator.pop(context);
                    context.pop();
                  },
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //Stays
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Stays',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    //Experiences
                    TextButton(
                      onPressed: () {},
                      child: Text('Experiences',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    )
                  ],
                ),

                //actions
                actions: [SizedBox(width: 48.w)],
              ),
              body: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                    padding: EdgeInsets.all(16.w),
                    child: Column(
                      children: [
                        //select Destination
                        GestureDetector(
                            onTap: () {
                              ref.read(stepProvider.notifier).state =
                                  BookingStep.selectDestination;
                            },
                            child: Hero(
                                tag: 'search',
                                child: SelectDestination(
                                  step: stepProvider,
                                ))),
                        // Select Date
                        GestureDetector(
                            onTap: () {
                              ref.read(stepProvider.notifier).state =
                                  BookingStep.selectDate;
                            },
                            child: SelectDateWidget(
                              step: stepProvider,
                            )),

                        // Select Guest
                        (ref.watch(stepProvider) == BookingStep.selectDate)
                            ? Container()
                            : GestureDetector(
                                onTap: () {
                                  ref.read(stepProvider.notifier).state =
                                      BookingStep.selectGuests;
                                },
                                child: SelectGuestsWidget(
                                  step: stepProvider,
                                ))
                      ],
                    )),
              ),
              bottomNavigationBar: (ref.watch(stepProvider) ==
                      BookingStep.selectDate)
                  ? null
                  : BottomAppBar(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      notchMargin: 0,
                      color: Theme.of(context).colorScheme.background,
                      surfaceTintColor: Colors.white,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () {
                              // ref.read(stepProvider.notifier).state =
                              //     BookingStep.selectDestination;

                              ref.read(guestsProvider.notifier).clearAll();
                            },
                            child: Text(
                              'Clear all',
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: Theme.of(context).colorScheme.primary,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          FilledButton.icon(
                              style: FilledButton.styleFrom(
                                  backgroundColor: themecolor,
                                  foregroundColor: Colors.white,
                                  minimumSize: Size(100.h, 55.w),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(8.r))),
                              onPressed: () {},
                              icon: Icon(OctIcons.search, size: 18.sp),
                              label: Text("Search",
                                  style: TextStyle(fontSize: 19.sp)))
                        ],
                      ),
                    ));
        }));
  }
}
