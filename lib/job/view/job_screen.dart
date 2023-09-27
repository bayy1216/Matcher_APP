import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../common/component/pagination_list_view.dart';
import '../../common/layout/default_layout.dart';
import '../../common/view/root_tab.dart';
import '../component/job_item.dart';
import '../provider/job_provider.dart';
import 'job_detail_screen.dart';
import 'job_serach_screen.dart';

class JobScreen extends StatelessWidget {
  static String get routeName => 'job';

  const JobScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: BottomNavPage.job.korean,
      actions: [
        IconButton(
          onPressed: () {
            context.goNamed(JobSearchScreen.routeName);
          },
          icon: SvgPicture.asset(
            'assets/icons/search.svg',
          ),
        ),
      ],
      body: PaginationListView(
        provider: jobProvider,
        itemBuilder: (context, index, model) {
          return GestureDetector(
            onTap: () {
              context.goNamed(
                JobDetailScreen.routeName,
                pathParameters: {'id': model.id.toString()},
              );
            },
            child: JobItem.fromModel(model: model),
          );
        },
      ),
    );
  }
}
