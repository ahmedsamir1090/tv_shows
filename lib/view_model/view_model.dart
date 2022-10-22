import 'package:html/parser.dart';

import '../model/app_model.dart';
import '../shared/injection.dart';
import 'cubit/hotd_cubit.dart';

class ViewModel {
  String? getTitleList(int index) {
    for (int i = index; i < getIt<HotdCubit>().modelList.length; i++) {
      String? a = getIt<HotdCubit>().modelList[i]?.name;

      return a;
    }
    return null;
  }

  String? getSeriesImageBanners(int index) {
    for (int i = index; i < getIt<HotdCubit>().modelList.length; i++) {
      String? a = getIt<HotdCubit>().modelList[i]?.image?.original;
      return a;
    }
    return null;
  }

  String? getSeriesImage(int index) {
    for (int i = index; i < getIt<HotdCubit>().modelList.length; i++) {
      String? a = getIt<HotdCubit>().modelList[i]?.image?.original;
      return a;
    }
    return null;
  }

  String? getRatingList(int index) {
    for (int i = index; i < getIt<HotdCubit>().modelList.length; i++) {
      String? a = getIt<HotdCubit>().modelList[i]?.rating?.average.toString();
      return a;
    }
    return null;
  }

  String? getSeriesGeneres(int index) {
    for (int i = index; i < getIt<HotdCubit>().modelList.length; i++) {
      var a = getIt<HotdCubit>().modelList[i]?.genres;
      return a?.join(" - ");
    }
    return null;
  }

  String? getSeriesPremiered(int index) {
    for (int i = index; i < getIt<HotdCubit>().modelList.length; i++) {
      String? a = getIt<HotdCubit>().modelList[i]?.premiered;
      return a ?? "Not non";
    }
    return null;
  }

  String? getSeriesCharactersImage(int pageIndex, int index) {
    for (int i = index;
        i < getIt<HotdCubit>().modelList[pageIndex]!.embedded!.cast!.length;
        i++) {
      var a = getIt<HotdCubit>().modelList[pageIndex]!.embedded!.cast![i];
      return a.character?.image?.original ??
          a.person?.image?.original ??
          "https://static.tvmaze.com/images/no-img/no-img-portrait-text.png";
    }
    return null;
  }

  String? getSeriesCharactersName(int pageIndex, int index) {
    for (int i = index;
        i < getIt<HotdCubit>().modelList[pageIndex]!.embedded!.cast!.length;
        i++) {
      var a = getIt<HotdCubit>().modelList[pageIndex]!.embedded!.cast![i];
      return a.character?.name;
    }
    return null;
  }

  String? getSeriesSummary(int index) {
    for (int i = index; i < getIt<HotdCubit>().modelList.length; i++) {
      var a = getIt<HotdCubit>().modelList[i]?.summary;
      late var houseSummaryObject = parse(a);
      late String? hSummary = houseSummaryObject.body?.text;
      return hSummary;
    }
    return null;
  }

  String? getSeriesSeasonsSummary(int pageIndex, int index) {
    for (int i = index;
        i < getIt<HotdCubit>().modelList[pageIndex]!.embedded!.seasons!.length;
        i++) {
      String? a = getIt<HotdCubit>()
          .modelList[pageIndex]
          ?.embedded
          ?.seasons?[i]
          .summary;
      return a ??
          "We don't have a summary for Season ${index + 1} yet. Hang in there, or go ahead and contribute one.";
    }
    return null;
  }

  String? getSeriesSeasonsImage(int pageIndex, int index) {
    for (int i = index;
        i < getIt<HotdCubit>().modelList[pageIndex]!.embedded!.seasons!.length;
        i++) {
      var a = getIt<HotdCubit>().modelList[pageIndex]!.embedded!.seasons![i];
      return a.image?.medium ??
          "https://static.tvmaze.com/images/no-img/no-img-landscape-text.png";
    }
    return null;
  }

  String? getSeriesSeasonsImageFullHd(int pageIndex, int index) {
    List<Seasons>? s =
        getIt<HotdCubit>().modelList[pageIndex]?.embedded?.seasons;
    for (int i = index; i < s!.length; i++) {
      var a = s[i];
      return a.image?.original ??
          "https://static.tvmaze.com/images/no-img/no-img-landscape-text.png";
    }
    return null;
  }

