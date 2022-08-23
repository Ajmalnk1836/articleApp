// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'articleclass.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Articleclass _$ArticleclassFromJson(Map<String, dynamic> json) => Articleclass(
      status: json['status'] as String?,
      copyright: json['copyright'] as String?,
      numResults: json['num_results'] as int?,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ArticleclassToJson(Articleclass instance) =>
    <String, dynamic>{
      'status': instance.status,
      'copyright': instance.copyright,
      'num_results': instance.numResults,
      'results': instance.results,
    };
