import 'dart:ui';

import 'package:airbnb_app/components/select_destination.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class BookingDetailsPage extends StatefulWidget {
  const BookingDetailsPage({super.key});

  @override
  State<BookingDetailsPage> createState() => _BookingDetailsPageState();
}

class _BookingDetailsPageState extends State<BookingDetailsPage>
    with AutomaticKeepAliveClientMixin<BookingDetailsPage> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor:
            Theme.of(context).colorScheme.background.withOpacity(0.5),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
              onPressed: () {
                // Navigator.pop(context);
                context.pop();
              },
              icon: Icon(Icons.chevron_left)),
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
                children: [SelectDestination()],
              )),
        ),
      ),
    );
  }
}
