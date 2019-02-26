import 'sign_in.dart';
import 'package:password_reminder/api/api_map.dart';

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


class BaseResponse<T> {
  ResponseMeta meta;
  T content;

  BaseResponse(this.meta, this.content);
  factory BaseResponse.fromJson(Map data, url) {
    return BaseResponse(ResponseMeta.fromJson(data['meta']), ApiMap().urlModelRel[url](data['content']));
  }
}