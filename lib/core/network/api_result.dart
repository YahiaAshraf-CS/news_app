sealed class ApiResult <T> {

}

class ApiSuccess<T> extends ApiResult {
  T data;
  ApiSuccess(this.data);
}

class ApiError extends ApiResult {
  String message;
  ApiError(this.message);
}