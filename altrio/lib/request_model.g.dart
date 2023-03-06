// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestModel _$RequestModelFromJson(Map<String, dynamic> json) => RequestModel(
      json['model'] as String,
      json['prompt'] as String,
      json['temperature'] as int,
      json['max_tokens'] as int,
    );

Map<String, dynamic> _$RequestModelToJson(RequestModel instance) =>
    <String, dynamic>{
      'model': instance.model,
      'prompt': instance.prompt,
      'temperature': instance.temperature,
      'max_tokens': instance.maxTokens,
    };