  String? getEpisodesSummary(int pageIndex, int index) {
    for (int i = index;
        i < getIt<HotdCubit>().modelList[pageIndex]!.embedded!.episodes!.length;
        i++) {
      var a = getIt<HotdCubit>().modelList[pageIndex]!.embedded!.episodes![i];
      return a.summary;
    }
    return null;
  }

  int? getCastCount(int pageIndex) {
    for (int j = pageIndex;
        j < getIt<HotdCubit>().modelList[j]!.embedded!.cast!.length;
        j++) {
      int? a = getIt<HotdCubit>().modelList[j]!.embedded!.cast!.length;
      return a;
    }
    return null;
  }

  int? getSeasonCount(int pageIndex) {
    {
      int? a =
          getIt<HotdCubit>().modelList[pageIndex]?.embedded?.seasons?.length;
      return a;
    }
  }

  int? getEpisodesCount(int pageIndex) {
    int? a =
        getIt<HotdCubit>().modelList[pageIndex]!.embedded!.episodes!.length;
    return a;
  }

  int? getCrewCount(int pageIndex) {
    {
      int? a = getIt<HotdCubit>().modelList[pageIndex]!.embedded!.crew!.length;
      return a;
    }
  }

  String? getSeriesSeasonsEpisodesInOrder(int pageIndex, int index) {
    List<Seasons>? s =
        getIt<HotdCubit>().modelList[pageIndex]?.embedded?.seasons;
    for (int i = index; i < s!.length; i++) {
      var a = s[i];
      if (a.episodeOrder == null) {
        return "Not specified yet";
      } else {
        return a.episodeOrder.toString();
      }
    }
    return null;
  }

  String? getSeriesSeasonsPremiereDate(int pageIndex, int index) {
    for (int i = index;
        i < getIt<HotdCubit>().modelList[pageIndex]!.embedded!.seasons!.length;
        i++) {
      var a = getIt<HotdCubit>().modelList[pageIndex]!.embedded!.seasons![i];
      return a.premiereDate ?? "Not specified yet";
    }
    return null;
  }

  String? getSeriesSeasonsEndDate(int pageIndex, int index) {
    for (int i = index;
        i < getIt<HotdCubit>().modelList[pageIndex]!.embedded!.seasons!.length;
        i++) {
      var a = getIt<HotdCubit>().modelList[pageIndex]!.embedded!.seasons![i];
      return a.endDate ?? "Not specified yet";
    }
    return null;
  }

  String? getSeriesCastImage(int pageIndex, int index) {
    for (int i = index;
        i < getIt<HotdCubit>().modelList[pageIndex]!.embedded!.cast!.length;
        i++) {
      var a = getIt<HotdCubit>().modelList[pageIndex]!.embedded!.cast![i];
      return a.person?.image?.medium ??
          "https://static.tvmaze.com/images/no-img/no-img-portrait-text.png";
    }
    return null;
  }

  String? getSeriesCastName(int pageIndex, int index) {
    for (int i = index;
        i < getIt<HotdCubit>().modelList[pageIndex]!.embedded!.cast!.length;
        i++) {
      var a = getIt<HotdCubit>().modelList[pageIndex]!.embedded!.cast![i];
      return a.person?.name;
    }
    return null;
  }

  String? getSeriesCrewImage(int pageIndex, int index) {
    for (int i = index;
        i < getIt<HotdCubit>().modelList[pageIndex]!.embedded!.crew!.length;
        i++) {
      var a = getIt<HotdCubit>().modelList[pageIndex]!.embedded!.crew![i];
      return a.person?.image?.medium ??
          "https://static.tvmaze.com/images/no-img/no-img-portrait-text.png";
    }

    return null;
  }

  String? getSeriesCrewName(int pageIndex, int index) {
    for (int i = index;
        i < getIt<HotdCubit>().modelList[pageIndex]!.embedded!.crew!.length;
        i++) {
      var a = getIt<HotdCubit>().modelList[pageIndex]!.embedded!.crew![i];
      return a.person?.name;
    }

    return null;
  }

