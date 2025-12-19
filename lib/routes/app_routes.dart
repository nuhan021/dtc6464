import 'package:get/get.dart';

import '../features/collect_info/views/screens/ai_breaf.dart';
import '../features/collect_info/views/screens/collect_info_screen.dart';
import '../features/collect_info/views/screens/profile_analyzing.dart';
import '../features/onboarding/views/screens/onboarding_1.dart';
import '../features/onboarding/views/screens/onboarding_2.dart';
import '../features/splash/view/screen/splash_screen.dart';
class AppRoute {
  static String splashScreen = "/splashScreen";
  static String onboardingScreen1 = "/onboardingScreen1";
  static String onboardingScreen2 = "/onboardingScreen2";
  static String collectInfoScreen = "/collectInfoScreen";
  static String profileAnalyzingScreen = "/profileAnalyzingScreen";
  static String aiBriefScreen = "/aiBriefScreen";

  static String getSplashScreen() => splashScreen;
  static String getOnboardingScreen1() => onboardingScreen1;
  static String getOnboardingScreen2() => onboardingScreen2;
  static String getCollectInfoScreen() => collectInfoScreen;
  static String getProfileAnalyzingScreen() => profileAnalyzingScreen;
  static String getAiBriefScreen() => aiBriefScreen;



  static List<GetPage> routes = [
    GetPage(name: splashScreen, page: () => const SplashScreen()),
    GetPage(name: onboardingScreen1, page: () => Onboarding1()),
    GetPage(name: onboardingScreen2, page: () => Onboarding2()),
    GetPage(name: collectInfoScreen, page: () => CollectInfoScreen()),
    GetPage(name: profileAnalyzingScreen, page: () => ProfileAnalyzing()),
    GetPage(name: aiBriefScreen, page: () => const AiBrief()),
  ];
}
