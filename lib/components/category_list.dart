import 'package:airbnb_app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryList extends StatefulWidget {
  CategoryList({super.key});

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final List<Map<String, dynamic>> categoryList = [
      {'type': 'Hotel', 'icon': Icons.hotel_rounded},
      {'type': 'Apartment', 'icon': Icons.apartment_rounded},
      {'type': 'Villa', 'icon': Icons.villa_rounded},
      {'type': 'Resort', 'icon': Icons.holiday_village_rounded},
      {'type': 'Bnb', 'icon': Icons.bedroom_child_rounded},
    ];
    return SizedBox(
      height: 65.h,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: categoryList.length,
          itemBuilder: (context, index) {
            // reverse the list

            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Container(
                margin: EdgeInsets.only(right: 4.w, left: 4.w, top: 4.h),
                width: 82.w,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      categoryList[index]['icon'],
                      color: theme.onInverseSurface,
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      categoryList[index]['type'],
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: theme.onInverseSurface,
                            fontWeight: selectedIndex == index
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                    ),
                    // bottom line based on index
                    (index == selectedIndex)
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
