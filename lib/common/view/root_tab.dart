import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';

import '../layout/default_layout.dart';

class RootTab extends StatelessWidget {
  static String get routeName => 'root_tab';
  final StatefulNavigationShell navigationShell;

  const RootTab({
    Key? key,
    required this.navigationShell,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final index = navigationShell.currentIndex;
    final currentIndex = index > 2 ? index + 1 : index;
    return DefaultLayout(
      body: SafeArea(
        child: navigationShell,
      ),
      bottomNavigationBar: Theme(
        //아이콘 클릭시 물결펴치는 효과 제거
        data: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.red,
          selectedFontSize: 11,
          unselectedFontSize: 11,
          iconSize: 23,
          type: BottomNavigationBarType.fixed,
          onTap: _goBranch,
          currentIndex: currentIndex,
          enableFeedback: true,
          items: BottomNavPage.values.map((e) {
            return BottomNavigationBarItem(
              icon: currentIndex == e.navIndex
                  ? Icon(e.iconData)
                      .animate()
                      .scale(duration: 150.ms, begin: const Offset(0.9, 0.9))
                  : Icon(e.iconData),
              label: e.korean,
            );
          }).toList(),
        ),
      ),
    );
  }

  void _goBranch(int index){
    if(index == 2){
      return;
    }
    final shellIndex = index > 2 ? index - 1 : index;
    navigationShell.goBranch(shellIndex,initialLocation: shellIndex == navigationShell.currentIndex);
  }
}

enum BottomNavPage {
  home('홈', Icons.home,0),
  job('구인구직', Icons.work,1),
  reservations('', Icons.calendar_today,-1),
  alarm('알림', Icons.notifications,2),
  my('마이', Icons.person,3);

  final String korean;
  final IconData iconData;
  final int navIndex;

  const BottomNavPage(this.korean, this.iconData,this.navIndex);
}



