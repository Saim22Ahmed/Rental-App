import 'dart:developer';

import 'package:airbnb_app/components/category_card.dart';
import 'package:airbnb_app/components/category_list.dart';
import 'package:airbnb_app/components/search_bar.dart';
import 'package:airbnb_app/constants/colors.dart';
import 'package:airbnb_app/gen/assets.gen.dart';
import 'package:airbnb_app/models/category_model/category_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<CategoryModel> sampleData = [
    CategoryModel(
      id: '1',
      description: "Description",
      roomType: "Room Type",
      pricePerNight: 100,
      country: "Country",
      city: "City",
      maxGuests: 10,
      categoryType: "Category Type",
      amenities: ["amenities 1", "amenities 2"],
      mainPhotoUrl: 'assets/images/rentImage.jpg',
      photoUrls: [
        Assets.images.rentImage.path,
        Assets.images.rentImage2.path,
      ],
    ),
    CategoryModel(
      id: '1',
      description: "Description",
      roomType: "Room Type",
      pricePerNight: 100,
      country: "Country",
      city: "City",
      maxGuests: 10,
      categoryType: "Category Type",
      amenities: ["amenities 1", "amenities 2"],
      mainPhotoUrl: 'assets/images/rentImage.jpg',
      photoUrls: [
        Assets.images.rentImage.path,
        Assets.images.rentImage2.path,
      ],
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Theme.of(context).colorScheme.background,
        backgroundColor: Colors.grey[900],

        // appbar
        appBar: AppBar(
          scrolledUnderElevation: 0,
          toolbarHeight: 155.h,
          flexibleSpace: Container(
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onBackground,
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).colorScheme.secondary,
                    blurRadius: 1,
                    spreadRadius: 1,
                    offset: const Offset(0, 1),
                  ),
                ]),
            child: Stack(
              children: [
                //property type list

                Positioned(
                  bottom: 5.0.h,
                  left: 0.0.w,
                  right: 0.0.w,
                  child: CategoryList(),
                ),

                // tune icon
                Positioned(
                    child: IconButton(
                      icon: Icon(Icons.tune),
                      onPressed: () {
                        log(
                          Assets.images.rentImage.path,
                        );
                      },
                    ),
                    right: 8.w,
                    top: 60.h),

                //search bar
                MySearchBar(onTap: () {
                  context.pushNamed('bookingDetails');
                })
              ],
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: sampleData.length,
              itemBuilder: (context, index) {
                return CategoryCard(
                  category: sampleData[index],
                );
              }),
        ));
  }
}
