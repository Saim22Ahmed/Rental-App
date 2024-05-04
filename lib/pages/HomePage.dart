import 'package:airbnb_app/components/category_list.dart';
import 'package:airbnb_app/components/search_bar.dart';
import 'package:airbnb_app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,

      // appbar
      appBar: AppBar(
        // backgroundColor: themecolor,
        toolbarHeight: 160.h,
        flexibleSpace: Container(
          child: Stack(
            children: [
              //property type list

              Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: CategoryList(),
              ),

              // tune icon
              Positioned(
                  child: IconButton(
                    icon: Icon(Icons.tune),
                    onPressed: () {},
                  ),
                  right: 8.w,
                  top: 70.h),

              //search bar
              MySearchBar(onTap: () {
                context.pushNamed('bookingDetails');
              })
            ],
          ),
        ),
      ),
      body: Center(
        child: Text('Home Page'),
      ),
    );
  }
}
