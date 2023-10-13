import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../common/layout/default_layout.dart';
import 'setting_screen.dart';

class MyScreen extends ConsumerWidget {
  static String get routeName => 'my';

  const MyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultLayout(
      title: '',
      actions: [
        IconButton(
          onPressed: () {
            context.goNamed(SettingScreen.routeName);
          },
          icon: const Icon(Icons.settings),
        ),],
      body: SingleChildScrollView(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
