// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SharedListImpl _$$SharedListImplFromJson(Map<String, dynamic> json) =>
    _$SharedListImpl(
      id: json['id'] as String?,
      ownerId: json['ownerId'] as String,
      title: json['title'] as String,
      items: (json['items'] as List<dynamic>)
          .map((e) =>
              e == null ? null : ListItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      type: $enumDecode(_$ListTypeEnumMap, json['type']),
      allowedUsersIds: (json['allowedUsersIds'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$SharedListImplToJson(_$SharedListImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ownerId': instance.ownerId,
      'title': instance.title,
      'items': instance.items,
      'type': _$ListTypeEnumMap[instance.type]!,
      'allowedUsersIds': instance.allowedUsersIds,
    };

const _$ListTypeEnumMap = {
  ListType.todo: 0,
  ListType.shopping: 1,
};
