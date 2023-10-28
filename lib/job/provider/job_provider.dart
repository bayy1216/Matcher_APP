import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/model/offset_pagination_model.dart';
import '../../common/provider/pagination_provider.dart';
import '../../login/model/user_model.dart';
import '../../login/provider/user_provider.dart';
import '../model/comment_model.dart';
import '../model/job_detail_model.dart';
import '../model/job_model.dart';
import '../repository/job_repository.dart';
import 'package:collection/collection.dart';

final jobDetailProvider = Provider.family<JobModel?, int>((ref, id) {
  final state = ref.watch(jobProvider);
  if (state is! OffsetPagination<JobModel>) {
    return null;
  }
  return state.content.firstWhereOrNull((element) => element.id == id);
});

final jobProvider =
    StateNotifierProvider<JobStateNotifier, OffsetPaginationBase>(
  (ref) {
    final user = ref.read(userProvider) as UserModel;
    final repo = ref.watch(jobRepositoryProvider);
    return JobStateNotifier(repository: repo, userModel: user);
  },
);

class JobStateNotifier
    extends PaginationStateNotifier<JobModel, JobRepository, Object> {
  final UserModel userModel;

  JobStateNotifier({
    required super.repository,
    super.requestBody,
    required this.userModel,
  });

  getDetailJob({required int id}) async {
    final pState = state as OffsetPagination<JobModel>;
    final resp = await repository.getDetailJobModel(id: id);

    if (pState.content.where((e) => e.id == id).isEmpty) {
      state = pState.copyWith(content: <JobModel>[
        ...pState.content,
        resp,
      ]);
    } else {
      state = pState.copyWith(
        content:
            pState.content.map<JobModel>((e) => e.id == id ? resp : e).toList(),
      );
    }
  }

  createComment({
    required int jobId,
    required String content,
  }) async {
    if (state is! OffsetPagination) {
      return;
    }
    final pState = state as OffsetPagination<JobModel>;
    final job =
        pState.content.firstWhereOrNull((element) => element.id == jobId);
    if (job == null) {
      return;
    }
    final resp = await repository.createComment(jobId: jobId, content: content);
    final detailJob = job as JobDetailModel;

    final newComment = CommentModel(
      id: resp,
      content: content,
      date: DateTime.now(),
      userId: 1,
      userName: '김민수',
    );

    final pDetailJob = detailJob.copyWith(comments: [
      ...detailJob.comments,
      newComment,
    ]);

    state = pState.copyWith(
      content: pState.content
          .map<JobModel>((e) => e.id == jobId ? pDetailJob : e)
          .toList(),
    );
  }

  deleteComment({
    required int jobId,
    required int commentId,
  })async {
    if (state is! OffsetPagination) {
      return;
    }
    final pState = state as OffsetPagination<JobModel>;
    final job =
    pState.content.firstWhereOrNull((element) => element.id == jobId);
    if (job == null) {
      return;
    }
    final resp = await repository.deleteComment(id: commentId);
    final detailJob = job as JobDetailModel;
    final pDetailJob = detailJob.copyWith(comments: [
      ...detailJob.comments.where((element) => element.id != commentId),
    ]);

    state = pState.copyWith(
      content: pState.content
          .map<JobModel>((e) => e.id == jobId ? pDetailJob : e)
          .toList(),
    );
  }
}
