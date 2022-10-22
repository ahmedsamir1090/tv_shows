import 'package:json_annotation/json_annotation.dart';

part 'app_model.g.dart';

@JsonSerializable()
class Model {
  int? id;
  String? url;
  String? name;
  String? type;
  String? language;
  List<String>? genres;
  String? status;
  int? runtime;
  int? averageRuntime;
  String? premiered;
  String? ended;
  String? officialSite;
  Schedule? schedule;
  Rating? rating;
  int? weight;
  Network? network;
  Externals? externals;
  Image? image;
  String? summary;
  int? updated;
  Links? lLinks;
  @JsonKey(name: '_embedded')
  Embedded? embedded;

  Model(
      {this.id,
      this.url,
      this.name,
      this.type,
      this.language,
      this.genres,
      this.status,
      this.runtime,
      this.averageRuntime,
      this.premiered,
      this.ended,
      this.officialSite,
      this.schedule,
      this.rating,
      this.weight,
      this.network,
      this.externals,
      this.image,
      this.summary,
      this.updated,
      this.lLinks,
      this.embedded});

  factory Model.fromJson(Map<String, dynamic> json) => _$ModelFromJson(json);
}

@JsonSerializable()
class Schedule {
  String? time;
  List<String>? days;

  Schedule({this.time, this.days});

  factory Schedule.fromJson(Map<String, dynamic> json) =>
      _$ScheduleFromJson(json);
}

@JsonSerializable()
class Rating {
  double? average;

  Rating({this.average});

  factory Rating.fromJson(Map<String, dynamic> json) => _$RatingFromJson(json);
}

@JsonSerializable()
class Network {
  int? id;
  String? name;
  Country? country;
  String? officialSite;

  Network({this.id, this.name, this.country, this.officialSite});

  factory Network.fromJson(Map<String, dynamic> json) =>
      _$NetworkFromJson(json);
}

@JsonSerializable()
class Country {
  String? name;
  String? code;
  String? timezone;

  Country({this.name, this.code, this.timezone});

  factory Country.fromJson(Map<String, dynamic> json) =>
      _$CountryFromJson(json);
}

@JsonSerializable()
class Externals {
  int? tvrage;
  int? thetvdb;
  String? imdb;

  Externals({this.tvrage, this.thetvdb, this.imdb});

  factory Externals.fromJson(Map<String, dynamic> json) =>
      _$ExternalsFromJson(json);
}

@JsonSerializable()
class Image {
  String? medium;
  String? original;

  Image({this.medium, this.original});

  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);
}

@JsonSerializable()
class Links {
  Self? self;
  Self? previousepisode;

  Links({this.self, this.previousepisode});

  factory Links.fromJson(Map<String, dynamic> json) => _$LinksFromJson(json);
}

@JsonSerializable()
class Self {
  String? href;

  Self({this.href});

  factory Self.fromJson(Map<String, dynamic> json) => _$SelfFromJson(json);
}

@JsonSerializable()
class Embedded {
  List<Seasons>? seasons;
  List<Cast>? cast;
  List<Crew>? crew;
  List<Episodes>? episodes;

  Embedded({this.seasons, this.cast, this.crew, this.episodes});

  factory Embedded.fromJson(Map<String, dynamic> json) =>
      _$EmbeddedFromJson(json);
}

@JsonSerializable()
class Seasons {
  int? id;
  String? url;
  int? number;
  String? name;
  int? episodeOrder;
  String? premiereDate;
  String? endDate;
  Network? network;
  Image? image;
  String? summary;
  Links? lLinks;

  Seasons(
      {this.id,
      this.url,
      this.number,
      this.name,
      this.episodeOrder,
      this.premiereDate,
      this.endDate,
      this.network,
      this.image,
      this.summary,
      this.lLinks});

  factory Seasons.fromJson(Map<String, dynamic> json) =>
      _$SeasonsFromJson(json);
}

@JsonSerializable()
class Cast {
  Person? person;
  Character? character;
  bool? self;
  bool? voice;

  Cast({this.person, this.character, this.self, this.voice});

  factory Cast.fromJson(Map<String, dynamic> json) => _$CastFromJson(json);
}

@JsonSerializable()
class Crew {
  String? type;
  Person? person;

  Crew({
    this.type,
    this.person,
  });

  factory Crew.fromJson(Map<String, dynamic> json) => _$CrewFromJson(json);
}

@JsonSerializable()
class Person {
  int? id;
  String? url;
  String? name;
  Country? country;
  String? birthday;
  String? gender;
  Image? image;
  int? updated;
  Links? lLinks;

  Person(
      {this.id,
      this.url,
      this.name,
      this.country,
      this.birthday,
      this.gender,
      this.image,
      this.updated,
      this.lLinks});

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);
}

@JsonSerializable()
class Character {
  int? id;
  String? url;
  String? name;
  Image? image;
  Links? lLinks;

  Character({this.id, this.url, this.name, this.image, this.lLinks});

  factory Character.fromJson(Map<String, dynamic> json) =>
      _$CharacterFromJson(json);
}

@JsonSerializable()
class Episodes {
  int? id;
  String? url;
  String? name;
  int? season;
  int? number;
  String? type;
  String? airdate;
  String? airtime;
  String? airstamp;
  int? runtime;
  Rating? rating;
  Image? image;
  String? summary;
  Links? lLinks;

  Episodes(
      {this.id,
      this.url,
      this.name,
      this.season,
      this.number,
      this.type,
      this.airdate,
      this.airtime,
      this.airstamp,
      this.runtime,
      this.rating,
      this.image,
      this.summary,
      this.lLinks});

  factory Episodes.fromJson(Map<String, dynamic> json) =>
      _$EpisodesFromJson(json);
}
