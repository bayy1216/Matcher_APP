import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/component/search_item.dart';
import '../../common/component/search_text_form_field.dart';
import '../../common/const/data.dart';
import '../../common/const/text_style.dart';
import '../../common/layout/default_layout.dart';
import '../../common/provider/search_provider.dart';
import '../../common/view/root_tab.dart';

class JobSearchScreen extends ConsumerWidget {
  static String get routeName => 'job_search';
  const JobSearchScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final state = ref.watch(searchNotifierProvider(JOB_SEARCH_KEY));
    return DefaultLayout(
      title: '',
      titleWidget: SearchTextFormField(
        hintText: '${BottomNavPage.job.korean} 검색',
        onSubmitted: (value) {
          ref.read(searchNotifierProvider(JOB_SEARCH_KEY).notifier)
              .addHistory(value);
          //TODO LOGIC
        },
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: DEFAULT_PADDING_H),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('최근 검색',style: CONTENT_MEDIUMN_STYLE),
                GestureDetector(
                  onTap: () {
                    ref.read(searchNotifierProvider(JOB_SEARCH_KEY).notifier).removeAllHistory();
                  },
                  child: Text('전체 삭제',style: CONTENT_SMALL_STYLE),
                ),
              ],
            ),
            const SizedBox(height: 10),
            state.when(
              data: (data){
                return Expanded(
                  child: GridView.builder(
                    itemCount: data.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 7/2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 30,
                    ),
                    itemBuilder: (context, index) {
                      return SearchItem(
                        keyword: data[index],
                        onTap: () {
                          ref.read(searchNotifierProvider(JOB_SEARCH_KEY).notifier).removeHistory(data[index]);
                        },
                      );
                    },
                  ),
                );
              },
              error: (error, stackTrace) => Text('$error'),
              loading: () => Container(),
            ),

          ],
        ),
      ),
    );
  }
}
