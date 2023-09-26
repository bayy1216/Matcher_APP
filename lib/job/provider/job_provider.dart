import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/model/offset_pagination_model.dart';
import '../../common/provider/pagination_provider.dart';
import '../model/job_model.dart';
import '../repository/job_repository.dart';

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

  getDetailJob({required int id}) {
    return repository.getDetailJobModel(id: id);
  }
}
