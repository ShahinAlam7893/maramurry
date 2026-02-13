import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maramurry/core/constants/app_colors.dart';
import 'package:maramurry/features/onboarding/presentation/screens/onboarding_screen_five.dart';
import 'package:maramurry/features/onboarding/presentation/screens/onboarding_screen_four.dart';
import 'package:maramurry/features/onboarding/presentation/screens/onboarding_screen_one.dart';
import 'package:maramurry/features/onboarding/presentation/screens/onboarding_screen_three.dart';
import 'package:maramurry/features/onboarding/presentation/screens/onboarding_screen_two.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingFlow extends StatefulWidget {
  const OnboardingFlow({super.key});

  @override
  State<OnboardingFlow> createState() => _OnboardingFlowState();
}

class _OnboardingFlowState extends State<OnboardingFlow> {
  late final PageController _pageCtrl;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageCtrl = PageController(initialPage: 0);
    _pageCtrl.addListener(_onPageChanged);
  }

  void _onPageChanged() {
    final newPage = _pageCtrl.page?.round() ?? 0;
    if (newPage != _currentPage) {
      setState(() => _currentPage = newPage);
    }
  }

  @override
  void dispose() {
    _pageCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Page View with individual screens
          PageView(
            controller: _pageCtrl,
            physics: const BouncingScrollPhysics(),
            children: const [
              OnboardingScreen1(),
              OnboardingScreenTwo(),
              OnboardingScreenThree(),
              OnboardingScreenFour(),
              OnboardingScreenFive(),
            ],
          ),
        ],
      ),
    );
  }
}