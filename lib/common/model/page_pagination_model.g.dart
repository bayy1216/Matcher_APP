// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_pagination_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PagePagination<T> _$PagePaginationFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    PagePagination<T>(
      hasNext: json['hasNext'] as bool,
      content: (json['content'] as List<dynamic>).map(fromJsonT).toList(),
    );

Map<String, dynamic> _$PagePaginationToJson<T>(
  PagePagination<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'hasNext': instance.hasNext,
      'content': instance.content.map(toJsonT).toList(),
    };
