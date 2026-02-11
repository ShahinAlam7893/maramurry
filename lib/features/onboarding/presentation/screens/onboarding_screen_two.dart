import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:maramurry/core/constants/app_assets.dart';
import 'package:maramurry/core/constants/app_colors.dart';
import 'package:maramurry/core/routes/app_router.dart';
import 'package:maramurry/core/widgets/app_button.dart';

class OnboardingScreenTwo extends StatefulWidget {
  const OnboardingScreenTwo({super.key});

  @override
  State<OnboardingScreenTwo> createState() => _OnboardingScreenTwoState();
}

class _OnboardingScreenTwoState extends State<OnboardingScreenTwo>
    with SingleTickerProviderStateMixin {
  late AnimationController _dotController;
  late List<Animation<double>> _dotAnimations;

  @override
  void initState() {
    super.initState();

    _dotController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    )..repeat(reverse: true);

    _dotAnimations = List.generate(4, (index) {
      return Tween<double>(begin: 0.4, end: 1.0).animate(
        CurvedAnimation(
          parent: _dotController,
          curve: Interval(
            index * 0.2,
            (index + 1) * 0.2,
            curve: Curves.easeInOut,
          ),
        ),
      );
    });

    _dotController.forward();
  }

  @override
  void dispose() {
    _dotController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            AppAssets.onboarding2,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),

          SafeArea(
            bottom: false,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 50.h),
                  Text(
                    "Smart Plant\nRecommendations",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryDark,
                      height: 1.2,
                    ),
                  ),

                  SizedBox(height: 16.h),

                  Text(
                    "Our AI analyzes your location, sunlight, soil type, and climate to suggest the perfect plants for your space.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: AppColors.grey,
                      height: 1.4,
                    ),
                  ),

                  SizedBox(height: 40.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(4, (index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6.w),
                        child: AnimatedBuilder(
                          animation: _dotAnimations[index],
                          builder: (context, child) {
                            final isActive = index == 0;
                            return Container(
                              width: 12.w,
                              height: 12.h,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: isActive
                                    ? AppColors.primaryDark
                                    : Colors.white.withOpacity(0.4),
                              ),
                              child: isActive
                                  ? ScaleTransition(
                                      scale: _dotAnimations[index],
                                      child: child,
                                    )
                                  : null,
                            );
                          },
                          child: const SizedBox(),
                        ),
                      );
                    }),
                  ),

                  SizedBox(height: 8.h),

                  Text(
                    "1 of 4",
                    style: TextStyle(fontSize: 14.sp, color: Colors.white70),
                  ),

                  TextButton(
                    onPressed: () {
                      context.go(RoutePaths.login);
                    },
                    child: Text(
                      "Skip",
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: AppColors.deepGreen,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  AppButton(
                    label: "Next",
                    onPressed: () {
                      context.push(RoutePaths.onBoardingThree);
                    },
                  ),
                  SizedBox(height: 50.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
