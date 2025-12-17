import 'package:dtc6464/core/common/widgets/custom_filled_button.dart';
import 'package:dtc6464/features/background/views/widgets/background.dart';
import 'package:flutter/material.dart';

class Page9 extends StatelessWidget {
  const Page9({super.key, required this.pageController});

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Background(child: Column(
      children: [
        Expanded(child: SizedBox()),

        // continue button
        CustomFilledButton(text: 'Continue', onPressed: (){
          pageController.nextPage(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        })
      ],
    ));
  }
}
