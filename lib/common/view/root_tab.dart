import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../const/color.dart';
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
    final currentIndex = index >= 2 ? index + 1 : index;
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
          selectedItemColor: DEFAULT_GREEN,
          unselectedItemColor: TEXT_GREY,
          selectedFontSize: 11,
          unselectedFontSize: 11,
          iconSize: 23,
          type: BottomNavigationBarType.fixed,
          onTap: _goBranch,
          currentIndex: currentIndex,
          enableFeedback: true,
          items: BottomNavPage.values.map((e) {
            return BottomNavigationBarItem(
              icon: currentIndex == e.index
                  ? e.getIcon(true)
                  .animate()
                  .scale(duration: 150.ms, begin: const Offset(0.9, 0.9))
                  : e.getIcon(false),
              label: e.korean,
            );
          }).toList(),
        ),
      ),
    );
  }

  void _goBranch(int index) {
    if (index == 2) {
      return;
    }
    final shellIndex = index > 2 ? index - 1 : index;
    navigationShell.goBranch(shellIndex,
        initialLocation: shellIndex == navigationShell.currentIndex);
  }
}

enum BottomNavPage {
  reservation('자리예약', Icons.home),
  job('구인구직', Icons.work),
  create('', Icons.calendar_today),
  message('메시지', Icons.notifications),
  my('마이', Icons.person);

  final String korean;
  final IconData iconData;

  SvgPicture getIcon(bool isGreen) {
    //Color color = isGreen ? ColorPalette.PRIMARY_RED : const Color(0xff818181);
    return SvgPicture.asset(
      'assets/icons/$name.svg',
      colorFilter: isGreen ? const ColorFilter.mode(
          DEFAULT_GREEN, BlendMode.srcIn) : const ColorFilter.mode(
          Color(0xff818181), BlendMode.srcIn),
      // width: 21,
      // colorFilter: ColorFilter.mode(DEFAULT_GREEN, BlendMode.srcIn),
    );
  }

  const BottomNavPage(this.korean, this.iconData);
}



