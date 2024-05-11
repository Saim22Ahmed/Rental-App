import 'package:airbnb_app/constants/colors.dart';
import 'package:flutter/material.dart';

class MyOutlineButton extends StatelessWidget {
  const MyOutlineButton({super.key, required this.title, this.onPressed});

  final String title;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: themecolor, width: 1.5),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.0)),
          minimumSize: Size(120, 48),
        ).copyWith(
            overlayColor:
                MaterialStateProperty.all(themecolor.withOpacity(0.2))),
        onPressed: onPressed,
        child: Text(title));
  }
}
