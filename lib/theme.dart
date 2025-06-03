import 'package:flutter/material.dart';

// Unified color palette
class AppColors {
  static const primary = Color(0xFF1565C0); // Blue
  static const secondary = Color(0xFF00B8D4); // Cyan
  static const background = Color(0xFFF7FAFC); // Light background
  static const card = Colors.white;
  static const cardShadow = Color(0x1A000000); // 10% black
  static const textPrimary = Color(0xFF222B45);
  static const textSecondary = Color(0xFF6B7280);
  static const accent = Color(0xFF1565C0);
  static const icon = Color(0xFF1565C0);
  static const divider = Color(0xFFE0E0E0);
}

// Unified card style
class AppCardStyle {
  static const double elevation = 3;
  static final shape = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(16),
  );
  static const EdgeInsets padding = EdgeInsets.all(24.0);
}

// Unified text styles
class AppTextStyles {
  static const sectionTitle = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );
  static const cardTitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );
  static const cardSubtitle = TextStyle(
    fontSize: 15,
    color: AppColors.textSecondary,
  );
  static const cardPeriod = TextStyle(
    fontSize: 13,
    color: AppColors.textSecondary,
  );
  static const body = TextStyle(fontSize: 16, color: AppColors.textPrimary);
  static const contact = TextStyle(
    fontSize: 16,
    color: AppColors.textPrimary,
    fontWeight: FontWeight.w500,
  );
}
