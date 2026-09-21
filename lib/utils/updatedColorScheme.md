***

# Global Design System & Unified Color Palette (TaniPintar App)

Dokumen ini menggabungkan dan mensinkronkan seluruh **Color Scheme / Design Tokens** dari 3 halaman aplikasi TaniPintar (**Daftar Akun Baru**, **Dashboard**, dan **Daftar Area**)[cite: 1, 2, 3] agar dapat dibuat sebagai `ThemeData` terpusat di Flutter/Dart.

---

## 1. Unified Color Scheme (Tokens)

```dart
import 'package:flutter/material.dart';

class AppColors {
  // Brand & Primary Colors
  static const Color primaryDark = Color(0xFF1B5E20);      // Dark Forest Green (Auth Header & Primary Text)[cite: 1]
  static const Color primaryMedium = Color(0xFF3B9E59);    // Medium Leaf Green (Buttons & Active Chips)[cite: 3]
  static const Color primaryVibrant = Color(0xFF34A853);   // Vibrant Green (FAB & Active Accents)[cite: 2]
  static const Color primaryLight = Color(0xFFE8F5E9);     // Soft Mint Tint (Badges, Card Backgrounds)[cite: 1, 2]

  // Neutral & Canvas Backgrounds
  static const Color backgroundCanvas = Color(0xFFFFFFFF); // Pure White Canvas[cite: 2, 3]
  static const Color backgroundOffWhite = Color(0xFFF8F9FA);// Soft Off-White (Auth Scaffold)[cite: 1]
  static const Color backgroundInput = Color(0xFFFAFAFA);   // Input Field Fill[cite: 1]
  static const Color navBarBackground = Color(0xFFF2EFEA);  // Warm Beige/Off-White (Bottom Nav)[cite: 2, 3]

  // Typography / Text Colors
  static const Color textPrimary = Color(0xFF1E1E1E);      // Dark Charcoal (Headings & Dark Titles)[cite: 2, 3]
  static const Color textSecondary = Color(0xFF555555);    // Medium Gray (Subtitles & Labels)[cite: 1, 2, 3]
  static const Color textHint = Color(0xFF9E9E9E);         // Light Gray (Placeholders)[cite: 1]
  static const Color textOnPrimary = Color(0xFFFFFFFF);    // White Text (On Green Buttons/Badges)[cite: 1, 3]
  static const Color textNavInactive = Color(0xFFB0BEC5);  // Muted Silver Gray[cite: 2]

  // Semantic & Status Colors
  static const Color statusDanger = Color(0xFFFF3B30);     // Red Badge (Bahaya / Critical)[cite: 2]
  static const Color statusWarning = Color(0xFFFFE600);    // Yellow Badge (Waspada / Alert)[cite: 2]
  static const Color statusSuccess = Color(0xFF34A853);    // Green Indicator/Check Icon[cite: 3]

  // Borders & Dividers
  static const Color borderLight = Color(0xFFEEEEEE);      // Divider & Card Border[cite: 2, 3]
  static const Color borderInput = Color(0xFFE0E0E0);      // Input Outline Border[cite: 1]
}