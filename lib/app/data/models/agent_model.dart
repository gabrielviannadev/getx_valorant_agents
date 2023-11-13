// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AgentModel {
  final String? agentName;
  final String? agentDescriptio;
  final String? agentArtWork;
  final String? agentWallpaper;

  AgentModel({required this.agentName, required this.agentDescriptio, required this.agentArtWork, required this.agentWallpaper});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'displayName': agentName,
      'description': agentDescriptio,
      'displayIcon': agentArtWork,
      'fullPortrait': agentWallpaper,
    };
  }

  factory AgentModel.fromMap(Map<String, dynamic> map) {
    return AgentModel(
      agentName: map['displayName'],
      agentDescriptio: map['description'],
      agentArtWork: map['displayIcon'],
      agentWallpaper: map['fullPortrait'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AgentModel.fromJson(String source) => AgentModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
