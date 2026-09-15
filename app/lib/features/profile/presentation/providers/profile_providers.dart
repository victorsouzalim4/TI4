import 'package:influencia/features/profile/data/datasources/mock_profile_data_source.dart';
import 'package:influencia/features/profile/data/datasources/profile_data_source.dart';
import 'package:influencia/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:influencia/features/profile/domain/entities/profile.dart';
import 'package:influencia/features/profile/domain/repositories/profile_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'profile_providers.g.dart';

@riverpod
ProfileDataSource profileDataSource(Ref ref) {
  // Trocar por RemoteProfileDataSource(ref.watch(dioProvider)) quando o
  // backend Vortex estiver no ar.
  return MockProfileDataSource();
}

@riverpod
ProfileRepository profileRepository(Ref ref) {
  return ProfileRepositoryImpl(ref.watch(profileDataSourceProvider));
}

@riverpod
Future<Profile> profile(Ref ref) async {
  final result = await ref.watch(profileRepositoryProvider).getProfile();
  return result.getOrThrow();
}
