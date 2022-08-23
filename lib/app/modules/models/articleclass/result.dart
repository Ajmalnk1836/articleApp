import 'package:json_annotation/json_annotation.dart';

import 'media.dart';

part 'result.g.dart';

@JsonSerializable()
class Result {
	String? uri;
	String? url;
	int? id;
	@JsonKey(name: 'asset_id') 
	int? assetId;
	String? source;
	@JsonKey(name: 'published_date') 
	String? publishedDate;
	String? updated;
	String? section;
	String? subsection;
	String? nytdsection;
	@JsonKey(name: 'adx_keywords') 
	String? adxKeywords;
	dynamic column;
	String? byline;
	String? type;
	String? title;
	String? abstract;
	@JsonKey(name: 'des_facet') 
	List<String>? desFacet;
	@JsonKey(name: 'org_facet') 
	List<String>? orgFacet;
	@JsonKey(name: 'per_facet') 
	List<String>? perFacet;
	@JsonKey(name: 'geo_facet') 
	List<dynamic>? geoFacet;
	List<Media>? media;
	@JsonKey(name: 'eta_id') 
	int? etaId;

	Result({
		this.uri, 
		this.url, 
		this.id, 
		this.assetId, 
		this.source, 
		this.publishedDate, 
		this.updated, 
		this.section, 
		this.subsection, 
		this.nytdsection, 
		this.adxKeywords, 
		this.column, 
		this.byline, 
		this.type, 
		this.title, 
		this.abstract, 
		this.desFacet, 
		this.orgFacet, 
		this.perFacet, 
		this.geoFacet, 
		this.media, 
		this.etaId, 
	});

	factory Result.fromJson(Map<String, dynamic> json) {
		return _$ResultFromJson(json);
	}

	Map<String, dynamic> toJson() => _$ResultToJson(this);
}
