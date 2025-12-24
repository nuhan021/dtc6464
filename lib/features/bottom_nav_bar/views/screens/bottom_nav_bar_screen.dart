import 'package:dtc6464/features/bottom_nav_bar/controller/bottom_nav_bar_conroller.dart';
import 'package:dtc6464/features/home/views/screens/home_screen.dart';
import 'package:dtc6464/features/nav_screens/profile/views/screens/profile_screen.dart';
import 'package:dtc6464/features/practice/views/screens/select_interview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

import '../../../../core/common/styles/global_text_style.dart';
import '../../../../core/utils/constants/colors.dart';
import '../../../../core/utils/constants/icon_path.dart';

class BottomNavBarScreen extends StatelessWidget {
  BottomNavBarScreen({super.key});

  final BottomNavBarController controller = Get.put(BottomNavBarController());

  List<Widget> _buildScreens() {
    return [
      const HomeScreen(),
      const Placeholder(),
      SelectInterview(),
      const Placeholder(),
      const ProfileScreen(),
    ];
  }

  List<PersistentTabConfig> _tabs() => [
    PersistentTabConfig(
      screen: _buildScreens()[0],
      item: ItemConfig(
        icon: Image.asset(IconPath.home, width: 20.w), // Obx রিমোভ করা হয়েছে
        title: "Home",
        textStyle: getTextStyle(fontSize: 10.sp, fontWeight: FontWeight.w500),
        activeForegroundColor: AppColors.softPurpleNormal,
        inactiveForegroundColor: AppColors.lightGreyNormal,
      ),
    ),

    PersistentTabConfig(
      screen: _buildScreens()[1],
      item: ItemConfig(
        icon: Image.asset(IconPath.calender, width: 20.w),
        title: "Planer",
        textStyle: getTextStyle(fontSize: 10.sp, fontWeight: FontWeight.w500),
        activeForegroundColor: AppColors.softPurpleNormal,
        inactiveForegroundColor: AppColors.lightGreyNormal,
      ),
    ),

    PersistentTabConfig(
      screen: _buildScreens()[2],
      item: ItemConfig(
        icon: Image.asset(IconPath.microphone, width: 20.w),
        title: "Practice",
        textStyle: getTextStyle(fontSize: 10.sp, fontWeight: FontWeight.w500),
        activeForegroundColor: AppColors.softPurpleNormal,
        inactiveForegroundColor: AppColors.lightGreyNormal,
      ),
    ),

    PersistentTabConfig(
      screen: _buildScreens()[3],
      item: ItemConfig(
        icon: Image.asset(IconPath.location, width: 20.w),
        title: "Roadmap",
        textStyle: getTextStyle(fontSize: 10.sp, fontWeight: FontWeight.w500),
        activeForegroundColor: AppColors.softPurpleNormal,
        inactiveForegroundColor: AppColors.lightGreyNormal,
      ),
    ),

    PersistentTabConfig(
      screen: _buildScreens()[4],
      item: ItemConfig(
        icon: Image.asset(IconPath.profile, width: 20.w),
        title: "Profile",
        textStyle: getTextStyle(fontSize: 10.sp, fontWeight: FontWeight.w500),
        activeForegroundColor: AppColors.softPurpleNormal,
        inactiveForegroundColor: AppColors.lightGreyNormal,
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      controller: controller.controller,
      tabs: _tabs(),
      navBarBuilder: (navBarConfig) =>
          Style1BottomNavBar(navBarConfig: navBarConfig, height: 60.h),
      onTabChanged: (index) {
        controller.changeCurrentIndex(index);
      },
    );
  }
}
