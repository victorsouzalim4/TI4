// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) =>
    _ProfileModel(
      name: json['name'] as String,
      handle: json['handle'] as String,
      niche: json['niche'] as String,
      scriptTone: json['scriptTone'] as String,
      commentsAnalyzed: (json['commentsAnalyzed'] as num).toInt(),
      scriptsGenerated: (json['scriptsGenerated'] as num).toInt(),
      platforms: (json['platforms'] as List<dynamic>)
          .map(
            (e) => PlatformConnectionModel.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    );

Map<String, dynamic> _$ProfileModelToJson(_ProfileModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'handle': instance.handle,
      'niche': instance.niche,
      'scriptTone': instance.scriptTone,
      'commentsAnalyzed': instance.commentsAnalyzed,
      'scriptsGenerated': instance.scriptsGenerated,
      'platforms': instance.platforms,
    };

_PlatformConnectionModel _$PlatformConnectionModelFromJson(
  Map<String, dynamic> json,
) => _PlatformConnectionModel(
  platform: $enumDecode(_$SocialPlatformEnumMap, json['platform']),
  isConnected: json['isConnected'] as bool,
  handle: json['handle'] as String?,
);

Map<String, dynamic> _$PlatformConnectionModelToJson(
  _PlatformConnectionModel instance,
) => <String, dynamic>{
  'platform': _$SocialPlatformEnumMap[instance.platform]!,
  'isConnected': instance.isConnected,
  'handle': instance.handle,
};

const _$SocialPlatformEnumMap = {
  SocialPlatform.youtube: 'youtube',
  SocialPlatform.instagram: 'instagram',
  SocialPlatform.tiktok: 'tiktok',
};
