import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/http.dart';

import '../../job/model/job_detail_model.dart';
import '../../job/model/job_model.dart';
import '../model/offset_pagination_model.dart';
import '../model/pagination_params.dart';
import 'dio.dart';

final dioClientProvider = Provider<DioClient>((ref) {
  final dio = ref.watch(dioProvider);

  return FakeDioClient(dio, baseUrl: 'http://ip');
});

class FakeDioClient implements DioClient {
  final Dio dio;
  final String baseUrl;

  FakeDioClient(this.dio, {required this.baseUrl});

  @override
  Future<OffsetPagination<JobModel>> paginateJobModel({
    required PaginationQueries paginationQueries,
    Object? requestBody,
  }) async {
    return OffsetPagination<JobModel>(
      hasNext: false,
      content: [
        JobModel(
          id: 1,
          userMajor: '컴퓨터학부',
          userStudentNumber: 19,
          title: '종프 팀원 구합니다',
          date: DateTime(2021, 10, 10),
          thumbnailUrl: 'https://picsum.photos/200/300',
        ),
        JobModel(
          id: 2,
          userMajor: '경제학과',
          userStudentNumber: 22,
          title: '팀원 구합니다',
          date: DateTime(2023, 1, 10),
          thumbnailUrl: 'https://picsum.photos/200/300',
        ),

      ],
    );
  }

  @override
  Future<JobDetailModel> getDetailJobModel({
    required int id,
  })async {
    late final JobDetailModel jobDetailModel;
    if(id == 1){
      jobDetailModel =  JobDetailModel(
        id: 1,
        userMajor: '컴퓨터학부',
        userStudentNumber: 19,
        title: '종프 팀원 구합니다',
        date: DateTime(2021, 10, 10),
        thumbnailUrl: 'https://picsum.photos/200/300',
        userId: 1,
        userName: '김종프',
        content: '종프 팀원 구합니다',
        imageUrl: [
          'https://picsum.photos/200/300',
          'https://picsum.photos/200/300',
          'https://picsum.photos/200/300',
        ],
      );
    }else if(id ==2){
      jobDetailModel =  JobDetailModel(
        id: 2,
        userMajor: '경제학과',
        userStudentNumber: 22,
        title: '팀원 구합니다',
        date: DateTime(2023, 1, 10),
        thumbnailUrl: 'https://picsum.photos/200/300',
        userId: 2,
        userName: '김경제',
        content: '팀원 구합니다',
        imageUrl: [
          'https://picsum.photos/200/300',
          'https://picsum.photos/200/300',
          'https://picsum.photos/200/300',
        ],
      );
    }

    return jobDetailModel;

  }
}

abstract class DioClient {
  //factory DioClient(Dio dio, {String baseUrl}) = _DioClient;

  Future<OffsetPagination<JobModel>> paginateJobModel({
    required PaginationQueries paginationQueries,
    Object? requestBody,
  });

  Future<JobDetailModel> getDetailJobModel({
    required int id,
  });
}
