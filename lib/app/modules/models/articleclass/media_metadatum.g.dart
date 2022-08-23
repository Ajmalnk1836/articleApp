// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_metadatum.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MediaMetadatum _$MediaMetadatumFromJson(Map<String, dynamic> json) =>
    MediaMetadatum(
      url: json['url'] as String?,
      format: json['format'] as String?,
      height: json['height'] as int?,
      width: json['width'] as int?,
    );

Map<String, dynamic> _$MediaMetadatumToJson(MediaMetadatum instance) =>
    <String, dynamic>{
      'url': instance.url,
      'format': instance.format,
      'height': instance.height,
      'width': instance.width,
    };
