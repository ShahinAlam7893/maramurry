import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:maramurry/core/constants/app_assets.dart';
import 'package:maramurry/core/routes/app_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animController;
  late Animation<double> _scale;
  late Animation<double> _fade;

  @override
  void initState() {
    super.initState();

    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    );

    _scale = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animController, curve: Curves.easeOutBack),
    );

    _fade = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animController, curve: const Interval(0.4, 1.0)),
    );

    _animController.forward();

    // Navigate to onboarding after 3 seconds
    Timer(const Duration(seconds: 3), () {
      if (mounted) context.go(RoutePaths.onboarding);
    });
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background SVG
          SvgPicture.asset(
            AppAssets.onboarding1,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),

          // Dark overlay
          Container(
            color: Colors.black.withOpacity(0.35),
          ),

          // Content
          SafeArea(
            child: Center(
              child: ScaleTransition(
                scale: _scale,
                child: FadeTransition(
                  opacity: _fade,
                  child: SvgPicture.asset(
                    AppAssets.logo,
                    width: 180.w,
                    height: 180.h,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}