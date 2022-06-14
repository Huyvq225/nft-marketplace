import 'package:nft_marketplace/src/core/models/base_error_model.dart';

///Harvey handle later
class BaseResponseModel<T> {
  const BaseResponseModel(
      {this.isSuccess = false, this.response, this.data, this.errorModel});

  factory BaseResponseModel.fromJson(Map<String, dynamic> _json) =>
      _$WrapperFromJson(_json);

  final bool isSuccess;
  final String? response;
  final T? data;
  final BaseErrorModel? errorModel;
}

BaseResponseModel<T> _$WrapperFromJson<T>(
    Map<String, dynamic> _json) {

  final _dataKey = (T as BaseDataModel).name;
  return BaseResponseModel<T>(
    isSuccess: (_json['response'] as String?) == 'OK',
    response: _json['response'] as String?,
    errorModel: BaseErrorModel.fromJson(_json['error'] as Map<String, dynamic>),
    data: (T as BaseDataModel).fromJson(_json[_dataKey]),
  );
}

abstract class BaseDataModel<T> {
  String get name;

  T fromJson(Map<String, dynamic> json);
}
