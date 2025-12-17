import 'package:dtc6464/core/utils/constants/colors.dart';
import 'package:dtc6464/features/background/views/widgets/background.dart';
import 'package:dtc6464/features/collect_info/views/page/page_1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/common/widgets/custom_filled_button.dart';
import '../../controller/collect_info_controller.dart';
import '../page/page_10.dart';
import '../page/page_2.dart';
import '../page/page_3.dart';
import '../page/page_4.dart';
import '../page/page_5.dart';
import '../page/page_6.dart';
import '../page/page_7.dart';
import '../page/page_8.dart';
import '../page/page_9.dart';

class CollectInfoScreen extends StatelessWidget {
  CollectInfoScreen({super.key});

  final PageController _pageController = PageController();
  final CollectInfoController _controller = Get.find<CollectInfoController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        child: Column(
          children: [
            Expanded(child: PageView(
              controller: _pageController,
              children: [
                Page1(pageController: _pageController, controller: _controller,),
                Page2(pageController: _pageController, controller: _controller,),
                Page3(pageController: _pageController, controller: _controller,),
                Page4(pageController: _pageController, controller: _controller,),
                Page5(pageController: _pageController, controller: _controller,),
                Page6(pageController: _pageController),
                Page7(pageController: _pageController),
                Page8(pageController: _pageController),
                Page9(pageController: _pageController),
                Page10(pageController: _pageController),
              ],
            )),

            CustomFilledButton(text: 'Continue', onPressed: (){
              _pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            }, isIcon: true,).paddingSymmetric(horizontal: 36.w),

            20.verticalSpace,

            // 2. The Indicator
            SmoothPageIndicator(
              controller: _pageController, // Pass the same controller here
              count: 10,                    // Number of pages
              effect: ExpandingDotsEffect(
                activeDotColor: AppColors.softBlueNormal ,
                dotColor:  AppColors.softBlueNormal,
                dotHeight: 8,
                dotWidth: 8,
                expansionFactor: 4,
              ),
            ),

            60.verticalSpace,
          ],
        ),
      ),
    );
  }
}
