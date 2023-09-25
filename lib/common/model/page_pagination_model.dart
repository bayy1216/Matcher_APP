import 'package:json_annotation/json_annotation.dart';

part 'page_pagination_model.g.dart';

abstract class PagePaginationBase {}

class PagePaginationLoading extends PagePaginationBase {}

class PagePaginationError extends PagePaginationBase {
  final String message;

  PagePaginationError({
    required this.message,
  });
}

@JsonSerializable(genericArgumentFactories: true)
class PagePagination<T> extends PagePaginationBase {
  bool hasNext;
  List<T> content;

  PagePagination({
    required this.hasNext,
    required this.content,
  });

  factory PagePagination.fromJson(
      Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$PagePaginationFromJson(json, fromJsonT);

  PagePagination<T> copyWith({
    bool? hasNext,
    List<T>? content,
  }) {
    return PagePagination<T>(
      hasNext: hasNext ?? this.hasNext,
      content: content ?? this.content,
    );
  }
}

class PagePaginationRefetchingMore<T> extends PagePagination<T> {
  PagePaginationRefetchingMore({
    required super.hasNext,
    required super.content,
  });
}