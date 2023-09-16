
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



class MyScreen extends ConsumerWidget {
  static String get routeName => 'my';
  const MyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('MyScreen build');
    return SingleChildScrollView(
      child: Column(
        children : [

        ],
      ),
    );
  }
}
