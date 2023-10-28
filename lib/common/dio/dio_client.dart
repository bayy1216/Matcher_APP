import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/http.dart';

import '../../job/model/comment_model.dart';
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

    await Future.delayed(Duration(seconds: 1) );
    log('PAGINATION');
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
          thumbnailUrl: 'https://picsum.photos/200/200',
        ),
        JobModel(
          id: 3,
          userMajor: '통계학부',
          userStudentNumber: 19,
          title: '종프 팀원 구합니다',
          date: DateTime(2021, 10, 10),
          thumbnailUrl: 'https://picsum.photos/200/100',
        ),
        JobModel(
          id: 4,
          userMajor: '경제학과',
          userStudentNumber: 22,
          title: 'ㅇㅇㅇ 구합니다',
          date: DateTime(2023, 1, 10),
          thumbnailUrl: 'https://picsum.photos/300/300',
        ),
        JobModel(
          id: 5,
          userMajor: '컴퓨터학부',
          userStudentNumber: 19,
          title: 'ㅁㄹㄹㄹ 팀원 구합니다',
          date: DateTime(2021, 10, 10),
          thumbnailUrl: 'https://picsum.photos/200/300',
        ),
        JobModel(
          id: 6,
          userMajor: '경제학과',
          userStudentNumber: 22,
          title: 'ㅇㅇㅇㅇ팀원 구합니다',
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
    await Future.delayed(Duration(seconds: 1) );
    log('getDetailJobModel');
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
        ], comments: [
          CommentModel(id: 1, content: 'content', date: DateTime.now(), userId: 1, userName: 'userName'),
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
        ], comments: [],
      );
    }else if(id ==3){
      jobDetailModel =  JobDetailModel(
        id: 3,
        userMajor: '통계학부',
        userStudentNumber: 19,
        title: '종프 팀원 구합니다',
        date: DateTime(2021, 10, 10),
        thumbnailUrl: 'https://picsum.photos/200/300',
        userId: 3,
        userName: '김통계',
        content: '종프 팀원 구합니다',
        imageUrl: [
          'https://picsum.photos/200/300',
          'https://picsum.photos/200/300',
          'https://picsum.photos/200/300',
        ], comments: [],
      );
    }else if(id ==4){
      jobDetailModel =  JobDetailModel(
        id: 4,
        userMajor: '경제학과',
        userStudentNumber: 22,
        title: 'ㅇㅇㅇ 구합니다',
        date: DateTime(2023, 1, 10),
        thumbnailUrl: 'https://picsum.photos/200/300',
        userId: 4,
        userName: '김경제',
        content: 'ㅇㅇㅇ 구합니다',
        imageUrl: [
          'https://picsum.photos/200/300',
          'https://picsum.photos/200/300',
          'https://picsum.photos/200/300',
        ], comments: [],
      );
    }else if(id ==5){
      jobDetailModel =  JobDetailModel(
        id: 5,
        userMajor: '컴퓨터학부',
        userStudentNumber: 19,
        title: 'ㅁㄹㄹㄹ 팀원 구합니다',
        date: DateTime(2021, 10, 10),
        thumbnailUrl: 'https://picsum.photos/200/300',
        userId: 5,
        userName: '김컴퓨터',
        content: 'ㅁㄹㄹㄹ 팀원 구합니다',
        imageUrl: [
          'https://picsum.photos/200/300',
          'https://picsum.photos/200/300',
          'https://picsum.photos/200/300',
        ], comments: [],
      );
    }else if(id ==6){
      jobDetailModel =  JobDetailModel(
        id: 6,
        userMajor: '경제학과',
        userStudentNumber: 22,
        title: 'ㅇㅇㅇㅇ팀원 구합니다',
        date: DateTime(2023, 1, 10),
        thumbnailUrl: 'https://picsum.photos/200/300',
        userId: 6,
        userName: '김경제',
        content: 'ㅇㅇㅇㅇ팀원 구합니다',
        imageUrl: [
          'https://picsum.photos/200/300',
          'https://picsum.photos/200/300',
          'https://picsum.photos/200/300',
        ], comments: [],
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
