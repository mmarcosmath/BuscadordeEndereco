import 'package:buscarcep/app/services/models/address.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'address_repository.g.dart';

@RestApi(baseUrl: "https://cep.awesomeapi.com.br/json")
abstract class AddressRepository {
  factory AddressRepository(Dio dio, {String baseUrl}) = _AddressRepository;

  @GET('/{id}')
  Future<AddressModel> findById(@Path('id') String id);
}
