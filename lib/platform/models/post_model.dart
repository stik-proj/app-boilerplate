import 'package:json_annotation/json_annotation.dart';

part 'post_model.g.dart';

@JsonSerializable()
class PostModel {
  int id;
  String boardType;
  String status;
  String title;
  String writerName;
  String email;
  String content;
  String readAllow;
  String meta;
  String reserved;
  String attach;
  int readCount;
  int commentCount;
  String ip;
  String showStartDate;
  String showEndDate;
  int createdId;
  String createdBy;
  String createdDate;
  String lastModifiedBy;
  String lastModifiedDate;
  bool isChecked;
  bool isRequired;

  PostModel({
    required this.id,
    required this.boardType,
    required this.status,
    required this.title,
    required this.writerName,
    required this.email,
    required this.content,
    required this.readAllow,
    required this.meta,
    required this.reserved,
    required this.attach,
    required this.readCount,
    required this.commentCount,
    required this.ip,
    required this.showStartDate,
    required this.showEndDate,
    required this.createdId,
    required this.createdBy,
    required this.createdDate,
    required this.lastModifiedBy,
    required this.lastModifiedDate,
    this.isChecked = false,
    this.isRequired = false,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) => _$PostModelFromJson(json);

  Map<String, dynamic> toJson() => _$PostModelToJson(this);
}
