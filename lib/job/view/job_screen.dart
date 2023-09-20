import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../common/const/color.dart';
import '../../common/layout/default_layout.dart';
import '../../common/view/root_tab.dart';
import '../component/job_item.dart';

class JobScreen extends StatelessWidget {
  static String get routeName => 'job';

  const JobScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: BottomNavPage.job.korean,
      actions: [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            'assets/icons/search.svg',
          ),
        ),
      ],
      body: ListView.separated(
        itemCount: 10,
        itemBuilder: (context, index) {
          return JobItem(
            title: '종프 팀원 하실분을 찾습니다.',
            imgUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSK10NckXTTzmLQxJu6maCL_Z5SUTphEUjGvw&usqp=CAU',
            major: '컴퓨터학부',
            studentNumber: '19',
            date: '2023-09-15 21:00',
          );
        },
        separatorBuilder: (context, index) {
          return Divider(
            color: DIVIDIER_GREY,
            thickness: 0.5,
          );
        }
      ),
    );
  }
}
