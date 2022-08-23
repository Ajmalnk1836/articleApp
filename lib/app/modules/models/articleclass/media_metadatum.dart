import 'package:json_annotation/json_annotation.dart';

part 'media_metadatum.g.dart';

@JsonSerializable()
class MediaMetadatum {
	String? url;
	String? format;
	int? height;
	int? width;

	MediaMetadatum({this.url, this.format, this.height, this.width});

	factory MediaMetadatum.fromJson(Map<String, dynamic> json) {
		return _$MediaMetadatumFromJson(json);
	}

	Map<String, dynamic> toJson() => _$MediaMetadatumToJson(this);
}
