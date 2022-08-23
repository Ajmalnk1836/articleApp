import 'package:json_annotation/json_annotation.dart';

import 'result.dart';

part 'articleclass.g.dart';

@JsonSerializable()
class Articleclass {
	String? status;
	String? copyright;
	@JsonKey(name: 'num_results') 
	int? numResults;
	List<Result>? results;

	Articleclass({
		this.status, 
		this.copyright, 
		this.numResults, 
		this.results, 
	});

	factory Articleclass.fromJson(Map<String, dynamic> json) {
		return _$ArticleclassFromJson(json);
	}

	Map<String, dynamic> toJson() => _$ArticleclassToJson(this);
}
