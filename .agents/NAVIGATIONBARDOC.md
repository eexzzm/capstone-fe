# persistent_bottom_nav_bar

## Getting Started

In your Flutter project, add the dependency:

```yaml
dependencies:
  persistent_bottom_nav_bar: any
```

Import the package:

```dart
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
```

Persistent bottom navigation bar uses `PersistentTabController` as its controller. Here is how to declare it:

```dart
PersistentTabController _controller;

_controller = PersistentTabController(initialIndex: 0);
```

The main widget to declare is `PersistentTabView`.

> **NOTE:** This widget includes a **Scaffold** (based on `CupertinoTabScaffold`), so there's no need to declare one yourself.

Here is an example for demonstration purposes:

```dart
class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        handleAndroidBackButtonPress: true, // Default is true.
        resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen on a non-scrollable screen when keyboard appears. Default is true.
        stateManagement: true, // Default is true.
        hideNavigationBarWhenKeyboardAppears: true,
        popBehaviorOnSelectedNavBarItemPress: PopActionScreensType.all,
        padding: const EdgeInsets.only(top: 8),
        backgroundColor: Colors.grey.shade900,
        isVisible: true,
        animationSettings: const NavBarAnimationSettings(
            navBarItemAnimation: ItemAnimationSettings( // Navigation Bar's items animation properties.
                duration: Duration(milliseconds: 400),
                curve: Curves.ease,
            ),
            screenTransitionAnimation: ScreenTransitionAnimationSettings( // Screen transition animation on change of selected tab.
                animateTabTransition: true,
                duration: Duration(milliseconds: 200),
                screenTransitionAnimationType: ScreenTransitionAnimationType.fadeIn,
            ),
        ),
        confineToSafeArea: true,
        navBarHeight: kBottomNavigationBarHeight,
        navBarStyle: _navBarStyle, // Choose the nav bar style with this property
      );
  }
}
```

```dart
List<Widget> _buildScreens() {
    return [
      MainScreen(),
      SettingsScreen()
    ];
}
```

```dart
List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
        PersistentBottomNavBarItem(
            icon: Icon(CupertinoIcons.home),
            title: ("Home"),
            activeColorPrimary: CupertinoColors.activeBlue,
            inactiveColorPrimary: CupertinoColors.systemGrey,
            scrollController: _scrollController1,
            routeAndNavigatorSettings: RouteAndNavigatorSettings(
                initialRoute: "/",
                routes: {
                "/first": (final context) => const MainScreen2(),
                "/second": (final context) => const MainScreen3(),
                },
            ),
        ),
        PersistentBottomNavBarItem(
            icon: Icon(CupertinoIcons.settings),
            title: ("Settings"),
            activeColorPrimary: CupertinoColors.activeBlue,
            inactiveColorPrimary: CupertinoColors.systemGrey,
            scrollController: _scrollController2,
            routeAndNavigatorSettings: RouteAndNavigatorSettings(
                initialRoute: "/",
                routes: {
                "/first": (final context) => const MainScreen2(),
                "/second": (final context) => const MainScreen3(),
                },
            ),
        ),
    ];
}
```

## Navigator Functions

> **Note:** You can still use regular Navigator functions like `pushNamed`, but be sure to check the `routeAndNavigatorSettings` argument of your `PersistentBottomNavBarItem` for route settings and other navigator-related properties.

To push a new screen, use the following functions to control the visibility of the bottom navigation bar on a particular screen. You can use your own logic to implement platform-specific behavior — one solution is to use the `withNavBar` property and toggle it according to the platform.

In platform-specific behavior, while pushing a new screen: on Android it will push the screen **without** the bottom navigation bar, but on iOS it will **persist** the bottom navigation bar. This is the default behavior specified by each platform.

```dart
PersistentNavBarNavigator.pushNewScreen(
    context,
    screen: MainScreen(),
    withNavBar: true, // OPTIONAL VALUE. True by default.
    pageTransitionAnimation: PageTransitionAnimation.cupertino,
);
```

```dart
PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
    context,
    settings: RouteSettings(name: MainScreen.routeName),
    screen: MainScreen(),
    withNavBar: true,
    pageTransitionAnimation: PageTransitionAnimation.cupertino,
);
```

If you are pushing a new modal screen, use the following function:

```dart
PersistentNavBarNavigator.pushDynamicScreen(
    context,
    screen: HomeModalScreen(),
    withNavBar: true,
);
```

Pop all screens until the first screen on the selected tab:

```dart
PersistentNavBarNavigator.popUntilFirstScreenOnSelectedTabScreen(
    context,
    routeName: "/", // If you haven't defined a routeName for the first screen of the selected tab then don't use the optional property `routeName`. Otherwise it may not work as intended.
);
```

## Some Useful Tips

Pop to any screen in the navigation graph for a given tab:

```dart
Navigator.of(context).popUntil((route) {
    return route.settings.name == "ScreenToPopBackTo";
});
```

Pop back to the first screen in the navigation graph for a given tab:

```dart
Navigator.of(context).popUntil(ModalRoute.withName("/"));
```

```dart
Navigator.of(context).pushAndRemoveUntil(
  CupertinoPageRoute(
    builder: (BuildContext context) {
      return FirstScreen();
    },
  ),
  (_) => false,
);
```

To push a bottom sheet on top of the navigation bar, use `showModalBottomScreen` and set its `useRootNavigator` property to `true`. See the example project for an illustration.

## Custom Navigation Bar Styling

If you want to have your own style for the navigation bar, follow these steps:

1. Declare your custom widget. Keep in mind that you will have to handle the `onSelectedItem` function and the integer `selectedIndex` yourself to maintain full functionality. Note that you can define your own model for the navigation bar item instead of the provided `PersistentBottomNavBarItem`. See the example below:

