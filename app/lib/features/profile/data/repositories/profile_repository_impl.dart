import 'package:influencia/core/utils/result.dart';
import 'package:influencia/features/profile/data/datasources/profile_data_source.dart';
import 'package:influencia/features/profile/domain/entities/profile.dart';
import 'package:influencia/features/profile/domain/repositories/profile_repository.dart';

/// Implementacao de [ProfileRepository] baseada em um [ProfileDataSource].
class ProfileRepositoryImpl implements ProfileRepository {
  const new(this._dataSource);

  final ProfileDataSource _dataSource;

  @override
  Future<Result<Profile>> getProfile() {
    return guard(() async {
      final model = await _dataSource.fetchProfile();
      return model.toEntity();
    });
  }
}
