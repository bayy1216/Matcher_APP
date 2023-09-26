
import 'package:flutter/material.dart';

import '../provider/pagination_provider.dart';
import '../repository/base_pagination_repository.dart';

class PaginationUtils {
  static void paginate<T>({
    required ScrollController controller,
    required PaginationStateNotifier<T,IBasePaginationRepository<T,Object>,Object> paginationProvider,
  }) async{
    if (controller.offset > controller.position.maxScrollExtent - 300) {
      final loaded = await paginationProvider.paginate(
        fetchMore: true,
      );
    }
  }
}