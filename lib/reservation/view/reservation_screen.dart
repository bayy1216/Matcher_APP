import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../common/const/color.dart';
import '../../common/layout/default_layout.dart';
import '../../common/view/root_tab.dart';
import '../component/reservation_item.dart';
import 'reservation_detail_screen.dart';
import 'reservation_search_screen.dart';

class ReservationScreen extends StatelessWidget {
  static String get routeName => 'reservation';
  const ReservationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: BottomNavPage.reservations.korean,
      actions: [
        IconButton(
          onPressed: () {
            context.goNamed(ReservationSearchScreen.routeName);
          },
          icon: SvgPicture.asset(
            'assets/icons/search.svg',
          ),
        ),
      ],
      body: ListView.separated(
          itemCount: 10,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                context.goNamed(ReservationDetailScreen.routeName);
              },
              child: ReservationItem(),
            );
          },
          separatorBuilder: (context, index) {
            return const Divider(
              color: DIVIDIER_GREY,
              thickness: 0.5,
            );
          }
      ),
    );
  }
}
