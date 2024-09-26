import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryContainer extends StatelessWidget {
  final String category;

  const CategoryContainer({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20.h,
      width: 20.w,
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xFF514F4F),
          width: 1,

        ),
        borderRadius: BorderRadius.circular(4),
      ),
      padding: const EdgeInsets.all(10),
      child: Center(
        child: Text(
          category,
          style:  TextStyle(
            color: Color(0xFFCBCBCB),
            fontSize: 9.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
