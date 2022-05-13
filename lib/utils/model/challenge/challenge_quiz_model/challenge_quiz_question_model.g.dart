// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge_quiz_question_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Question _$QuestionFromJson(Map<String, dynamic> json) => Question(
      uuid: json['uuid'] as String,
      question: json['question'] as String,
      answers: (json['answers'] as List<dynamic>?)
          ?.map((e) => Answer.fromJson(e as Map<String, dynamic>))
          .toList(),
      is_answered: json['is_answered'] as bool,
    );

Map<String, dynamic> _$QuestionToJson(Question instance) => <String, dynamic>{
      'uuid': instance.uuid,
      'question': instance.question,
      'answers': instance.answers?.map((e) => e.toJson()).toList(),
      'is_answered': instance.is_answered,
    };
