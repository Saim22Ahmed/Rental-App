import 'package:airbnb_app/models/category_model/category_model.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryCard extends StatefulWidget {
  final CategoryModel category;

  const CategoryCard({Key? key, required this.category}) : super(key: key);

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  final controller = PageController();
  var currentPage = 0;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      // decoration: BoxDecoration(
      //   boxShadow: const [
      //     BoxShadow(
      //       color: Colors.black12,
      //       blurRadius: 1.0,
      //       spreadRadius: 1.0,
      //       offset: Offset(0.0, 1.0),
      //     ),
      //   ],
      //   borderRadius: BorderRadius.circular(16.0),
      //   color: Theme.of(context).colorScheme.onBackground,
      // ),
      margin: const EdgeInsets.symmetric(vertical: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                clipBehavior: Clip.antiAlias,
                width: size.width,
                height: size.width - 32.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: PageView(
                  allowImplicitScrolling: true,
                  controller: controller,
                  onPageChanged: (value) {
                    setState(() {
                      currentPage = value;
                    });
                  },
                  children: widget.category.photoUrls!.map((imageUrl) {
                    return Image.asset(imageUrl, fit: BoxFit.cover);
                  }).toList(),
                ),
              ),
              Positioned(
                bottom: 8.0,
                left: 0.0,
                right: 0.0,
                child: DotsIndicator(
                  dotsCount: widget.category.photoUrls!.length,
                  position: currentPage,
                  onTap: (index) {
                    controller.animateToPage(
                      index,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                    );
                  },
                  decorator: DotsDecorator(
                    color: Colors.grey.withOpacity(0.5),
                    activeColor: Colors.white.withOpacity(0.8),
                    size: const Size.square(8.0),
                    activeSize: const Size(12.0, 8.0),
                    activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 5.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${widget.category.country}, ${widget.category.city}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    )),
                const SizedBox(height: 0.0),
                Text(
                  widget.category.description!,
                  style: TextStyle(
                      color: Colors.grey[500], fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 8.0),
                Text(
                  widget.category.amenities!.join(', '),
                  style:
                      TextStyle(fontWeight: FontWeight.w500, fontSize: 14.sp),
                ),
                2.verticalSpace,
                Row(
                  children: [
                    Text(
                      '\$${widget.category.pricePerNight!.toInt().toString()}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14.sp),
                    ),
                    4.horizontalSpace,
                    Text('night')
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
