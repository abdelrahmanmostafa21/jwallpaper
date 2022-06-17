// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_tab_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MainTabEntry _$MainTabEntryFromJson(Map<String, dynamic> json) => MainTabEntry(
      id: json['id'] as String,
      icon: json['icon'] as String?,
      type: json['type'] as String?,
      name: json['name'] as String? ?? '',
      visible: json['visible'] as bool? ?? true,
      visibleTitle: json['visibleTitle'] as bool? ?? true,
    );

Map<String, dynamic> _$MainTabEntryToJson(MainTabEntry instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'icon': instance.icon,
      'name': instance.name,
      'visible': instance.visible,
      'visibleTitle': instance.visibleTitle,
    };
