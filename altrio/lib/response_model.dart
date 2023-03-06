import 'package:json_annotation/json_annotation.dart';

part 'response_model.g.dart';


@JsonSerializable()
class ResponseModel extends Object {

  @JsonKey(name: 'id')
  String id;

  @JsonKey(name: 'object')
  String object;

  @JsonKey(name: 'created')
  int created;

  @JsonKey(name: 'model')
  String model;

  @JsonKey(name: 'choices')
  List<Choices> choices;

  @JsonKey(name: 'usage')
  Usage usage;

  ResponseModel(this.id,this.object,this.created,this.model,this.choices,this.usage,);

  factory ResponseModel.fromJson(Map<String, dynamic> srcJson) => _$ResponseModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ResponseModelToJson(this);

}


@JsonSerializable()
class Choices extends Object {

  @JsonKey(name: 'text')
  String text;

  @JsonKey(name: 'index')
  int index;

  @JsonKey(name: 'finish_reason')
  String finishReason;

  Choices(this.text,this.index,this.finishReason,);

  factory Choices.fromJson(Map<String, dynamic> srcJson) => _$ChoicesFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ChoicesToJson(this);

}


@JsonSerializable()
class Usage extends Object {

  @JsonKey(name: 'prompt_tokens')
  int promptTokens;

  @JsonKey(name: 'completion_tokens')
  int completionTokens;

  @JsonKey(name: 'total_tokens')
  int totalTokens;

  Usage(this.promptTokens,this.completionTokens,this.totalTokens,);

  factory Usage.fromJson(Map<String, dynamic> srcJson) => _$UsageFromJson(srcJson);

  Map<String, dynamic> toJson() => _$UsageToJson(this);

}