```dart
class CustomNavBarWidget extends StatelessWidget {
    final int selectedIndex;
    final List<PersistentBottomNavBarItem> items; // NOTE: You CAN declare your own model here instead of `PersistentBottomNavBarItem`.
    final ValueChanged<int> onItemSelected;

    CustomNavBarWidget(
        {Key key,
        this.selectedIndex,
        @required this.items,
        this.onItemSelected,});

    Widget _buildItem(
        PersistentBottomNavBarItem item, bool isSelected) {
        return Container(
        alignment: Alignment.center,
        height: 60.0,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
            Flexible(
                child: IconTheme(
                data: IconThemeData(
                    size: 26.0,
                    color: isSelected
                        ? (item.activeColorSecondary == null
                            ? item.activeColorPrimary
                            : item.activeColorSecondary)
                        : item.inactiveColorPrimary == null
                            ? item.activeColorPrimary
                            : item.inactiveColorPrimary),
                child: item.icon,
                ),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Material(
                type: MaterialType.transparency,
                child: FittedBox(
                    child: Text(
                    item.title,
                    style: TextStyle(
                        color: isSelected
                            ? (item.activeColorSecondary == null
                                ? item.activeColorPrimary
                                : item.activeColorSecondary)
                            : item.inactiveColorPrimary,
                        fontWeight: FontWeight.w400,
                        fontSize: 12.0),
                )),
                ),
            )
            ],
        ),
        );
    }

    @override
    Widget build(BuildContext context) {
        return Container(
        color: Colors.white,
        child: Container(
            width: double.infinity,
            height: 60.0,
            child: Row(
            mainAxisAlignment: navBarEssentials.navBarItemsAlignment,
            children: items.map((item) {
                int index = items.indexOf(item);
                return Flexible(
                child: GestureDetector(
                    onTap: () {
                    this.onItemSelected(index);
                    },
                    child: _buildItem(
                        item, selectedIndex == index),
                ),
                );
            }).toList(),
            ),
        ),
        );
    }
}
```

2. In the main `PersistentTabView` widget, set the `navBarStyle` property to `NavBarStyle.custom` and pass the custom widget you just created into the `customWidget` property, like this:

```dart
class MyApp extends StatelessWidget {
    const MyApp({Key key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return PersistentTabView.custom(
            context,
            controller: _controller,
            screens: [
                CustomNavBarScreen(
                    // You can declare route settings for the custom navigation bar screen here
                    routeAndNavigatorSettings: RouteAndNavigatorSettings(
                    initialRoute: "/",
                    routes: {
                            "/first": (final context) => const MainScreen2(),
                            "/second": (final context) => const MainScreen3(),
                        },
                    ),
                    screen: MainScreen(
                        menuScreenContext: widget.menuScreenContext,
                        scrollController: _scrollControllers.first,
                    ),
                ),
                CustomNavBarScreen(
                    screen: MainScreen(
                        menuScreenContext: widget.menuScreenContext,
                        scrollController: _scrollControllers[1],
                    ),
                ),
                CustomNavBarScreen(
                    screen: MainScreen(
                        menuScreenContext: widget.menuScreenContext,
                        scrollController: _scrollControllers[2],
                    ),
                ),
                CustomNavBarScreen(
                    screen: MainScreen(
                        menuScreenContext: widget.menuScreenContext,
                        scrollController: _scrollControllers[3],
                    ),
                ),
                CustomNavBarScreen(
                    screen: MainScreen(
                        menuScreenContext: widget.menuScreenContext,
                        scrollController: _scrollControllers.last,
                    ),
                ),
            ],
            itemCount: 5,
            isVisible: true,
            hideOnScrollSettings: HideOnScrollSettings(
                hideNavBarOnScroll: true,
                scrollControllers: _scrollControllers,
            ),
            backgroundColor: Colors.grey.shade900,
            customWidget: CustomNavBarWidget(
                    _navBarsItems(),
                    onItemSelected: (final index) {
                         // Scroll to top for custom widget. For non-custom widget, declare the `scrollController` property in `PersistentBottomNavBarItem`.
                        if (index == _controller.index) {
                            _scrollControllers[index].animateTo(0, duration: const Duration(milliseconds: 200), curve: Curves.ease);
                        }
                        setState(() {
                            _controller.index = index; // THIS IS CRITICAL!! Don't miss it!
                        });
                    },
                    selectedIndex: _controller.index,
                ),
        );
    }
}
```

> **NOTE:** In the `onSelected` function of the `customWidget`, don't forget to change the index of the controller.

Done! As you can see, some of the other properties like `iconSize` and `items` are not required here, so you can skip those properties. To control the bottom padding of the screen, use `bottomScreenPadding`. If you give too much `bottomScreenPadding` but too little height in the custom widget (or vice versa), layout issues might appear.

## Animated Icons

Animated icons are supported in `PersistentBottomNavBarItem`. You will need to define and use an `AnimationController` and `Animation<double>` for it to work. Here is an example:

```dart
final _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 400));
final _animationValue = Tween<double>(begin: 0.toDouble(), end: 1.toDouble()).animate(_animationController),

final item = PersistentBottomNavBarItem(
    icon: AnimatedIcon(
    icon: AnimatedIcons.home_menu,
    progress: _animationValue,
    ),
    iconAnimationController: _animationController,
    title: "Home",
    activeColorPrimary: Colors.blue,
    activeColorSecondary: _navBarStyle == NavBarStyle.style7 || _navBarStyle == NavBarStyle.style10 ? Colors.white : null,
    inactiveColorPrimary: Colors.grey,
);
```