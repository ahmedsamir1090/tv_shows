import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/app_model.dart';
import '../../network/remote/my_repository.dart';

part 'hotd_state.dart';

class HotdCubit extends Cubit<HotdState> {
  HotdCubit(this.myRepo) : super(HotdInitial());

  static HotdCubit get(context) => BlocProvider.of(context);

  final MyRepo myRepo;
  Model? gotModel;
  Model? houseModel;
  Model? pbModel;
  Model? twdModel;
  Model? lotrModel;
  Model? lostModel;
  Model? breakingBadModel;
  Model? theWitcherModel;
  Model? vikingsModel;
  Model? strangerThingsModel;
  Model? squidGameModel;
  Model? betterCallSaulModel;
  Model? seeModel;
  Model? the100Model;
  Model? darkModel;

  late List<Model?> modelList = [
    houseModel,
    gotModel,
    breakingBadModel,
    pbModel,
    twdModel,
    betterCallSaulModel,
    lotrModel,
    lostModel,
    the100Model,
    theWitcherModel,
    vikingsModel,
    strangerThingsModel,
    seeModel,
    squidGameModel,
    darkModel,
  ];
  static int? pageIndex;

  List<String> seriesList = [
    "hose of the dragon",
    "game of thrones",
    "breaking bad",
    "prison break",
    "better call saul",
    "the walking dead",
    "the lord of rings",
    "lost",
    "the 100",
    "the witcher",
    "vikings",
    "Dark",
    "stranger things",
    "see",
    "squid Game",
  ];

  Future<void> getInfo() async {
    for (int i = 0; i < modelList.length; i++) {
      emit(GetAllInfoLoadingState());
      await myRepo.getInfo(seriesList[i]).then((value) {
        modelList[i] = value;
        emit(GetAllInfoSuccessState());
      }).catchError((onError) {
        print(onError);
        emit(GetAllInfoErrorState());
      });
    }
  }

  Future<void> getSeasonInfo(pageIndex) async {
    await myRepo
        .getSeriesDetails(
      pageIndex,
      seriesList[pageIndex],
      'seasons',
    )
        .then((value) {
      modelList[pageIndex!] = value;
    }).catchError((onError) {
      print(onError);
    });
  }

  Future<void> getCastInfo(pageIndex) async {
    await myRepo
        .getSeriesDetails(pageIndex, seriesList[pageIndex], 'cast')
        .then((value) {
      modelList[pageIndex!] = value;
    }).catchError((onError) {
      print(onError);
    });
  }

  Future<void> getCrewInfo(pageIndex) async {
    await myRepo
        .getSeriesDetails(pageIndex, seriesList[pageIndex], 'crew')
        .then((value) {
      modelList[pageIndex!] = value;
    }).catchError((onError) {
      print(onError);
    });
  }

  Future<void> getEpisodesInfo(pageIndex) async {
    await myRepo
        .getSeriesDetails(pageIndex, seriesList[pageIndex], 'episodes')
        .then((value) {
      modelList[pageIndex!] = value;
    }).catchError((onError) {
      print(onError);
    });
  }

  bool listView = false;

  changeView() {
    emit(ChangeViewState());
    listView = !listView;
    print(listView);
  }
}
