import 'dart:ui';

import 'package:airbnb_app/components/select_destination.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class BookingDetailsPage extends StatelessWidget {
  const BookingDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
      child: Scaffold(
        backgroundColor:
            Theme.of(context).colorScheme.background.withOpacity(0.5),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: true,
          leading: IconButton(
              onPressed: () => context.pop(), icon: Icon(Icons.chevron_left)),
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
        body: Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              children: [SelectDestination()],
            )),
      ),
    );
  }
}
