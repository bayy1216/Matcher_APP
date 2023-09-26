import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/model/offset_pagination_model.dart';
import '../../common/provider/pagination_provider.dart';
import '../model/job_model.dart';
import '../repository/job_repository.dart';
import 'package:collection/collection.dart';

final jobDetailProvider =
Provider.family<JobModel?, int>((ref, id) {
  final state = ref.watch(jobProvider);
  if (state is! OffsetPagination<JobModel>) {
    return null;
  }
  return state.content.firstWhereOrNull((element) => element.id == id);
});


final jobProvider = StateNotifierProvider<JobStateNotifier, OffsetPaginationBase>(
  (ref) {
    final repo = ref.watch(jobRepositoryProvider);
    return JobStateNotifier(repository: repo);
  },
);

class JobStateNotifier
    extends PaginationStateNotifier<JobModel, JobRepository, Object> {
  JobStateNotifier({
    required super.repository,
    super.requestBody,
  });

  getDetailJob({required int id}) async {
    final pState = state as OffsetPagination<JobModel>;
    final resp = await repository.getDetailJobModel(id: id);

    if(pState.content.where((e) => e.id == id).isEmpty){
      state = pState.copyWith(
          content: <JobModel>[
            ...pState.content,
            resp,
          ]
      );
    }else{
      state = pState.copyWith(
        content: pState.content.map<JobModel>((e) => e.id == id ? resp : e).toList(),
      );
    }
  }
}
