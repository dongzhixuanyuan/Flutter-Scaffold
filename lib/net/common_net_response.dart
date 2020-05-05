abstract class NetResponse<T> {
  final int code;
  final String msg;
  final T data;

  const NetResponse(this.code, this.msg, this.data);
}
