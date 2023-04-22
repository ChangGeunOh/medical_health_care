import 'package:dio/dio.dart';
import 'package:medical_health_care/domain/model/account_data.dart';
import 'package:medical_health_care/domain/model/user_data.dart';
import 'package:medical_health_care/domain/repository/network_source.dart';
import 'package:retrofit/retrofit.dart';

part 'network_source_impl.g.dart';

@RestApi()
abstract class NetworkSourceImpl extends NetworkSource {

  factory NetworkSourceImpl(Dio dio, {String baseUrl}) = _NetworkSourceImpl;

  @override
  @POST('/login')
  Future<UserData> login(@Body() Map<String, dynamic> loginData);


}