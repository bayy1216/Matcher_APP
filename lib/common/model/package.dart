import 'package:freezed_annotation/freezed_annotation.dart';

part 'package.g.dart';
part 'package.freezed.dart';

@freezed
class Package with _$Package{
  factory Package({
    required String name,
    required String description,
    String? homepage,
    String? repository,
    required List<String> authors,
    required String version,
    String? license,
    required bool isMarkdown,
    required bool isSdk,
    required bool isDirectDependency,
  }) = _Package;

  factory Package.fromJson(Map<String, Object?> json)=> _$PackageFromJson(json);
}