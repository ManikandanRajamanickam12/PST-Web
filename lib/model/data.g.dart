// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      questions: (json['Questions'] as List<dynamic>?)
          ?.map((e) => Questions.fromJson(e as Map<String, dynamic>))
          .toList(),
      segmentNames: (json['SegmentNames'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      segmentsCount: (json['SegmentsCount'] as List<dynamic>?)
          ?.map((e) => e as int)
          .toList(),
      symptoms: (json['Symptoms'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      feedback: (json['feedback'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      version: json['version'] as String?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'Questions': instance.questions,
      'SegmentNames': instance.segmentNames,
      'SegmentsCount': instance.segmentsCount,
      'Symptoms': instance.symptoms,
      'feedback': instance.feedback,
      'version': instance.version,
    };
