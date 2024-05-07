import 'package:airbnb_app/components/myTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectDestination extends StatelessWidget {
  const SelectDestination({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      clipBehavior: Clip.antiAlias,
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Where to?',
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold)),
            SizedBox(height: 16.h),
            TextFormField(
              onTap: () {},
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(16),
                  hintText: 'Search destination',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  )),
            ),
            16.verticalSpace,
            SizedBox(
              height: 130.h,
              child: ListView.builder(
                  cacheExtent: 500,
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(right: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16.r),
                            child: Image.network(
                              'https://picsum.photos/200/300',
                              height: 100.h,
                              width: 100.w,
                              fit: BoxFit.cover,
                            ),
                          ),
                          8.verticalSpace,
                          Padding(
                            padding: EdgeInsets.only(left: 8),
                            child: Text(
                              'Placeholder',
                              style: TextStyle(fontSize: 14.sp),
                            ),
                          )
                        ],
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
