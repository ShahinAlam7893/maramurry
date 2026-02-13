import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:maramurry/core/routes/shell_route.dart';
import 'package:maramurry/core/widgets/under_construction_screen.dart';
import 'package:maramurry/features/auth/presentation/screens/create_new_pass_screen.dart';
import 'package:maramurry/features/auth/presentation/screens/forgot_pass_screen.dart';
import 'package:maramurry/features/auth/presentation/screens/login_screen.dart';
import 'package:maramurry/features/auth/presentation/screens/otp_verification_screen.dart';
import 'package:maramurry/features/auth/presentation/screens/pass_cng_success_screen.dart';
import 'package:maramurry/features/auth/presentation/screens/permission_screen.dart';
import 'package:maramurry/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:maramurry/features/explore/data/inspiration_model.dart';
import 'package:maramurry/features/explore/presentation/screens/explore_detail_screen.dart';
import 'package:maramurry/features/explore/presentation/screens/explore_screen.dart';
import 'package:maramurry/features/home/presentation/screens/home_screen.dart';
import 'package:maramurry/features/onboarding/presentation/screens/onboarding_flow.dart';
import 'package:maramurry/features/onboarding/presentation/screens/onboarding_screen_five.dart';
import 'package:maramurry/features/onboarding/presentation/screens/onboarding_screen_four.dart';
import 'package:maramurry/features/onboarding/presentation/screens/onboarding_screen_one.dart';
import 'package:maramurry/features/onboarding/presentation/screens/onboarding_screen_three.dart';
import 'package:maramurry/features/onboarding/presentation/screens/onboarding_screen_two.dart';
import 'package:maramurry/features/onboarding/presentation/screens/splash_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

class RoutePaths {
  // Auth routes
  static const String splash = '/';
  static const String signUp = '/sign_up';
  static const String login = '/login';
  static const String permission = '/permission';
  static const String forgotPass = '/forgot_pass';
  static const String otpVerification = '/otp-verification';
  static const String createNewPass = '/create_new_pass';
  static const String passCngSuccess = '/pass_cng_success';

  // Onboarding routes
  static const String onboarding = '/onboarding';
  static const String onBoardingOne = '/onboarding_one';
  static const String onBoardingTwo = '/onboarding_two';
  static const String onBoardingThree = '/onboarding_three';
  static const String onBoardingFour = '/onboarding_four';
  static const String onBoardingFive = '/onboarding_five';

  // Dashboard routes (inside shell)
  static const String home = '/home';
  static const String explore = '/explore';
  static const String exploreDetail = '/explore_details';
  static const String schedule = '/schedule';
  static const String projects = '/projects';
  static const String profile = '/profile';
  static const String settings = '/settings';
  static const String newProject = '/new-project';
}

class AppRouter {
  static final router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: RoutePaths.splash,
    routes: [
      // ============ Auth Routes (Full Screen) ============
      GoRoute(
        path: RoutePaths.splash,
        builder: (context, state) => const SplashScreen(),
      ),

      // ============ Onboarding Routes ============
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

      // ============ Auth Routes ============
      GoRoute(
        path: RoutePaths.login,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: RoutePaths.signUp,
        builder: (context, state) => const SignUpScreen(),
      ),
      GoRoute(
        path: RoutePaths.permission,
        builder: (context, state) => const PermissionsSetupScreen(),
      ),
      GoRoute(
        path: RoutePaths.forgotPass,
        builder: (context, state) => ForgotPasswordScreen(),
      ),
      GoRoute(
        path: RoutePaths.otpVerification,
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>?;
          final email = extra?['email'] as String? ?? '';
          return OtpVerificationScreen(email: email);
        },
      ),
      GoRoute(
        path: RoutePaths.createNewPass,
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>?;
          final email = extra?['email'] as String? ?? '';
          return CreateNewPasswordScreen(email: email);
        },
      ),
      GoRoute(
        path: RoutePaths.passCngSuccess,
        builder: (context, state) => PasswordChangedSuccessScreen(),
      ),
      GoRoute(
  path: RoutePaths.exploreDetail,
  builder: (context, state) {
    final item = state.extra as InspirationModel;
    return ExploreDetailScreen(item: item);
  },
),

      // ============ Dashboard Routes (with Shell) ============
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) => AppShell(child: child),
        routes: [
          GoRoute(
            path: RoutePaths.home,
            builder: (context, state) => HomeScreen(),
          ),
          GoRoute(
            path: RoutePaths.explore,
            builder: (context, state) => const ExploreScreen(),
          ),
          GoRoute(
            path: RoutePaths.schedule,
            builder: (context, state) => const UnderConstructionScreen(
              title: 'Schedule',
              icon: Icons.calendar_month_rounded,
            ),
          ),
          GoRoute(
            path: RoutePaths.projects,
            builder: (context, state) => const UnderConstructionScreen(
              title: 'My Projects',
              icon: Icons.folder_rounded,
            ),
          ),
          GoRoute(
            path: RoutePaths.profile,
            builder: (context, state) => const UnderConstructionScreen(
              title: 'Profile',
              icon: Icons.person_rounded,
            ),
          ),
          GoRoute(
            path: RoutePaths.settings,
            builder: (context, state) => const UnderConstructionScreen(
              title: 'Settings',
              icon: Icons.settings_rounded,
            ),
          ),
          GoRoute(
            path: RoutePaths.newProject,
            builder: (context, state) => const UnderConstructionScreen(
              title: 'New Project',
              icon: Icons.add_circle_rounded,
            ),
          ),
        ],
      ),
    ],

    redirect: (context, state) {
      // Add your auth logic here
      return null;
    },
  );
}


// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:maramurry/features/auth/presentation/screens/create_new_pass_screen.dart';
// import 'package:maramurry/features/auth/presentation/screens/forgot_pass_screen.dart';
// import 'package:maramurry/features/auth/presentation/screens/login_screen.dart';
// import 'package:maramurry/features/auth/presentation/screens/otp_verification_screen.dart';
// import 'package:maramurry/features/auth/presentation/screens/pass_cng_success_screen.dart';
// import 'package:maramurry/features/auth/presentation/screens/permission_screen.dart';
// import 'package:maramurry/features/auth/presentation/screens/sign_up_screen.dart';
// import 'package:maramurry/features/onboarding/presentation/screens/onboarding_flow.dart';
// import 'package:maramurry/features/onboarding/presentation/screens/onboarding_screen_five.dart';
// import 'package:maramurry/features/onboarding/presentation/screens/onboarding_screen_four.dart';
// import 'package:maramurry/features/onboarding/presentation/screens/onboarding_screen_one.dart';
// import 'package:maramurry/features/onboarding/presentation/screens/onboarding_screen_three.dart';
// import 'package:maramurry/features/onboarding/presentation/screens/onboarding_screen_two.dart';
// import 'package:maramurry/features/onboarding/presentation/screens/splash_screen.dart';

// final _rootNavigatorKey = GlobalKey<NavigatorState>();

// class RoutePaths {
//   static const String onBoardingOne = '/onboarding_one';
//   static const String onBoardingTwo = '/onboarding_two';
//   static const String onBoardingThree = '/onboarding_three';
//   static const String onBoardingFour = '/onboarding_four';
//   static const String onBoardingFive = '/onboarding_five';
//   static const String onboarding = '/onboarding';
//   static const String signUp = '/sign_up';
//   static const String login = '/login';
//   static const String permission = '/permission';
//   static const String forgotPass = '/forgot_pass';
//   static const String otpVerification = '/otp-verification';
//   static const String createNewPass = '/create_new_pass';
//   static const String passCngSuccess = '/pass_cng_success';
// }

// class AppRouter {
//   static final router = GoRouter(
//     navigatorKey: _rootNavigatorKey,
//     initialLocation: '/',
//     routes: [
//       GoRoute(path: '/', builder: (context, state) => const SplashScreen()),
//       GoRoute(
//         path: RoutePaths.onboarding,
//         builder: (context, state) => const OnboardingFlow(),
//       ),
//       GoRoute(
//         path: RoutePaths.onBoardingOne,
//         builder: (context, state) => const OnboardingScreen1(),
//       ),
//       GoRoute(
//         path: RoutePaths.onBoardingTwo,
//         builder: (context, state) => const OnboardingScreenTwo(),
//       ),
//       GoRoute(
//         path: RoutePaths.onBoardingThree,
//         builder: (context, state) => const OnboardingScreenThree(),
//       ),
//       GoRoute(
//         path: RoutePaths.onBoardingFour,
//         builder: (context, state) => const OnboardingScreenFour(),
//       ),
//       GoRoute(
//         path: RoutePaths.onBoardingFive,
//         builder: (context, state) => const OnboardingScreenFive(),
//       ),
//       GoRoute(
//         path: RoutePaths.signUp,
//         builder: (context, state) => const SignUpScreen(),
//       ),
//       GoRoute(
//         path: RoutePaths.login,
//         name: RoutePaths.login,
//         builder: (context, state) => const LoginScreen(),
//       ),
//       GoRoute(
//         path: RoutePaths.permission,
//         builder: (context, state) => const PermissionsSetupScreen(),
//       ),
//       GoRoute(
//         path: RoutePaths.forgotPass,
//         name: RoutePaths.forgotPass,
//         builder: (context, state) => ForgotPasswordScreen(),
//       ),
      
//       GoRoute(
//         path: RoutePaths.otpVerification,
//         name: RoutePaths.otpVerification,
//         builder: (context, state) {
//           final extra = state.extra as Map<String, dynamic>?;
//           final email = extra?['email'] as String? ?? '';
//           return OtpVerificationScreen(email: email);
//         },
//       ),
//       GoRoute(path: RoutePaths.createNewPass,
//         builder: (context, state) {
//           final extra = state.extra as Map<String, dynamic>?;
//           final email = extra?['email'] as String? ?? '';
//           return CreateNewPasswordScreen(email: email);
//         },
//       ),
//       GoRoute(
//         path: RoutePaths.passCngSuccess,
//         name: RoutePaths.passCngSuccess,
//         builder: (context, state) => PasswordChangedSuccessScreen(),
//       ),
//     ],
//     redirect: (context, state) {
//       return null;
//     },
//   );
// }
