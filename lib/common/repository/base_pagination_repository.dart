

import '../model/offset_pagination_model.dart';
import '../model/pagination_params.dart';

abstract class IBasePaginationRepository<T,B> {
  Future<OffsetPagination<T>> paginate({
    required PaginationQueries paginationQueries,
    B? requestBody,
  });
}