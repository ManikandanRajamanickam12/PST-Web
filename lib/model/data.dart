import 'package:json_annotation/json_annotation.dart';
import 'package:main/model/qmodel.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  @JsonKey(name: "Questions")
  List<Questions>? questions;

  @JsonKey(name: "SegmentNames")
  List<String>? segmentNames;
  @JsonKey(name: "SegmentsCount")
  List<int>? segmentsCount;
  @JsonKey(name: "Symptoms")
  List<String>? symptoms;
  List<String>? feedback;
  String? version;

  Data(
      {this.questions,
      this.segmentNames,
      this.segmentsCount,
      this.symptoms,
      this.feedback,
      this.version});

  bool get isEmpty {
    if (questions != null) {
      if (questions!.isEmpty) {
        return true;
      }
    }
    return false;
  }

  // @override
  // toString() {
  //   return "questions len() : ${questions?.length} \nfeedback len() : ${feedback?.length}";
  // }

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  Map<String, dynamic> toJson() => _$DataToJson(this);
}
