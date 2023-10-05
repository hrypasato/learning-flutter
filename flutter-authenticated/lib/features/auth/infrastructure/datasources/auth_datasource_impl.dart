import 'package:dio/dio.dart';
import 'package:teslo_shop/config/constants/environment.dart';
import 'package:teslo_shop/features/auth/domain/domain.dart';
import 'package:teslo_shop/features/auth/infrastructure/infrastructure.dart';

class AuthDataSourceImpl extends AuthDataSource {
  final dio = Dio(
    BaseOptions(baseUrl: Environment.apiUrl),
  );

  @override
  Future<User> checkAuthStatus(String token) async {
    try {
      final response = await dio.get('/auth/check-status',
          options: Options(headers: {
            'Authorization': 'Bearer $token',
          }));

      return UserMapper.userJsonToEntity(response.data);
    } on DioError catch (e) {
      if (e.response?.statusCode == 401) {
        throw CustomError(message: 'Token incorrecto');
      }

      if (e.type == DioErrorType.connectionTimeout) {
        throw CustomError(message: 'Revisar la conexion a internet');
      }
      throw Exception();
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<User> login(String email, String password) async {
    try {
      final response = await dio.post('/auth/login', data: {
        'email': email,
        'password': password,
      });

      return UserMapper.userJsonToEntity(response.data);
    } on DioError catch (e) {
      if (e.response?.statusCode == 401) {
        throw CustomError(
            message: e.response?.data['message'] ?? 'Credenciales incorrectas');
      }

      if (e.type == DioErrorType.connectionTimeout) {
        throw CustomError(message: 'Revisar la conexion a internet');
      }
      throw Exception();
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<User> register(String email, String password, String fullName) {
    // TODO: implement register
    throw UnimplementedError();
  }
}
