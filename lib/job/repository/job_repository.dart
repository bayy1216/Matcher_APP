import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/dio/dio_client.dart';
import '../../common/model/offset_pagination_model.dart';
import '../../common/model/pagination_params.dart';
import '../../common/repository/base_pagination_repository.dart';
import '../model/job_detail_model.dart';
import '../model/job_model.dart';

final jobRepositoryProvider = Provider<JobRepository>((ref){
  final dioClient = ref.watch(dioClientProvider);
  return JobRepository(dioClient: dioClient);
});

class JobRepository implements IBasePaginationRepository<JobModel,Object>{
  final DioClient _dioClient;
  JobRepository({
    required DioClient dioClient,
  }):_dioClient = dioClient;

  @override
  Future<OffsetPagination<JobModel>> paginate({
    required PaginationQueries paginationQueries,
    Object? requestBody,
  })async {
    return _dioClient.paginateJobModel(paginationQueries: paginationQueries);
  }

  Future<JobDetailModel> getDetailJobModel({
    required int id,
  })async{
    return _dioClient.getDetailJobModel(id: id);
  }


}