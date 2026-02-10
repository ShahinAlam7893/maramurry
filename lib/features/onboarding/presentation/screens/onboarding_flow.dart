import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maramurry/core/constants/app_colors.dart';
import 'package:maramurry/core/widgets/app_button.dart';
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
  late final PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    _pageController.addListener(() {
      final newPage = _pageController.page?.round() ?? 0;
      if (newPage != _currentPage) {
        setState(() => _currentPage = newPage);
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentPage < 4) {
      _pageController.animateToPage(
        _currentPage + 1,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOutCubic,
      );
    } else {
      // Last page → go to sign up / home / login
      // context.go(RoutePaths.signUp); // ← change to your desired route
    }
  }

  void _skip() {
    // context.go(RoutePaths.signUp); // or RoutePaths.login
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          PageView(
            controller: _pageController,
            physics: const BouncingScrollPhysics(),
            children: const [
              OnboardingScreen1(),
              OnboardingScreenTwo(),
              OnboardingScreenThree(),
              OnboardingScreenFour(),
              OnboardingScreenFive(),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.fromLTRB(32.w, 0, 32.w, 32.h),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Smooth animated dots
                    SmoothPageIndicator(
                      controller: _pageController,
                      count: 5,
                      effect: WormEffect(
                        dotHeight: 10.h,
                        dotWidth: 10.w,
                        spacing: 12.w,
                        activeDotColor: AppColors.primary, // your active color
                        dotColor: AppColors.divider ?? Colors.grey.shade300,
                        strokeWidth: 1.2,
                      ),
                    ),

                    SizedBox(height: 16.h),

                    // "Skip" or "Get Started / Log In" depending on page
                    if (_currentPage < 4)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: _skip,
                            child: Text(
                              "Skip",
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: AppColors.textSecondary,
                              ),
                            ),
                          ),
                          AppButton(
                            label: "Next",
                            onPressed: _nextPage,
                            type: ButtonType.primary,
                          ),
                        ],
                      )
                    else
                      // Last page (screen 5) → show your original buttons
                      Column(
                        children: [
                          AppButton(
                            label: 'Get Started',
                            onPressed: () {
                              // context.go(RoutePaths.signUp); // or home
                            },
                            type: ButtonType.primary,
                          ),
                          SizedBox(height: 16.h),
                          AppButton(
                            label: 'Log In',
                            onPressed: () {
                              // context.go(RoutePaths.login);
                            },
                            type: ButtonType.outlined,
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
