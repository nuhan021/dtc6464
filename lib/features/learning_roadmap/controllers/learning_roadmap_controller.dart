import 'package:get/get.dart';

class WeekPlan {
  final int weekNumber;
  final String title;
  final double progress;
  final int progressPercent;
  final List<String> tags;
  final String weekLabel;

  WeekPlan({
    required this.weekNumber,
    required this.title,
    required this.progress,
    required this.progressPercent,
    required this.tags,
    required this.weekLabel,
  });
}

class LearningRoadmapController extends GetxController {
  final overallProgress = 0.44.obs;
  final motivationalMessage = 'Keep going! you\'re doing great'.obs;

  late List<WeekPlan> weekPlans;

  @override
  void onInit() {
    super.onInit();
    _initializeWeekPlans();
  }

  void _initializeWeekPlans() {
    weekPlans = [
      WeekPlan(
        weekNumber: 1,
        title: 'Behavioral Skills Foundation',
        progress: 0.85,
        progressPercent: 85,
        weekLabel: 'week 1',
        tags: [
          'Master STAR Method',
          'Leadership Examples',
          'Conflict Resolution',
          'Team Collaboration',
          'Problem-Solving Stories',
        ],
      ),
      WeekPlan(
        weekNumber: 2,
        title: 'Technical Fundamentals',
        progress: 0.60,
        progressPercent: 60,
        weekLabel: 'week 2',
        tags: [
          'Data Structures',
          'Algorithms & Big O',
          'System Design Basics',
          'Code Optimization',
          'Debugging Techniques',
        ],
      ),
      WeekPlan(
        weekNumber: 3,
        title: 'Company Research & Culture',
        progress: 0.30,
        progressPercent: 30,
        weekLabel: 'week 3',
        tags: [
          'Company Values Research',
          'Recent News & Projects',
          'Team Culture Fit',
          'Industry Trends',
          'Competitive Analysis',
        ],
      ),
      WeekPlan(
        weekNumber: 4,
        title: 'Mock Interviews & Polish',
        progress: 0.15,
        progressPercent: 15,
        weekLabel: 'week 4',
        tags: [
          'Full Interview Simulation',
          'Feedback Implementation',
          'Answer Refinement',
          'Body Language Practice',
          'Follow-up Strategies',
        ],
      ),
      WeekPlan(
        weekNumber: 5,
        title: 'Advanced Topics',
        progress: 0.0,
        progressPercent: 0,
        weekLabel: 'week 1',
        tags: [
          'Salary Negotiation',
          'Benefits Discussion',
          'Offer Evaluation',
          'Counter-offers Strategy',
          'Decision Framework',
        ],
      ),
    ];
  }

  int get overallProgressPercent => (overallProgress.value * 100).toInt();
}
