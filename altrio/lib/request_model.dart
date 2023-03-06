import 'package:json_annotation/json_annotation.dart';

part 'request_model.g.dart';


@JsonSerializable()
class RequestModel extends Object {

  @JsonKey(name: 'model')
  String model;

  @JsonKey(name: 'prompt')
  String prompt;

  @JsonKey(name: 'temperature')
  int temperature;

  @JsonKey(name: 'max_tokens')
  int maxTokens;

  RequestModel(this.model,this.prompt,this.temperature,this.maxTokens,);

  factory RequestModel.fromJson(Map<String, dynamic> srcJson) => _$RequestModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$RequestModelToJson(this);

}