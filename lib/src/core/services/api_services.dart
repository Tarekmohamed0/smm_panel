// import retrofit package
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:retrofit/retrofit.dart';
import 'package:smm_panel/src/core/constants/constants.dart';

import '../middleware/services_model.dart';

part 'api_services.g.dart';

@RestApi(baseUrl: Constant.baseUrl)
abstract class ApiServices {
  factory ApiServices(Dio dio, {String baseUrl}) = _ApiServices;
  // @POST("user/auth/register")
  // Future<UserModel> register(
  //   @Field() String name,
  //   @Field() String email,
  //   @Field() String password,
  //   @Field() String password_confirmation,
  // );

  @GET('')
  Future<List<ServicesModel>> getServices(
    @Query('key') String apiToken,
    @Query('action') String action,
  );
}
