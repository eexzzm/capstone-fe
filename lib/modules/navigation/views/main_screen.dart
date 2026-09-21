import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import '../../../utils/colorScheme.dart';
import '../../area/views/area_screen.dart';
import '../../monitoring/views/dashboard_screen.dart';
import '../../riwayat/views/riwayat_screen.dart';

class MainScreen extends StatefulWidget {
  static const routeName = '/main';

  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    // Default to "Dashboard" tab (index 2)
    _controller = PersistentTabController(initialIndex: 2);
  }

  List<Widget> _buildScreens() {
    return [
      _buildDummyScreen("Home"),
      const RiwayatScreen(),
      const DashboardScreen(), // Center Action Button
      const AreaScreen(), // The actual Area screen
      _buildDummyScreen("Profile"),
    ];
  }

  Widget _buildDummyScreen(String title) {
    return Scaffold(
      backgroundColor: AppColors.backgroundCanvas,
      body: Center(
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
      ),
    );
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home_outlined),
        title: ("Home"),
        activeColorPrimary: AppColors.navSelected,
        inactiveColorPrimary: AppColors.navUnselected,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.history),
        title: ("Riwayat"),
        activeColorPrimary: AppColors.navSelected,
        inactiveColorPrimary: AppColors.navUnselected,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.pie_chart, color: Colors.white),
        title: ("Dashboard"),
        activeColorPrimary: AppColors.accentGreen, // Green Circle
        inactiveColorPrimary: AppColors.accentGreen,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.eco),
        title: ("Area"),
        activeColorPrimary: AppColors.navSelected,
        inactiveColorPrimary: AppColors.navUnselected,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.person_outline),
        title: ("Profile"),
        activeColorPrimary: AppColors.navSelected,
        inactiveColorPrimary: AppColors.navUnselected,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardAppears: true,
      padding: const EdgeInsets.only(top: 8),
      backgroundColor: AppColors.bottomNavBg,
      isVisible: true,
      confineToSafeArea: true,
      navBarStyle: NavBarStyle.style15, // Style 15 gives the center notch FAB
    );
  }
}
