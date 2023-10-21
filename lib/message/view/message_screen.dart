import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/layout/default_layout.dart';
import '../../common/view/root_tab.dart';
import '../component/message_preview_item.dart';
import '../provider/message_preview_provider.dart';

class MessageScreen extends ConsumerWidget {
  static String get routeName => 'message';

  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(messagePreviewProvider);
    return DefaultLayout(
      title: BottomNavPage.message.korean,
      body: ListView.separated(
        itemCount: state.length,
        separatorBuilder: (context, index) => const SizedBox(height: 5),
        itemBuilder: (context, index) {
          final model = state[index];
          return GestureDetector(
            onTap: () {

            },
            child: MessagePreviewItem.fromModel(model: model),
          );
        },
      ),
    );
  }
}
