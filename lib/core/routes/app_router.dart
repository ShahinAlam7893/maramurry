import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:maramurry/features/onboarding/presentation/screens/onboarding_flow.dart';
import 'package:maramurry/features/onboarding/presentation/screens/onboarding_screen_five.dart';
import 'package:maramurry/features/onboarding/presentation/screens/onboarding_screen_four.dart';
import 'package:maramurry/features/onboarding/presentation/screens/onboarding_screen_one.dart';
import 'package:maramurry/features/onboarding/presentation/screens/onboarding_screen_three.dart';
import 'package:maramurry/features/onboarding/presentation/screens/onboarding_screen_two.dart';
import 'package:maramurry/features/onboarding/presentation/screens/splash_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

class RoutePaths {
  static const String onBoardingOne = '/onboarding_one';
  static const String onBoardingTwo = '/onboarding_two';
  static const String onBoardingThree = '/onboarding_three';
  static const String onBoardingFour = '/onboarding_four';
  static const String onBoardingFive = '/onboarding_five';
  static const String onboarding = '/onboarding';
}

class AppRouter {
  static final router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/',
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SplashScreen()),
      GoRoute(
  path: RoutePaths.onboarding, 
  builder: (context, state) => const OnboardingFlow(),
),
      GoRoute(
        path: RoutePaths.onBoardingOne,
        builder: (context, state) => const OnboardingScreen1(),
      ),
      GoRoute(
        path: RoutePaths.onBoardingTwo,
        builder: (context, state) => const OnboardingScreenTwo(),
      ),
      GoRoute(
        path: RoutePaths.onBoardingThree,
        builder: (context, state) => const OnboardingScreenThree(),
      ),
      GoRoute(
        path: RoutePaths.onBoardingFour,
        builder: (context, state) => const OnboardingScreenFour(),
      ),
      GoRoute(
        path: RoutePaths.onBoardingFive,
        builder: (context, state) => const OnboardingScreenFive(),
      ),
    ],
    redirect: (context, state) {
      // Auth guard logic will be added later
      return null;
    },
  );
}
