import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import '../../../utils/colorScheme.dart';
import '../../area/views/area_screen.dart';

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
    // Default to "Area" tab (index 3) since it's the only one built for now
    _controller = PersistentTabController(initialIndex: 3);
  }

  List<Widget> _buildScreens() {
    return [
      _buildDummyScreen("Home"),
      _buildDummyScreen("Riwayat"),
      _buildDummyScreen("Dashboard"), // Center Action Button
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
        activeColorPrimary: const Color(0xFF8B5E34),
        inactiveColorPrimary: const Color(0xFF555555),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.history),
        title: ("Riwayat"),
        activeColorPrimary: const Color(0xFF8B5E34),
        inactiveColorPrimary: const Color(0xFF555555),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.pie_chart, color: Colors.white),
        title: ("Dashboard"),
        activeColorPrimary: const Color(0xFF34A853), // Green Circle
        inactiveColorPrimary: const Color(0xFF34A853),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.eco),
        title: ("Area"),
        activeColorPrimary: const Color(0xFF8B5E34),
        inactiveColorPrimary: const Color(0xFF555555),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.person_outline),
        title: ("Profile"),
        activeColorPrimary: const Color(0xFF8B5E34),
        inactiveColorPrimary: const Color(0xFF555555),
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
      backgroundColor: const Color(0xFFF2EFEA),
      isVisible: true,
      confineToSafeArea: true,
      navBarStyle: NavBarStyle.style15, // Style 15 gives the center notch FAB
    );
  }
}
