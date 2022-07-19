import 'package:json_annotation/json_annotation.dart';
import 'package:gigaturnip_api/gigaturnip_api.dart';

part 'case.g.dart';

@JsonSerializable()
class Case {
  final int id;
  final DateTime createdAt;
  final DateTime updatedAt;

  Case({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Case.fromJson(Map<String, dynamic> json) {
    try {
      return _$CaseFromJson(json);
    } on Exception catch (e) {
      throw JsonParseException();
    }
  }
}
