// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recent_chat_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecentChatData _$RecentChatDataFromJson(Map<String, dynamic> json) =>
    RecentChatData(
      name: json['name'] as String,
      image: json['image'] as String,
      lastMessage: json['lastMessage'] as String,
      lastDate: json['lastDate'] as int?,
    );

Map<String, dynamic> _$RecentChatDataToJson(RecentChatData instance) =>
    <String, dynamic>{
      'name': instance.name,
      'lastMessage': instance.lastMessage,
      'image': instance.image,
      'lastDate': instance.lastDate,
    };
