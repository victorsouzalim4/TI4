import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:influencia/features/profile/domain/entities/profile.dart';

part 'profile_model.freezed.dart';
part 'profile_model.g.dart';

/// Representacao serializavel do perfil retornado pelo backend.
@freezed
abstract class ProfileModel with _$ProfileModel {
  const factory({
    required String name,
    required String handle,
    required String niche,
    required String scriptTone,
    required int commentsAnalyzed,
    required int scriptsGenerated,
    required List<PlatformConnectionModel> platforms,
  }) = _ProfileModel;

  const new _();

  factory fromJson(Map<String, dynamic> json) => _$ProfileModelFromJson(json);

  Profile toEntity() {
    return Profile(
      name: name,
      handle: handle,
      niche: niche,
      scriptTone: scriptTone,
      commentsAnalyzed: commentsAnalyzed,
      scriptsGenerated: scriptsGenerated,
      platforms: platforms.map((platform) => platform.toEntity()).toList(),
    );
  }
}

@freezed
abstract class PlatformConnectionModel with _$PlatformConnectionModel {
  const factory({
    required SocialPlatform platform,
    required bool isConnected,
    String? handle,
  }) = _PlatformConnectionModel;

  const new _();

  factory fromJson(Map<String, dynamic> json) =>
      _$PlatformConnectionModelFromJson(json);

  PlatformConnection toEntity() {
    return PlatformConnection(
      platform: platform,
      isConnected: isConnected,
      handle: handle,
    );
  }
}
