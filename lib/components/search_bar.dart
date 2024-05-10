import 'dart:developer';

import 'package:airbnb_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MySearchBar extends StatelessWidget {
  const MySearchBar({
    super.key,
    required this.onTap,
  });

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 16.w,
      right: 16.w,
      top: 55.h,
      child: GestureDetector(
        onTap: onTap,
        child: Hero(
          tag: 'search',
          child: Material(
            type: MaterialType.transparency,
            borderRadius: BorderRadius.circular(50.r),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  borderRadius: BorderRadius.circular(50.r),
                  border: Border.all(color: Colors.grey, width: 0.1),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 2,
                      spreadRadius: 2,
                      offset: const Offset(0, 4),
                    )
                  ]),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // search Icon
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0, right: 5),
                          child: Icon(
                            Icons.search,
                            size: 24.sp,
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Where to?',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(fontWeight: FontWeight.bold)),
                            Text(
                              'Anywhere * Any week * Add guest',
                              style: TextStyle(
                                  fontSize: 12.sp, color: Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),
                    15.horizontalSpace,
                    IconButton(
                      highlightColor: Colors.grey[200],
                      icon: Container(
                          padding: EdgeInsets.all(8.r),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Theme.of(context).colorScheme.inversePrimary,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                blurRadius: 1,
                                spreadRadius: 1,
                                offset: const Offset(0, 0),
                              )
                            ],

                            // borderRadius: BorderRadius.circular(30.r),

                            // border: Border.all(color: Colors.grey, width: 0.2),
                          ),
                          child: Icon(
                            Icons.tune,
                            size: 20.sp,
                          )),
                      onPressed: () {
                        log(
                          Assets.images.rentImage.path,
                        );
                      },
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
