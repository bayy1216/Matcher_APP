import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../layout/default_layout.dart';
import '../provider/bottom_nav_provider.dart';
import 'my_screen.dart';

class RootTab extends ConsumerWidget {
  static String get routeName => 'root_tab';

  const RootTab({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(bottomNavProvider);
    return WillPopScope(
      onWillPop: ref.read(bottomNavProvider.notifier).willPopAction,
      child: DefaultLayout(
        body: SafeArea(
          child: IndexedStack(
            index: currentIndex,
            children: [
              Container(color: Colors.blue,child: Center(child: Text('Home'),),),
              Container(color: Colors.green,child: Center(child: Text('Search'),),),
              Container(color: Colors.yellow,child: Center(child: Text('Add'),),),
              Container(color: Colors.purple,child: Center(child: Text('Like'),),),
              MyScreen(),
            ],
          ),
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
            onTap: ref.read(bottomNavProvider.notifier).changePage,
            currentIndex: currentIndex,
            enableFeedback: true,
            items: BottomNavPage.values.map((e) {
              return BottomNavigationBarItem(
                icon: currentIndex == e.index
                    ? Icon(e.iconData)
                        .animate()
                        .scale(duration: 150.ms, begin: Offset(0.9, 0.9))
                    : Icon(e.iconData),
                label: e.korean,
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

enum BottomNavPage {
  home('홈', Icons.home),
  job('직업', Icons.work),
  reservations('예약', Icons.calendar_today),
  alarm('알림', Icons.notifications),
  my('마이', Icons.person);

  final String korean;
  final IconData iconData;

  const BottomNavPage(this.korean, this.iconData);
}



