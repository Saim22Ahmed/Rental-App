import 'package:airbnb_app/models/booking_model/booking_step_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectGuestsWidget extends ConsumerWidget {
  const SelectGuestsWidget({
    super.key,
    required this.step,
  });

  final StateProvider<BookingStep> step;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      color: Theme.of(context).colorScheme.onPrimaryContainer,
      elevation: ref.watch(step) == BookingStep.selectGuests ? 8 : 2,
      clipBehavior: Clip.antiAlias,
      child: AnimatedContainer(
        color: Theme.of(context).colorScheme.onPrimaryContainer,
        height: ref.watch(step) == BookingStep.selectGuests ? 300 : 60,
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          vertical: 16.h,
          horizontal: 16.w,
        ),
        duration: const Duration(milliseconds: 300),
        child: ref.watch(step) == BookingStep.selectGuests
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Who\'s coming?',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16.h),
                  SizedBox(
                    height: 220.h,
                    child: ListView(
                      physics: BouncingScrollPhysics(),
                      padding: EdgeInsets.zero,
                      children: [
                        _buildGuestsQuanitySelector(
                          context,
                          'Adults',
                          'Ages 13 or above',
                          () {},
                          () {},
                          '0',
                        ),
                        const Divider(),
                        _buildGuestsQuanitySelector(
                          context,
                          'Children',
                          'Ages 2-12',
                          () {},
                          () {},
                          '0',
                        ),
                        const Divider(),
                        _buildGuestsQuanitySelector(
                          context,
                          'Infants',
                          'Under 2',
                          () {},
                          () {},
                          '0',
                        ),
                      ],
                    ),
                  ),
                ],
              )
                .animate(delay: const Duration(milliseconds: 300))
                .fadeIn(duration: const Duration(milliseconds: 300))
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Who',
                    style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Add guests',
                    style:
                        TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
      ),
    );
  }

  Container _buildGuestsQuanitySelector(
    BuildContext context,
    String title,
    String subtitle,
    VoidCallback onDecrement,
    VoidCallback onIncrement,
    String value,
  ) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: textTheme.bodyLarge),
              Text(subtitle, style: textTheme.bodySmall),
            ],
          ),
          Row(
            children: [
              IconButton(
                onPressed: onDecrement,
                icon: const Icon(Icons.remove),
              ),
              Text(
                value,
                style:
                    textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
              ),
              IconButton(
                onPressed: onIncrement,
                icon: const Icon(Icons.add),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
