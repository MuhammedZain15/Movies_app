import 'package:flutter/material.dart';

class BrowseWidget extends StatelessWidget {
  const BrowseWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {

      },
      child: Container(
        width: 160.0,
        height: 90.0,
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            ClipRRect(
              child: Image.asset('assets/images/image_cat.png'),
              borderRadius: BorderRadius.circular(10),
            ),
            const Text(
             "Action",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
