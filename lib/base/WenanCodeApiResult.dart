
// ignore: constant_identifier_names
enum ApiStatus { SUCCESS, ERROR, LOADING }


class ApiResult<T>{
  ApiResult(final ApiStatus status,final T? data,final int? errorCode,final String? message);


}
class ApiResultSuccess<T> extends ApiResult<T>{
  ApiResultSuccess(final T? data, final String? message) : super(ApiStatus.SUCCESS, data, 0, message);
}

class ApiResultError<T> extends ApiResult<T>{
  ApiResultError(final int? errorCode,final String? message) : super(ApiStatus.ERROR, null, errorCode, message);
}

class ApiResultLoading<T> extends ApiResult<T>{
  ApiResultLoading({final T? data,final String? message}) : super(ApiStatus.LOADING, null, 0, message);
}