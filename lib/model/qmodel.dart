import 'package:json_annotation/json_annotation.dart';

part 'qmodel.g.dart';

@JsonSerializable()
class Questions {
  String? question;
  List<String>? answers;

  Questions({this.question, this.answers});

  factory Questions.fromJson(Map<String, dynamic> json) =>
      _$QuestionsFromJson(json);
  Map<String, dynamic> toJson() => _$QuestionsToJson(this);
}
