import 'package:influencia/core/constants/app_constants.dart';
import 'package:influencia/features/profile/data/datasources/profile_data_source.dart';
import 'package:influencia/features/profile/data/models/profile_model.dart';
import 'package:influencia/features/profile/domain/entities/profile.dart';

/// Fonte de dados em memoria usada enquanto o backend Vortex nao existe.
class MockProfileDataSource implements ProfileDataSource {
  static const ProfileModel _profile = ProfileModel(
    name: 'Marina Costa',
    handle: '@marinacria',
    niche: 'Criação de conteúdo e produtividade',
    scriptTone: 'Descontraído, direto e com humor leve',
    commentsAnalyzed: 12480,
    scriptsGenerated: 2,
    platforms: [
      PlatformConnectionModel(
        platform: SocialPlatform.youtube,
        isConnected: true,
        handle: '@marinacria',
      ),
      PlatformConnectionModel(
        platform: SocialPlatform.instagram,
        isConnected: true,
        handle: '@marina.cria',
      ),
      PlatformConnectionModel(
        platform: SocialPlatform.tiktok,
        isConnected: false,
      ),
    ],
  );

  @override
  Future<ProfileModel> fetchProfile() async {
    await Future<void>.delayed(AppConstants.mockDataSourceDelay);
    return _profile;
  }
}
