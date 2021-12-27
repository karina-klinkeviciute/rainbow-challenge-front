class ApiResponse<T> {
  final T? result;
  final bool isSuccess;
  final String? errorMessage;

  ApiResponse(this.result, this.isSuccess, this.errorMessage);
}
