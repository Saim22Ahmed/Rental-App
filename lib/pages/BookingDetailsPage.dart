import 'dart:developer';
import 'dart:ui';

import 'package:airbnb_app/components/select_date_widget.dart';
import 'package:airbnb_app/components/select_destination.dart';
import 'package:airbnb_app/models/booking_model/booking_step_model.dart';
import 'package:airbnb_app/provider/booking_steps_provider.dart';
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
      StateProvider<BookingStep>((ref) => BookingStep.selectDate);

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
      child: Scaffold(
        // resizeToAvoidBottomInset: false,
        backgroundColor:
            Theme.of(context).colorScheme.background.withOpacity(0.5),
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
          child: Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                children: [
                  //select Destination
                  Consumer(builder: (context, ref, child) {
                    return GestureDetector(
                        onTap: () {
                          ref.read(stepProvider.notifier).state =
                              BookingStep.selectDestination;
                        },
                        child: Hero(
                            tag: 'search',
                            child: SelectDestination(
                              step: stepProvider,
                            )));
                  }),
                  // Select Date
                  Consumer(builder: (context, ref, child) {
                    return GestureDetector(
                        onTap: () {
                          ref.read(stepProvider.notifier).state =
                              BookingStep.selectDate;
                        },
                        child: SelectDateWidget(
                          step: stepProvider,
                        ));
                  })
                ],
              )),
        ),
      ),
    );
  }
}
