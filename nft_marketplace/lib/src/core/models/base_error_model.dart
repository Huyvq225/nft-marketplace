class BaseErrorModel {
  BaseErrorModel({this.statusCode, this.code, this.message});

  factory BaseErrorModel.fromJson(Map<String, dynamic> json) {
    return BaseErrorModel(
        statusCode: json['status_code'] as int?,
        code: json['code'] as String?,
        message: json['message'] as String?);
  }

  final int? statusCode;
  final String? code;
  final String? message;
}
