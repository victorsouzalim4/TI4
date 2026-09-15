import 'package:influencia/core/utils/result.dart';
import 'package:influencia/features/profile/domain/entities/profile.dart';

/// Contrato de acesso ao perfil do influenciador.
abstract class ProfileRepository {
  Future<Result<Profile>> getProfile();
}
