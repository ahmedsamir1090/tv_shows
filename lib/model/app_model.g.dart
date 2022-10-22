// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Model _$ModelFromJson(Map<String, dynamic> json) => Model(
      id: json['id'] as int?,
      url: json['url'] as String?,
      name: json['name'] as String?,
      type: json['type'] as String?,
      language: json['language'] as String?,
      genres:
          (json['genres'] as List<dynamic>?)?.map((e) => e as String).toList(),
      status: json['status'] as String?,
      runtime: json['runtime'] as int?,
      averageRuntime: json['averageRuntime'] as int?,
      premiered: json['premiered'] as String?,
      ended: json['ended'] as String?,
      officialSite: json['officialSite'] as String?,
      schedule: json['schedule'] == null
          ? null
          : Schedule.fromJson(json['schedule'] as Map<String, dynamic>),
      rating: json['rating'] == null
          ? null
          : Rating.fromJson(json['rating'] as Map<String, dynamic>),
      weight: json['weight'] as int?,
      network: json['network'] == null
          ? null
          : Network.fromJson(json['network'] as Map<String, dynamic>),
      externals: json['externals'] == null
          ? null
          : Externals.fromJson(json['externals'] as Map<String, dynamic>),
      image: json['image'] == null
          ? null
          : Image.fromJson(json['image'] as Map<String, dynamic>),
      summary: json['summary'] as String?,
      updated: json['updated'] as int?,
      lLinks: json['lLinks'] == null
          ? null
          : Links.fromJson(json['lLinks'] as Map<String, dynamic>),
      embedded: json['_embedded'] == null
          ? null
          : Embedded.fromJson(json['_embedded'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ModelToJson(Model instance) => <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'name': instance.name,
      'type': instance.type,
      'language': instance.language,
      'genres': instance.genres,
      'status': instance.status,
      'runtime': instance.runtime,
      'averageRuntime': instance.averageRuntime,
      'premiered': instance.premiered,
      'ended': instance.ended,
      'officialSite': instance.officialSite,
      'schedule': instance.schedule,
      'rating': instance.rating,
      'weight': instance.weight,
      'network': instance.network,
      'externals': instance.externals,
      'image': instance.image,
      'summary': instance.summary,
      'updated': instance.updated,
      'lLinks': instance.lLinks,
      '_embedded': instance.embedded,
    };

Schedule _$ScheduleFromJson(Map<String, dynamic> json) => Schedule(
      time: json['time'] as String?,
      days: (json['days'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$ScheduleToJson(Schedule instance) => <String, dynamic>{
      'time': instance.time,
      'days': instance.days,
    };

Rating _$RatingFromJson(Map<String, dynamic> json) => Rating(
      average: (json['average'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$RatingToJson(Rating instance) => <String, dynamic>{
      'average': instance.average,
    };

Network _$NetworkFromJson(Map<String, dynamic> json) => Network(
      id: json['id'] as int?,
      name: json['name'] as String?,
      country: json['country'] == null
          ? null
          : Country.fromJson(json['country'] as Map<String, dynamic>),
      officialSite: json['officialSite'] as String?,
    );

Map<String, dynamic> _$NetworkToJson(Network instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'country': instance.country,
      'officialSite': instance.officialSite,
    };

Country _$CountryFromJson(Map<String, dynamic> json) => Country(
      name: json['name'] as String?,
      code: json['code'] as String?,
      timezone: json['timezone'] as String?,
    );

Map<String, dynamic> _$CountryToJson(Country instance) => <String, dynamic>{
      'name': instance.name,
      'code': instance.code,
      'timezone': instance.timezone,
    };

Externals _$ExternalsFromJson(Map<String, dynamic> json) => Externals(
      tvrage: json['tvrage'] as int?,
      thetvdb: json['thetvdb'] as int?,
      imdb: json['imdb'] as String?,
    );

Map<String, dynamic> _$ExternalsToJson(Externals instance) => <String, dynamic>{
      'tvrage': instance.tvrage,
      'thetvdb': instance.thetvdb,
      'imdb': instance.imdb,
    };

Image _$ImageFromJson(Map<String, dynamic> json) => Image(
      medium: json['medium'] as String?,
      original: json['original'] as String?,
    );

Map<String, dynamic> _$ImageToJson(Image instance) => <String, dynamic>{
      'medium': instance.medium,
      'original': instance.original,
    };

Links _$LinksFromJson(Map<String, dynamic> json) => Links(
      self: json['self'] == null
          ? null
          : Self.fromJson(json['self'] as Map<String, dynamic>),
      previousepisode: json['previousepisode'] == null
          ? null
          : Self.fromJson(json['previousepisode'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LinksToJson(Links instance) => <String, dynamic>{
      'self': instance.self,
      'previousepisode': instance.previousepisode,
    };

Self _$SelfFromJson(Map<String, dynamic> json) => Self(
      href: json['href'] as String?,
    );

Map<String, dynamic> _$SelfToJson(Self instance) => <String, dynamic>{
      'href': instance.href,
    };

Embedded _$EmbeddedFromJson(Map<String, dynamic> json) => Embedded(
      seasons: (json['seasons'] as List<dynamic>?)
          ?.map((e) => Seasons.fromJson(e as Map<String, dynamic>))
          .toList(),
      cast: (json['cast'] as List<dynamic>?)
          ?.map((e) => Cast.fromJson(e as Map<String, dynamic>))
          .toList(),
      crew: (json['crew'] as List<dynamic>?)
          ?.map((e) => Crew.fromJson(e as Map<String, dynamic>))
          .toList(),
      episodes: (json['episodes'] as List<dynamic>?)
          ?.map((e) => Episodes.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EmbeddedToJson(Embedded instance) => <String, dynamic>{
      'seasons': instance.seasons,
      'cast': instance.cast,
      'crew': instance.crew,
      'episodes': instance.episodes,
    };

Seasons _$SeasonsFromJson(Map<String, dynamic> json) => Seasons(
      id: json['id'] as int?,
      url: json['url'] as String?,
      number: json['number'] as int?,
      name: json['name'] as String?,
      episodeOrder: json['episodeOrder'] as int?,
      premiereDate: json['premiereDate'] as String?,
      endDate: json['endDate'] as String?,
      network: json['network'] == null
          ? null
          : Network.fromJson(json['network'] as Map<String, dynamic>),
      image: json['image'] == null
          ? null
          : Image.fromJson(json['image'] as Map<String, dynamic>),
      summary: json['summary'] as String?,
      lLinks: json['lLinks'] == null
          ? null
          : Links.fromJson(json['lLinks'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SeasonsToJson(Seasons instance) => <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'number': instance.number,
      'name': instance.name,
      'episodeOrder': instance.episodeOrder,
      'premiereDate': instance.premiereDate,
      'endDate': instance.endDate,
      'network': instance.network,
      'image': instance.image,
      'summary': instance.summary,
      'lLinks': instance.lLinks,
    };

Cast _$CastFromJson(Map<String, dynamic> json) => Cast(
      person: json['person'] == null
          ? null
          : Person.fromJson(json['person'] as Map<String, dynamic>),
      character: json['character'] == null
          ? null
          : Character.fromJson(json['character'] as Map<String, dynamic>),
      self: json['self'] as bool?,
      voice: json['voice'] as bool?,
    );

Map<String, dynamic> _$CastToJson(Cast instance) => <String, dynamic>{
      'person': instance.person,
      'character': instance.character,
      'self': instance.self,
      'voice': instance.voice,
    };

Crew _$CrewFromJson(Map<String, dynamic> json) => Crew(
      type: json['type'] as String?,
      person: json['person'] == null
          ? null
          : Person.fromJson(json['person'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CrewToJson(Crew instance) => <String, dynamic>{
      'type': instance.type,
      'person': instance.person,
    };

Person _$PersonFromJson(Map<String, dynamic> json) => Person(
      id: json['id'] as int?,
      url: json['url'] as String?,
      name: json['name'] as String?,
      country: json['country'] == null
          ? null
          : Country.fromJson(json['country'] as Map<String, dynamic>),
      birthday: json['birthday'] as String?,
      gender: json['gender'] as String?,
      image: json['image'] == null
          ? null
          : Image.fromJson(json['image'] as Map<String, dynamic>),
      updated: json['updated'] as int?,
      lLinks: json['lLinks'] == null
          ? null
          : Links.fromJson(json['lLinks'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PersonToJson(Person instance) => <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'name': instance.name,
      'country': instance.country,
      'birthday': instance.birthday,
      'gender': instance.gender,
      'image': instance.image,
      'updated': instance.updated,
      'lLinks': instance.lLinks,
    };

Character _$CharacterFromJson(Map<String, dynamic> json) => Character(
      id: json['id'] as int?,
      url: json['url'] as String?,
      name: json['name'] as String?,
      image: json['image'] == null
          ? null
          : Image.fromJson(json['image'] as Map<String, dynamic>),
      lLinks: json['lLinks'] == null
          ? null
          : Links.fromJson(json['lLinks'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CharacterToJson(Character instance) => <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'name': instance.name,
      'image': instance.image,
      'lLinks': instance.lLinks,
    };

Episodes _$EpisodesFromJson(Map<String, dynamic> json) => Episodes(
      id: json['id'] as int?,
      url: json['url'] as String?,
      name: json['name'] as String?,
      season: json['season'] as int?,
      number: json['number'] as int?,
      type: json['type'] as String?,
      airdate: json['airdate'] as String?,
      airtime: json['airtime'] as String?,
      airstamp: json['airstamp'] as String?,
      runtime: json['runtime'] as int?,
      rating: json['rating'] == null
          ? null
          : Rating.fromJson(json['rating'] as Map<String, dynamic>),
      image: json['image'] == null
          ? null
          : Image.fromJson(json['image'] as Map<String, dynamic>),
      summary: json['summary'] as String?,
      lLinks: json['lLinks'] == null
          ? null
          : Links.fromJson(json['lLinks'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EpisodesToJson(Episodes instance) => <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'name': instance.name,
      'season': instance.season,
      'number': instance.number,
      'type': instance.type,
      'airdate': instance.airdate,
      'airtime': instance.airtime,
      'airstamp': instance.airstamp,
      'runtime': instance.runtime,
      'rating': instance.rating,
      'image': instance.image,
      'summary': instance.summary,
      'lLinks': instance.lLinks,
    };
