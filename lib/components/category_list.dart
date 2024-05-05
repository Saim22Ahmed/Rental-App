import 'dart:developer';

import 'package:airbnb_app/constants/colors.dart';
import 'package:airbnb_app/provider/category_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryList extends ConsumerWidget {
  CategoryList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context).colorScheme;

    return SizedBox(
      height: 65.h,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: ref.watch(categoryListProvider).categoryList.length,
          itemBuilder: (context, index) {
            final Selectedindex = ref.watch(categoryListProvider).selectedIndex;
            // reverse the list

            return GestureDetector(
              onTap: () {
                ref.watch(categoryListProvider.notifier).changeIndex(index);
                log(Selectedindex.toString());
                // setState(() {
                //   selectedIndex = index;
                // });
              },
              child: Container(
                margin: EdgeInsets.only(right: 4.w, left: 4.w, top: 4.h),
                width: 82.w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      ref.watch(categoryListProvider).categoryList[index]
                          ['icon'],
                      color: theme.onInverseSurface,
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      ref.watch(categoryListProvider).categoryList[index]
                          ['type'],
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: theme.onInverseSurface,
                            fontWeight: Selectedindex == index
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                    ),
                    // bottom line based on index
                    (index == Selectedindex)
                        ? Container(
                            margin: EdgeInsets.only(top: 8.h),
                            height: 2.h,
                            width: 60.w,
                            color: themecolor)
                        : SizedBox(),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
