import 'package:flutter/material.dart';
import 'package:movies_app/moduls/browse/widget/browse_widget.dart';

class BrowsePage extends StatelessWidget {
  const BrowsePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Browse Category',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
             Expanded(
                  child: GridView.builder(
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 4,
                      mainAxisSpacing: 4,
                      childAspectRatio: 3 / 2,
                    ),
                    itemBuilder: (context, index) {
                      return const BrowseWidget();
                    },
                    itemCount: 10)
            )
          ],
        ),
      ),
    );
  }
}
