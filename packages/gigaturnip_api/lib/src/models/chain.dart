import 'package:json_annotation/json_annotation.dart';
import 'package:gigaturnip_api/gigaturnip_api.dart';

part 'chain.g.dart';

@JsonSerializable()
class Chain {
  final int id;
  final String name;
  final String description;
  final int campaign;

  const Chain({
    required this.id,
    required this.name,
    required this.description,
    required this.campaign,
  });

  factory Chain.fromJson(Map<String, dynamic> json) {
    try {
      return _$ChainFromJson(json);
    } on Exception catch (e) {
      throw JsonParseException();
    }
  }
}
