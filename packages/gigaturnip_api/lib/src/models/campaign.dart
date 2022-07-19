import 'package:json_annotation/json_annotation.dart';
import 'package:gigaturnip_api/gigaturnip_api.dart';

part 'campaign.g.dart';

@JsonSerializable()
class Campaign {
  final int id;
  final String name;
  final String description;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool open;
  final int? defaultTrack;
  final List<int> managers;

  Campaign({
    required this.id,
    required this.name,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
    required this.open,
    required this.defaultTrack,
    required this.managers,
  });

  factory Campaign.fromJson(Map<String, dynamic> json){
    try {
      return _$CampaignFromJson(json);
    } on Exception catch (e) {
      throw JsonParseException();
    }
  }
}