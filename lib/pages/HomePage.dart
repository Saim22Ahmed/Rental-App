import 'dart:developer';

import 'package:airbnb_app/components/category_card.dart';
import 'package:airbnb_app/components/category_list.dart';
import 'package:airbnb_app/components/search_bar.dart';
import 'package:airbnb_app/constants/colors.dart';
import 'package:airbnb_app/data/category_api.dart';
import 'package:airbnb_app/gen/assets.gen.dart';
import 'package:airbnb_app/models/category_model/category_model.dart';
import 'package:airbnb_app/pages/BookingDetailsPage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends ConsumerWidget {
  HomePage({super.key});

  // List<CategoryModel> categoryModels =
  //     categoryJsonData.map((data) => CategoryModel.fromJson(data)).toList();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,

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
          padding: const EdgeInsets.all(16.0),
          child: ListView.builder(
              cacheExtent: 500,
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
              itemCount: ref.watch(categoryProvider).length,
              itemBuilder: (context, index) {
                //reversed index

                final categoryModels = ref
                    .watch(categoryProvider)
                    .map((data) => CategoryModel.fromJson(data))
                    .toList();

                return CategoryCard(
                  category: categoryModels[index],
                );
              }),
        ));
  }
}
