// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offset_pagination_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OffsetPagination<T> _$OffsetPaginationFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    OffsetPagination<T>(
      hasNext: json['hasNext'] as bool,
      content: (json['content'] as List<dynamic>).map(fromJsonT).toList(),
    );

Map<String, dynamic> _$OffsetPaginationToJson<T>(
  OffsetPagination<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'hasNext': instance.hasNext,
      'content': instance.content.map(toJsonT).toList(),
    };
