import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:maramurry/core/constants/app_assets.dart';
import 'package:maramurry/core/constants/app_colors.dart';
import 'package:maramurry/core/routes/app_router.dart';
import 'package:maramurry/core/widgets/app_button.dart';
import 'package:maramurry/core/widgets/app_text_field.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});

  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            AppAssets.forgetPassBG,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),

          SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 32.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 140.h),

                  // Title
                  Text(
                    "Forgot Password?",
                    style: TextStyle(
                      fontSize: 32.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.green,
                    ),
                  ),

                  SizedBox(height: 14.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Text(
                      "No worries! Enter your email and we'll send you reset instructions.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: AppColors.textSecondary,
                        height: 1.45,
                      ),
                    ),
                  ),

                  SizedBox(height: 40.h),

                  // Email field (using your reusable widget)
                  buildTextField(
                    label: "Email Address",
                    hint: "your@email.com",
                    prefixIcon: Icons.email_outlined,
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailController,
                  ),

                  SizedBox(height: 12.h),

                  // Helper text
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "We'll send a OTP to reset your password",
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: AppColors.textHint,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),

                  SizedBox(height: 40.h),

                  // Send Reset OTP Button
                  AppButton(
                    label: "Send Reset OTP",
                    onPressed: () {
                      final email = _emailController.text.trim();

                      if (email.isEmpty) {
                        _showSnackBar(context, "Please enter your email");
                        return;
                      }

                      if (!email.contains('@') || !email.contains('.')) {
                        _showSnackBar(context, "Please enter a valid email");
                        return;
                      }

                      context.pushNamed(RoutePaths.otpVerification, extra: {'email': email});
                    },
                  ),

                  SizedBox(height: 32.h),

                  // Remember password? Log In link
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Remember your password? ",
                        style: TextStyle(
                          fontSize: 15.sp,
                          color: AppColors.textSecondary,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          context.push(RoutePaths.login);
                        },
                        child: Text(
                          "Log In",
                          style: TextStyle(
                            fontSize: 15.sp,
                            color: AppColors.primary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 60.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(milliseconds: 2000),
      ),
    );
  }
}