  String? getSeriesCrewType(int pageIndex, int index) {
    for (int i = index;
        i < getIt<HotdCubit>().modelList[pageIndex]!.embedded!.crew!.length;
        i++) {
      var a = getIt<HotdCubit>().modelList[pageIndex]!.embedded!.crew![i];
      return a.type;
    }

    return null;
  }

  String? getSeriesEpisodesName(int pageIndex, int index) {
    for (int i = index;
        i < getIt<HotdCubit>().modelList[pageIndex]!.embedded!.episodes!.length;
        i++) {
      var a = getIt<HotdCubit>().modelList[pageIndex]!.embedded!.episodes![i];
      return a.name;
    }

    return null;
  }

  String? getSeriesEpisodesImage(int pageIndex, int index) {
    for (int i = index;
        i < getIt<HotdCubit>().modelList[pageIndex]!.embedded!.episodes!.length;
        i++) {
      var a = getIt<HotdCubit>().modelList[pageIndex]!.embedded!.episodes![i];
      return a.image?.original ??
          "https://static.tvmaze.com/images/no-img/no-img-landscape-text.png";
    }

    return null;
  }

  List<Episodes>? houseEpi = [];
  List<Episodes>? gotEpi = [];
  List<Episodes>? bBEpi = [];
  List<Episodes>? pbEpi = [];
  List<Episodes>? betterCallSaulEpi = [];
  List<Episodes>? twdEpi = [];
  List<Episodes>? lotrEpi = [];
  List<Episodes>? lostEpi = [];
  List<Episodes>? the100Epi = [];
  List<Episodes>? theWitcherEpi = [];
  List<Episodes>? darkEpi = [];
  List<Episodes>? vikingsEpi = [];
  List<Episodes>? strangerThingsEpi = [];
  List<Episodes>? seeEpi = [];
  List<Episodes>? squidGameEpi = [];

  late List<List<Episodes>?> epi = [
    houseEpi,
    gotEpi,
    bBEpi,
    pbEpi,
    twdEpi,
    lotrEpi,
    lostEpi,
    theWitcherEpi,
    vikingsEpi,
    strangerThingsEpi,
    betterCallSaulEpi,
    seeEpi,
    the100Epi,
    squidGameEpi,
    darkEpi,
  ];

  int? getEpisodeForSeasonCount(pageIndex, int index) {
    epi[pageIndex] = getIt<HotdCubit>()
        .modelList[pageIndex]
        ?.embedded
        ?.episodes
        ?.where((element) => element.season == index)
        .toList();

    return epi[pageIndex]?.length;
  }

  String? getSeasonEpisodesName(int pageIndex, int index) {
    for (int i = index; i < epi[pageIndex]!.length; i++) {
      var a = epi[pageIndex]![i];
      return a.name;
    }

    return null;
  }

  String? getSeasonEpisodesImage(int pageIndex, int index) {
    for (int i = index; i < epi[pageIndex]!.length; i++) {
      var a = epi[pageIndex]![i];
      return a.image?.original ??
          "https://static.tvmaze.com/images/no-img/no-img-landscape-text.png";
    }
    return null;
  }

  String? getSeriesEpisodesSeason(int pageIndex, int index) {
    for (int i = index; i < epi[pageIndex]!.length; i++) {
      var a = epi[pageIndex]![i];
      return a.season?.toString();
    }
    return null;
  }

  String? getSeasonEpisodesNumber(int pageIndex, int index) {
    for (int i = index; i < epi[pageIndex]!.length; i++) {
      var a = epi[pageIndex]![i];
      return a.number?.toString();
    }
    return null;
  }

  String? getSeasonEpisodesAirDate(int pageIndex, int index) {
    for (int i = index; i < epi[pageIndex]!.length; i++) {
      var a = epi[pageIndex]![i];
      return a.airdate?.toString();
    }
    return null;
  }

  String? getSeasonEpisodesSummary(int pageIndex, int index) {
    for (int i = index; i < epi[pageIndex]!.length; i++) {
      var a = epi[pageIndex]![i];
      return a.summary ??
          "We don't have a summary for Episodes ${index + 1} yet. Hang in there, or go ahead and contribute one";
    }
    return null;
  }
}
