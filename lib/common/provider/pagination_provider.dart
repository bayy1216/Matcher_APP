
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/offset_pagination_model.dart';
import '../model/pagination_params.dart';
import '../repository/base_pagination_repository.dart';

class PaginationStateNotifier<T, R extends IBasePaginationRepository<T,B>, B>
    extends StateNotifier<OffsetPaginationBase> {
  final R repository;
  final B? requestBody;
  int page = 0;

  PaginationStateNotifier({required this.repository, this.requestBody})
      : super(OffsetPaginationLoading()){
    paginate();
  }

  Future<bool> paginate({
    bool fetchMore = false,
    bool forceRefetch = false,
  }) async {
    try {
      //데이터가 있을때, 다음 데이터가 없음
      if (state is OffsetPagination && !forceRefetch) {
        final pState = state as OffsetPagination;
        if (!pState.hasNext) {
          return false;
        }
      }

      final isLoading = state is OffsetPaginationLoading;
      final isRefetching = state is OffsetPaginationRefetchingMore;

      if (fetchMore && isRefetching) {
        return false;
      }

      if (fetchMore) {
        final pState = state as OffsetPagination<T>;
        state = OffsetPaginationRefetchingMore<T>(
          hasNext: pState.hasNext,
          content: pState.content,
        );
      }else if(forceRefetch){
        page=0;
        //state = CursorPaginationLoading();
      }


      PaginationQueries paginationQueries = PaginationQueries(
        page: page,
      );

      final resp = await repository.paginate(
        paginationQueries: paginationQueries,
        requestBody: requestBody,
      );


      if (isLoading || forceRefetch) {
        //맨처음 로딩상황 & 처음꺼 다시시도
        state = resp;
      } else {
        //이후 데이터 계속 요청하는 상황(isRefetching)

        final pState = state as OffsetPagination<T>;

        state = resp.copyWith(
          content: [
            ...pState.content,
            ...resp.content,
          ],
        );

      }
      page++;
      return true;
    } catch (e) {
      state = OffsetPaginationError(message: "데이터를 가져오지 못했습니다.");
      return false;
    }
  }
}