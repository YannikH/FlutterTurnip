import 'package:json_annotation/json_annotation.dart';
import 'package:gigaturnip_api/gigaturnip_api.dart';

part 'pagination_wrapper.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class PaginationWrapper<T> {
  final int count;
  final String? next;
  final String? previous;
  final List<T> results;

  PaginationWrapper({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  factory PaginationWrapper.fromJson(json, T Function(Object? json) fromJsonT) {
    try {
      return _$PaginationWrapperFromJson(json, fromJsonT);
    } on Exception catch (e) {
      throw JsonParseException();
    }
  }
}
