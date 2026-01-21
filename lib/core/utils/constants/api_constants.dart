class ApiConstant {
  ApiConstant._();

  // base url
  static const String baseUrl = 'https://dtc4646-server.onrender.com/api/v1';
  static const String imgBaseUrl = 'https://dtc4646-server.onrender.com';

  // analyze
  static const String analyze = '/public/analyze';

  // authentication
  static const String token = '/auth/refresh';
  static const String login = '/auth/login';

  // avatar
  static const String avatar = '/user/all-profile-pictures';

  // user
  static const String profileUpdate = '/user/profile-update';

  // tips
  static const String todayTips = '/tips/daily-tips';
  static const String proTips = '/tips/pro-tips';

  // interview
  static const String addInterview = '/interview/plan';
  static const String interviewsPlans = '/interview/plans';
}