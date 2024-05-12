import 'dart:developer';

import 'package:airbnb_app/components/category_card.dart';
import 'package:airbnb_app/components/category_list.dart';
import 'package:airbnb_app/components/myNavBar.dart';
import 'package:airbnb_app/components/search_bar.dart';
import 'package:airbnb_app/constants/colors.dart';
import 'package:airbnb_app/data/category_api.dart';
import 'package:airbnb_app/gen/assets.gen.dart';
import 'package:airbnb_app/models/category_model/category_model.dart';
import 'package:airbnb_app/pages/BookingDetailsPage.dart';
import 'package:airbnb_app/provider/category_list_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:redacted/redacted.dart';

class HomePage extends ConsumerWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var selectedIndex = ref.watch(categoryListProvider).selectedIndex;

    var selectedCategory =
        ref.watch(categoryListProvider).categoryList[selectedIndex]['type'];

    // Calculate the filtered list of categories
    final filteredCategoryModels = ref
        .watch(categoryProvider)
        .map((data) => CategoryModel.fromJson(data))
        .where((category) => category.categoryType == selectedCategory)
        .toList();
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        bottomNavigationBar: MyNavBar(),

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

                //search bar
                MySearchBar(onTap: () {
                  context.pushNamed('bookingDetails');
                  // Navigator.push(context, MaterialPageRoute(builder: (context) {
                  //   return BookingDetailsPage();
                  // }));
                })
              ],
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
          ),
          child: ListView.builder(
              cacheExtent: 500,
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
              itemCount: filteredCategoryModels.length,
              itemBuilder: (context, index) {
                return CategoryCard(
                  category: filteredCategoryModels[index],
                ).redacted(
                  context: context,
                  redact: true,
                  configuration: RedactedConfiguration(
                    animationDuration:
                        const Duration(milliseconds: 800), //default
                  ),
                );
              }),
        ));
  }
}
