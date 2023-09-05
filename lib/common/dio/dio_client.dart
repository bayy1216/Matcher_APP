import 'package:campus_match/common/dio/dio.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/http.dart';

part 'dio_client.g.dart';


final dioClientProvier = Provider((ref){
  final dio = ref.watch(dioProvider);
  return DioClient(dio, baseUrl: 'http://ip');
});

@RestApi()
abstract class DioClient{
  factory DioClient(Dio dio, {String baseUrl}) = _DioClient;

}