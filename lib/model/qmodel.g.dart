// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qmodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Questions _$QuestionsFromJson(Map<String, dynamic> json) => Questions(
      question: json['question'] as String?,
      answers:
          (json['answers'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$QuestionsToJson(Questions instance) => <String, dynamic>{
      'question': instance.question,
      'answers': instance.answers,
    };
