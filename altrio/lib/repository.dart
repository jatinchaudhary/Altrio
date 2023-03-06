import 'package:altrio/request_model.dart';
import 'package:altrio/response_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'repository.g.dart';

@RestApi(baseUrl: "https://api.openai.com/v1")
abstract class ApiClient {
  factory ApiClient(Dio dio,{String baseUrl}) = _ApiClient;




  @POST("/completions")
  Future<ResponseModel> postCompleted(
        @Header('Authorization') String token,
         @Body() RequestModel requestModel

      );



}