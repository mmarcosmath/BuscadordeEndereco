// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_repository.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _AddressRepository implements AddressRepository {
  _AddressRepository(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl ??= 'https://cep.awesomeapi.com.br/json';
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<AddressModel> findById(id) async {
    ArgumentError.checkNotNull(id, 'id');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('/$id',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = AddressModel.fromJson(_result.data);
    return value;
  }
}
