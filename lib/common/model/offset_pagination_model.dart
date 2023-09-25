import 'package:json_annotation/json_annotation.dart';

part 'offset_pagination_model.g.dart';

sealed class OffsetPaginationBase {}

class OffsetPaginationLoading extends OffsetPaginationBase {}

class OffsetPaginationError extends OffsetPaginationBase {
  final String message;

  OffsetPaginationError({
    required this.message,
  });
}

@JsonSerializable(genericArgumentFactories: true)
class OffsetPagination<T> extends OffsetPaginationBase {
  bool hasNext;
  List<T> content;

  OffsetPagination({
    required this.hasNext,
    required this.content,
  });

  factory OffsetPagination.fromJson(
      Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$OffsetPaginationFromJson(json, fromJsonT);

  OffsetPagination<T> copyWith({
    bool? hasNext,
    List<T>? content,
  }) {
    return OffsetPagination<T>(
      hasNext: hasNext ?? this.hasNext,
      content: content ?? this.content,
    );
  }
}

class OffsetPaginationRefetchingMore<T> extends OffsetPagination<T> {
  OffsetPaginationRefetchingMore({
    required super.hasNext,
    required super.content,
  });
}