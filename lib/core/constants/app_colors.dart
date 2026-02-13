import 'package:flutter/material.dart';

class AppColors {
  // Primary brand (greens)
  static const Color primary = Color(0xFF2E7D32); // main buttons
  static const Color primaryLight = Color(0xFF66BB6A);
  static const Color primaryDark = Color(0xFF1B5E20);

  // Accents
  static const Color accent = Color(0xFF4CAF50);
  static const Color success = Color(0xFF66BB6A);
  static const Color warning = Color(0xFFFFCA28);
  static const Color error = Color(0xFFE53935);

  // Backgrounds & surfaces
  static const Color background = Color(0xFFF8FAFC); // very light gray-greenish
  static const Color surface = Colors.white;
  static const Color surfaceVariant = Color(0xFFF1F5F9);
  static const Color cardShadow = Color(0x1A000000); // soft black shadow

  // Text
  static const Color textPrimary = Color(0xFF0F172A);
  static const Color textSecondary = Color(0xFF475569);
  static const Color textHint = Color(0xFF94A3B8);
  static const Color textDisabled = Color(0xFFCBD5E1);

  // Others from your designs
  static const Color divider = Color(0xFFE2E8F0);
  static const Color border = Color(0xFFCBD5E1);
  static const Color white = Color(0xFFFFFFFF);
  static const Color green = Color(0xFF1B5E20);
  static const Color deepGreen = Color(0xFF1F2D16);
  static const Color seconderyGreen = Color(0xFF7E876F);
  static const Color grey = Color(0xFF616161);
  static const Color black = Color(0xFF101828);

  static const Color blueAccent   = Color(0xFF3B82F6);
static const Color orangeAccent = Color(0xFFF59E0B);
static const Color greenAccent  = Color(0xFF10B981);

static const Color homeGradientStart = Color(0xFFEFE7DB);
  static const Color homeGradientEnd = Color(0xFFD6E0CF);

static const LinearGradient BackgroundGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFFEFE7DB),
      Color(0xFFD6E0CF),
    ],
  );

}
