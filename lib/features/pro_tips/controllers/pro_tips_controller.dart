import 'package:get/get.dart';

class ProTipsItem {
  final String title;
  final String iconColor;
  final List<String> tips;
  final RxBool isExpanded;

  ProTipsItem({
    required this.title,
    required this.iconColor,
    required this.tips,
    required this.isExpanded,
  });
}

class ProTipsController extends GetxController {
  late List<ProTipsItem> items;

  @override
  void onInit() {
    super.onInit();
    _initializeItems();
  }

  void _initializeItems() {
    items = [
      ProTipsItem(
        title: 'Interview Preparation',
        iconColor: '0xFFF3F3FE',
        tips: [
          'Research the company thoroughly - mission, values, recent news',
          'Prepare 5-7 STAR stones that demonstrate your key skills',
          'Practice answers out loud, not just in your head',
          'Prepare thoughtful questions to ask the interviewer',
          'Review the job description and match your experience',
          'Research the interviewer on LinkedIn if possible',
          'Prepare your workspace for video interviews',
          'Test your tech setup 30 minutes before virtual interviews',
        ],
        isExpanded: false.obs,
      ),
      ProTipsItem(
        title: 'During the interview',
        iconColor: '0xFFF6F2FE',
        tips: [
          'Listen carefully to the full question before answering',
          'Take 3-5 seconds to think before responding',
          'Use specific examples with measurable outcomes',
          'Ask clarifying questions if needed',
          'Show enthusiasm and genuine Interest',
          'Build rapport by finding common ground',
          'Take brief notes if discussing complex topics',
          'Watch for interviewer cues and adjust your approach',
        ],
        isExpanded: false.obs,
      ),
      ProTipsItem(
        title: 'Technical Interviews',
        iconColor: '0xFFFEF1F7',
        tips: [
          'Think out loud to show your problem-solving process',
          'Ask about edge cases and constraints upfront',
          'Start with a brute force solution, then optimize',
          'Test your code with examples before claiming it\'s done',
          'Explain time and space complexity clearly',
          'Handle error cases and edge conditions',
          'Write clean, readable code with good variable names',
          'Be ready to defend your design choices',
        ],
        isExpanded: false.obs,
      ),
      ProTipsItem(
        title: 'Body Language & Presence',
        iconColor: '0xFFFEF7EC',
        tips: [
          'Maintain good eye contact (70-80% of the time)',
          'Sit up straight with open, confident posture',
          'Smile naturally and show enthusiasm',
          'Avoid fidgeting or distracting movements',
          'Use hand gestures purposefully to emphasize points',
          'Mirror the interviewer energy level subtly',
          'Keep your hands visible (shows openness)',
          'Nod to show you are listening and engaged',
        ],
        isExpanded: false.obs,
      ),
      ProTipsItem(
        title: 'Behavioral Questions',
        iconColor: '0xFFECFAF5',
        tips: [
          'Use the STAR method: Situation, Task, Action, Result',
          'Focus on YOUR actions and contributions',
          'Include measurable results (percentages, money, time saved)',
          'Show what you learned from challenges',
          'Be honest about failures but focus on growth',
          'Keep answers to 2-3 minutes maximum',
          'Tailor examples to the role you are applying for',
          'Practice 3 variations of each story',
        ],
        isExpanded: false.obs,
      ),
      ProTipsItem(
        title: 'Virtual Interviews',
        iconColor: '0xFFF0F5FE',
        tips: [
          'Test your camera, microphone, and internet 1 hour before',
          'Position camera at eye level for natural angle',
          'Use good lighting - face a window or use a ring light',
          'Choose a clean, professional background',
          'Close unnecessary apps and silence notifications',
          'Have a glass of water nearby',
          'Keep your resume and notes off-camera but handy',
          'Look at the camera, not your own video',
        ],
        isExpanded: false.obs,
      ),
      ProTipsItem(
        title: 'Salary Negotiation',
        iconColor: '0xFFEDF9F8',
        tips: [
          'Research market rates on Glassdoor and Levels.fyi',
          'Wait for them to mention salary first if possible',
          'Provide a range, not a single number',
          'Consider the total compensation package, not just base',
          'Be prepared to justify your ask with data',
          'Do not accept the first offer immediately',
          'Ask for time to consider if needed',
          'Get everything in writing before accepting',
        ],
        isExpanded: false.obs,
      ),
      ProTipsItem(
        title: 'Follow-Up & Thank You',
        iconColor: '0xFFFEF0F0',
        tips: [
          'Send thank-you email within 24 hours',
          'Reference 2-3 specific points from your conversation',
          'Reiterate your interest and fit for the role',
          'Keep it concise (3-4 paragraphs maximum)',
          'Proofread carefully before sending',
          'Send individual emails if you met multiple people',
          'Include any information you promised to provide',
          'Follow up after 5-7 days if no response',
        ],
        isExpanded: false.obs,
      ),
      ProTipsItem(
        title: 'Common Mistakes to Avoid',
        iconColor: '0xFFFFF4ED',
        tips: [
          'Do not speak negatively about former employers',
          'Avoid rambling - keep answers focused and concise',
          'Do not claim to have no weaknesses',
          'Avoid checking your phone during the interview',
          'Do not lie or exaggerate your experience',
          'Avoid interrupting the interviewer',
          'Do not focus only on what YOU want from the job',
          'Avoid asking about salary/benefits in first interview',
        ],
        isExpanded: false.obs,
      ),
    ];
  }

  void toggleExpanded(int index) {
    items[index].isExpanded.toggle();
  }

  void closeAll() {
    for (var item in items) {
      item.isExpanded.value = false;
    }
  }
}
