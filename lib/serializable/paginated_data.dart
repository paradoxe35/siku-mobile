import 'package:json_annotation/json_annotation.dart';

part 'paginated_data.g.dart';

@JsonSerializable()
class PaginatedData {
  PaginatedData(this.data, this.links, this.meta);

  @JsonKey(required: true)
  List<dynamic> data;

  @JsonKey(required: true)
  Links links;

  @JsonKey(required: true)
  Meta meta;

  factory PaginatedData.fromJson(Map<String, dynamic> json) =>
      _$PaginatedDataFromJson(json);

  Map<String, dynamic> toJson() => _$PaginatedDataToJson(this);
}

@JsonSerializable()
class Links {
  Links(
    this.first,
    this.last,
    this.next,
    this.prev,
  );

  @JsonKey(required: true)
  String first;

  @JsonKey(required: true)
  String last;

  @JsonKey(required: true, nullable: true)
  String prev;

  @JsonKey(required: true, nullable: true)
  String next;

  factory Links.fromJson(Map<String, dynamic> json) => _$LinksFromJson(json);

  Map<String, dynamic> toJson() => _$LinksToJson(this);
}

@JsonSerializable()
class Meta {
  Meta(
    this.currentPage,
    this.from,
    this.lastPage,
    this.path,
    this.perPage,
    this.to,
    this.total,
  );

  @JsonKey(required: true, name: 'current_page')
  int currentPage;

  @JsonKey(required: true)
  int from;

  @JsonKey(required: true, name: 'last_page')
  int lastPage;

  @JsonKey(required: true)
  String path;

  @JsonKey(required: true, name: 'per_page')
  int perPage;

  @JsonKey(required: true)
  int to;

  @JsonKey(required: true)
  int total;

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);

  Map<String, dynamic> toJson() => _$MetaToJson(this);
}
