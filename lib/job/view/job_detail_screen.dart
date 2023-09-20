import 'package:flutter/material.dart';

import '../../common/layout/default_layout.dart';

class JobDetailScreen extends StatelessWidget {
  static String get routeName => 'job_detail';
  const JobDetailScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: '',
      body: ListView(
        children: [

        ],
      ),
    );
  }
}
