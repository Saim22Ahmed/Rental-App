import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

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
      right: 72.w,
      top: 55.h,
      child: GestureDetector(
        onTap: onTap,
        child: Hero(
          tag: 'search',
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(color: Colors.grey, width: 0.4),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 6,
                    spreadRadius: 6,
                    offset: const Offset(0, 4),
                  )
                ]),
            child: Row(children: [
              // search Icon
              const Icon(Icons.search),
              const SizedBox(width: 8.0),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Where to?',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontWeight: FontWeight.bold)),
                  Text('Anywhere * Any week * Add guest',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 14.sp)),
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}
