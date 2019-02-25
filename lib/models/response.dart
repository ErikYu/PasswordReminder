import 'sign_in.dart';

class ResponseMeta {
  int code;
  List internalMsg;
  String userMsg;

  ResponseMeta({
    this.code,
    this.internalMsg,
    this.userMsg,
  });

  factory ResponseMeta.fromJson(Map meta) {
    return ResponseMeta(
      code: meta['code'],
      internalMsg: meta['internal_msg'],
      userMsg: meta['user_msg']
    );
  }
}


class BaseResponse {
  ResponseMeta meta;
  Map data;

  BaseResponse(this.meta, this.data);
  factory BaseResponse.fromJson(Map data) {
    return BaseResponse(ResponseMeta.fromJson(data['meta']), data['data']);
  }
}