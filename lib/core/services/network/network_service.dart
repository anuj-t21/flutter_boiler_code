import 'package:dio/dio.dart';
import 'package:flutter_boiler_code/core/services/network/response/network_response.dart';

enum RequestType { GET, POST, PUT, PATCH, DELETE }

class NetworkService {
  final dio = init();

  NetworkService._internal();

  static final _singleton = NetworkService._internal();

  factory NetworkService() => _singleton;

  static Dio init() {
    var dio = Dio(BaseOptions(
      baseUrl: "https:://NetworkService.call",
      receiveTimeout: const Duration(seconds: 60), // 60 seconds
      connectTimeout: const Duration(seconds: 60),
      sendTimeout: const Duration(seconds: 60),
    ));

    dio.interceptors.addAll({
      AuthInterceptor(dio),
    });
    dio.interceptors.addAll({
      Logging(dio),
    });

    return dio;
  }

  Future<NetworkResponse?> call(
      String url,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? body,
      RequestType requestType) async {
    late Response result;
    try {
      switch (requestType) {
        case RequestType.GET:
          {
            Options options = Options(headers: header);
            result = await dio.get(url,
                queryParameters: queryParameters, options: options);
            break;
          }
        case RequestType.POST:
          {
            Options options = Options(headers: header);
            result = await dio.post(url, data: body, options: options);
            break;
          }
        case RequestType.DELETE:
          {
            Options options = Options(headers: header);
            result =
                await dio.delete(url, data: queryParameters, options: options);
            break;
          }
        case RequestType.PUT:
        // TODO: Handle this case.
        case RequestType.PATCH:
        // TODO: Handle this case.
      }
      return NetworkResponse.success(result.data);
    } on DioException catch (error) {
      return NetworkResponse.error(error.message ?? '');
    } catch (error) {
      return NetworkResponse.error(error.toString());
    }
  }
}

class AuthInterceptor extends Interceptor {
  final Dio dio;

  AuthInterceptor(this.dio);

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    ///TODO: HANDLE TOKEN IN THIS WAY

    // var accessToken = await TokenRepository().getAccessToken();

    // if (accessToken != null) {
    // var expiration = await TokenRepository().getAccessTokenRemainingTime();

    // if (expiration.inSeconds < 60) {
    //   dio.interceptors.requestLock.lock();

    //   // Call the refresh endpoint to get a new token
    //   await UserService().refresh().then((response) async {
    //     await TokenRepository().persistAccessToken(response.accessToken);
    //     accessToken = response.accessToken;
    //   }).catchError((error, stackTrace) {
    //     handler.reject(error, true);
    //   }).whenComplete(() => dio.interceptors.requestLock.unlock());
    // }

    // options.headers['Authorization'] = 'Bearer $accessToken';
    // }
    return handler.next(options);
  }
}

class ErrorInterceptors extends Interceptor {
  final Dio dio;

  ErrorInterceptors(this.dio);

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        throw TimeOutException(err.requestOptions);
      case DioExceptionType.badResponse:
        switch (err.response?.statusCode) {
          case 400:
            throw BadRequestException(err.requestOptions);
          case 401:
            throw UnauthorizedException(err.requestOptions);
          case 404:
            throw NotFoundException(err.requestOptions);
          case 409:
            throw ConflictException(err.requestOptions);
          case 500:
            throw InternalServerErrorException(err.requestOptions);
        }
        break;
      case DioExceptionType.cancel:
        break;
      default:
        throw NoInternetConnectionException(err.requestOptions);
    }

    return handler.next(err);
  }
}

class BadRequestException extends DioException {
  BadRequestException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Invalid request';
  }
}

class InternalServerErrorException extends DioException {
  InternalServerErrorException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Unknown error occurred, please try again later.';
  }
}

class ConflictException extends DioException {
  ConflictException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Conflict occurred';
  }
}

class UnauthorizedException extends DioException {
  UnauthorizedException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Access denied';
  }
}

class NotFoundException extends DioException {
  NotFoundException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'The requested information could not be found';
  }
}

class NoInternetConnectionException extends DioException {
  NoInternetConnectionException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'No internet connection detected, please try again.';
  }
}

class TimeOutException extends DioException {
  TimeOutException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'The connection has timed out, please try again.';
  }
}

class Logging extends Interceptor {
  final Dio dio;
  Logging(this.dio);
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print('REQUEST[${options.method}] => PATH: ${options.path}');
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print(
      'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}',
    );
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    print(
      'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}',
    );
    return super.onError(err, handler);
  }
}

final Map<String, String> header = {
  'Content-type': 'application/json',
  'Accept': 'application/json',
  'client-secret': 'xyz',
  'client-id': 'abc',
  'package-name': 'com.sasa.abc',
  'platform': 'android',
  'Authorization': "access_token"
};
