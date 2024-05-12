import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyTextFormField extends StatelessWidget {
  MyTextFormField({
    super.key,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.controller,
    this.expands,
    this.maxlines,
    this.onChanged,
    required this.obscuretext,
    this.keyboardType,
    this.onTap,
    this.readOnly = false,
    this.validator,
    this.autovalidateMode,
  });
  final String hintText;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final TextEditingController? controller;
  final bool? expands;
  final int? maxlines;
  final bool obscuretext;
  final TextInputType? keyboardType;
  final void Function(String)? onChanged;
  final Function()? onTap;
  final bool readOnly;
  final String? Function(String?)? validator;
  final AutovalidateMode? autovalidateMode;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextFormField(
        autovalidateMode: autovalidateMode,
        validator: validator,
        obscureText: obscuretext,
        readOnly: readOnly,
        onTap: onTap,
        onChanged: onChanged,
        expands: expands ?? false,
        controller: controller,
        onTapOutside: (event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        textAlign: TextAlign.start,
        textAlignVertical: TextAlignVertical.center,

        textInputAction: TextInputAction.next,
        // autofocus: true,
        maxLines: maxlines,
        cursorColor: Theme.of(context).colorScheme.primary.withOpacity(0.8),

        style: TextStyle(
          // height: 1.h,
          fontSize: 16.sp,
        ),
        keyboardType: keyboardType,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 8.w),
          filled: true,
          fillColor:
              Theme.of(context).colorScheme.onBackground.withOpacity(0.1),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(6.r),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.4),
              width: 1.w,
            ),
            borderRadius: BorderRadius.circular(6.r),
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 16.sp,
            color: Colors.grey[500],
          ),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,

          // prefixIcon: Icon(EvaIcons.email, color: myColors.theme_turquoise.blue)
        ),
      ),
    );
  }
}
