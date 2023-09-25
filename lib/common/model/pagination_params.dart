import 'package:json_annotation/json_annotation.dart';


part 'pagination_params.g.dart';


@JsonSerializable()
class PaginationQueries {
  final int page;

  const PaginationQueries({
    required this.page,
  });

  PaginationQueries copyWith({
    int? page,
  }) {
    return PaginationQueries(
      page: page ?? this.page,
    );
  }

  factory PaginationQueries.fromJson(Map<String, dynamic> json) =>
      _$PaginationQueriesFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationQueriesToJson(this);
}