import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:maramurry/features/auth/presentation/screens/create_new_pass_screen.dart';
import 'package:maramurry/features/auth/presentation/screens/forgot_pass_screen.dart';
import 'package:maramurry/features/auth/presentation/screens/login_screen.dart';
import 'package:maramurry/features/auth/presentation/screens/otp_verification_screen.dart';
import 'package:maramurry/features/auth/presentation/screens/pass_cng_success_screen.dart';
import 'package:maramurry/features/auth/presentation/screens/permission_screen.dart';
import 'package:maramurry/features/auth/presentation/screens/sign_up_screen.dart';
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
  static const String signUp = '/sign_up';
  static const String login = '/login';
  static const String permission = '/permission';
  static const String forgotPass = '/forgot_pass';
  static const String otpVerification = '/otp-verification';
  static const String createNewPass = '/create_new_pass';
  static const String passCngSuccess = '/pass_cng_success';
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
      GoRoute(
        path: RoutePaths.signUp,
        builder: (context, state) => const SignUpScreen(),
      ),
      GoRoute(
        path: RoutePaths.login,
        name: RoutePaths.login,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: RoutePaths.permission,
        builder: (context, state) => const PermissionsSetupScreen(),
      ),
      GoRoute(
        path: RoutePaths.forgotPass,
        name: RoutePaths.forgotPass,
        builder: (context, state) => ForgotPasswordScreen(),
      ),
      
      GoRoute(
        path: RoutePaths.otpVerification,
        name: RoutePaths.otpVerification,
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>?;
          final email = extra?['email'] as String? ?? '';
          return OtpVerificationScreen(email: email);
        },
      ),
      GoRoute(path: RoutePaths.createNewPass,
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>?;
          final email = extra?['email'] as String? ?? '';
          return CreateNewPasswordScreen(email: email);
        },
      ),
      GoRoute(
        path: RoutePaths.passCngSuccess,
        name: RoutePaths.passCngSuccess,
        builder: (context, state) => PasswordChangedSuccessScreen(),
      ),
    ],
    redirect: (context, state) {
      return null;
    },
  );
}
