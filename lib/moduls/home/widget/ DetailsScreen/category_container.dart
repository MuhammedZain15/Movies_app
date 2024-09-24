import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryContainer extends StatelessWidget {
  final String category;

  const CategoryContainer({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: 65,
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
          style: const TextStyle(
            color: Color(0xFFCBCBCB),
            fontSize: 9,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
