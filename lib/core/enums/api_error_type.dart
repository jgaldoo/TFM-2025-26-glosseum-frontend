import 'package:dio/dio.dart';

enum ApiErrorType {
  serverOffline(errorText: 'El servidor no está en línea. Inténtalo de nuevo '
      'más tarde.'),
  timeout(errorText: 'El tiempo límite para enviar y recibir datos'
      ' se ha excedido. Puede que se deba a una conexión lenta.'),
  badRequest(errorText: 'La petición no está bien formada o tiene campos '
      'faltantes.'),
  unauthorized(errorText: 'Es necesario identificarse para realizar esta '
      'acción.'),
  forbidden(errorText: 'No tienes los permisos para realizar esta acción.'),
  notFound(errorText: 'El camino al que has enviado la petición no existe.'),
  serverError(errorText: 'Algo fue mal al intentar procesar la petición.'
      'Esta excepción es culpa del servidor.'),
  notImplemented(errorText: 'Aún no se ha implementado esta funcionalidad.'),
  unknown(errorText: 'Error de API desconocido.');

  final String errorText;

  const ApiErrorType({required this.errorText});
}

ApiErrorType dioErrorToApiErrorType(DioException e) {
  switch(e.type) {
    case DioExceptionType.connectionTimeout ||
    DioExceptionType.connectionError:
      return ApiErrorType.serverOffline;

    case DioExceptionType.sendTimeout ||
    DioExceptionType.receiveTimeout:
      return ApiErrorType.timeout;

    case DioExceptionType.badResponse:
      final status = e.response?.statusCode ?? 0;

      if (status == 501) return ApiErrorType.notImplemented;
      if (status >= 500) return ApiErrorType.serverError;
      if (status == 401) return ApiErrorType.unauthorized;
      if (status == 403) return ApiErrorType.forbidden;
      if (status == 404) return ApiErrorType.notFound;
      if (status >= 400) return ApiErrorType.badRequest;

      return ApiErrorType.unknown;

    default:
      return ApiErrorType.unknown;
  }
}
