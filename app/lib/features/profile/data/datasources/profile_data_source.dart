import 'package:influencia/features/profile/data/models/profile_model.dart';

/// Contrato das fontes de dados do perfil.
abstract class ProfileDataSource {
  Future<ProfileModel> fetchProfile();
}
