import 'dart:developer';

import 'package:airbnb_app/constants/colors.dart';
import 'package:airbnb_app/models/category_model/category_model.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:icons_plus/icons_plus.dart';

class CategoryDetailsPage extends ConsumerWidget {
  CategoryDetailsPage({super.key, required this.category});

  final CategoryModel category;

  final PageController controller = PageController();
  final currentPageProvider = StateProvider<int>((ref) => 0);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Image

            Container(
              height: 300.h,
              child: Stack(
                children: [
                  // Image
                  Container(
                    width: double.infinity,
                    child: PageView(
                      allowImplicitScrolling: true,
                      controller: controller,
                      onPageChanged: (value) {
                        //  final currentPage = ref.watch(currentPageProvider);
                        ref.read(currentPageProvider.notifier).state = value;
                        log('current page :' +
                            ref
                                .read(currentPageProvider.notifier)
                                .state
                                .toString());
                      },
                      children: category.photoUrls!.map((imageUrl) {
                        return Image.asset(imageUrl, fit: BoxFit.cover);
                      }).toList(),
                    ),
                  ),

                  // dots Indicator
                  Positioned(
                    bottom: 8.h,
                    left: 0.0,
                    right: 0.0,
                    child: DotsIndicator(
                      dotsCount: category.photoUrls!.length,
                      position: ref.watch(currentPageProvider),
                      onTap: (index) {
                        controller.animateToPage(
                          index,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                      },
                      decorator: DotsDecorator(
                        color: Colors.grey.withOpacity(0.5),
                        activeColor: Colors.white.withOpacity(0.9),
                        size: const Size.square(8.0),
                        activeSize: const Size(8.0, 8.0),
                        activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    ),
                  ),
                  //back button
                  Positioned(
                    left: 20.w,
                    top: 60.h,
                    child: Container(
                      alignment: Alignment.center,
                      height: 35.h,
                      width: 35.h,
                      // padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      child: IconButton(
                          onPressed: () {
                            context.pop();
                          },
                          icon: Icon(
                            Icons.arrow_back_ios_new_rounded,
                            size: 18.sp,
                          )),
                    ),
                  )
                ],
              ),
            ),

            // body
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 24.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '${category.description}',
                      // textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onInverseSurface,
                        fontSize: 28.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 18.h),
                  Container(
                    child: Text(
                      '${category.categoryType} in ${category.city}, ${category.country}',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text('${category.maxGuests} Guests ∘ ${category.roomType}'),
                  SizedBox(height: 16.h),
                  Divider(
                    color: Colors.grey.withOpacity(0.4),
                  ),
                  SizedBox(height: 10.h),
                  Text('Hosted by Saim',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      )),
                  SizedBox(height: 5.h),
                  Text('Superhost ∘ 1 year hosting',
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.grey[600],
                      )),
                  SizedBox(height: 10.h),
                  Divider(
                    color: Colors.grey.withOpacity(0.4),
                  ),
                  SizedBox(height: 10.h),
                  Container(
                    child: Row(
                      children: [
                        Icon(Icons.home_work_outlined),
                        SizedBox(width: 24.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Dedicated Workspace',
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                  )),
                              SizedBox(height: 5.h),
                              Text(
                                  'A common area with wifi that\'s well-suited for working',
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    color: Colors.grey[600],
                                  )),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
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
              },
              child: Text(
                '\$${category.pricePerNight!.toInt()} night',
                style: TextStyle(
                    // decoration: TextDecoration.underline,
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold),
              ),
            ),
            FilledButton.icon(
                style: FilledButton.styleFrom(
                    backgroundColor: themecolor,
                    foregroundColor: Colors.white,
                    minimumSize: Size(100.h, 55.w),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r))),
                onPressed: () {},
                icon: Icon(OctIcons.search, size: 18.sp),
                label: Text("Reserve", style: TextStyle(fontSize: 19.sp)))
          ],
        ),
      ),
    );
  }
}
