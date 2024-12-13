// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfigResp _$ConfigRespFromJson(Map<String, dynamic> json) => ConfigResp(
      community: json['community'] as String,
      version: json['version'] as String,
    );

Map<String, dynamic> _$ConfigRespToJson(ConfigResp instance) =>
    <String, dynamic>{
      'community': instance.community,
      'version': instance.version,
    };
