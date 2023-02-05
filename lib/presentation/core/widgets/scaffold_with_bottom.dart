import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task_manager/presentation/chat/chats_overview_page.dart';
import 'package:task_manager/presentation/core/constants.dart';
import 'package:task_manager/presentation/profile/profile_page.dart';
import 'package:task_manager/presentation/projects/projects_overview/projects_overview_page.dart';
import 'package:task_manager/presentation/users/users_overview/users_overview_page.dart';

class ScaffoldWithBottomNavBar extends StatefulWidget {
  final Widget child;

  const ScaffoldWithBottomNavBar({Key? key, required this.child})
      : super(key: key);

  @override
  State<ScaffoldWithBottomNavBar> createState() =>
      _ScaffoldWithBottomNavBarState();
}

class _ScaffoldWithBottomNavBarState extends State<ScaffoldWithBottomNavBar> {
  int get currentIndex => _locationToTabIndex(GoRouter.of(context).location);

  int _locationToTabIndex(String location) {
    final index = tabs.indexWhere((t) => location == (t.initialLocation));
    return index < 0 ? 0 : index;
  }

  //callback used to navigate to the desired tab
  void _onItemTapped(BuildContext context, int tabIndex) {
    if (tabIndex != currentIndex) {
      // go to the initial location of the selected tab (by index)
      context.go(tabs[tabIndex].initialLocation);
    }
  }

  final List<Widget> _mainContents = [
    UsersOverviewPage(),
    ProjectsOverviewPage(),
    ChatsOverviewPage(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Scaffold(
          body: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              if (MediaQuery.of(context).size.width > 640) ...[
                NavigationRail(
                  backgroundColor: Theme.of(context).primaryColor,
                  minWidth: 55.0,
                  selectedIndex: currentIndex,
                  onDestinationSelected: (index) =>
                      _onItemTapped(context, index),
                  // selectedIconTheme: IconThemeData(color:AppConstants.primaryColor),
                  // selectedLabelTextStyle:TextStyle(color:AppConstants.primaryColor ),
                  labelType: NavigationRailLabelType.all,
                  leading: Column(
                    children: [
                      SizedBox(
                        height: 8,
                      ),
                    ],
                  ),
                  selectedIconTheme: IconThemeData(color: Colors.white) ,
                  selectedLabelTextStyle: TextStyle(color: Colors.white),
                  destinations: [
                    NavigationRailDestination(
                      icon: Icon(Icons.home),
                      label: Text("Главная"),
                    ),
                    NavigationRailDestination(
                        icon: Icon(Icons.account_tree_outlined),
                        label: Text("Проекты")),
                    NavigationRailDestination(
                        icon: Icon(Icons.chat),
                        label: Text("Чат")),
                    NavigationRailDestination(
                        icon: Icon(Icons.person), label: Text("Профиль")),
                  ],
                )
              ],
              Expanded(
                child: IndexedStack(
                  index: currentIndex,
                  children: _mainContents,
                ),
              )
              //Expanded(child: _mainContents[currentIndex])
            ],
          ),
          bottomNavigationBar: MediaQuery.of(context).size.width < 640
              ? BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Theme.of(context).primaryColor,
                  currentIndex: currentIndex,
                  selectedItemColor: Colors.white,
                  items: tabs,
                  onTap: (index) => _onItemTapped(context, index),
                )
              : null),
    );
  }
}

class ScaffoldWithNavBarTabItem extends BottomNavigationBarItem {
  const ScaffoldWithNavBarTabItem(
      {required this.initialLocation, required Widget icon, String? label})
      : super(icon: icon, label: label);

  /// The initial location/path
  final String initialLocation;
}

const tabs = [
  ScaffoldWithNavBarTabItem(
    initialLocation: PageRoutes.usersOverviewPage,
    icon: Icon(Icons.home),
    label: 'Главная',
  ),
  ScaffoldWithNavBarTabItem(
    initialLocation: PageRoutes.projectsOverviewPage,
    icon: Icon(Icons.account_tree_outlined),
    label: 'Проекты',
  ),
  ScaffoldWithNavBarTabItem(
      initialLocation: PageRoutes.chatsOverviewPage,
      icon: Icon(Icons.chat),
      label: "Чат"),
  ScaffoldWithNavBarTabItem(
    initialLocation: PageRoutes.profilePage,
    icon: Icon(Icons.person),
    label: 'Профиль',
  ),
];
