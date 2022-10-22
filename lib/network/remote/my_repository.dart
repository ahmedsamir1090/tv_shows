import 'package:tv_shows/network/remote/web_services.dart';

import '../../model/app_model.dart';

class MyRepo {
  final WebServices webServices;

  MyRepo(this.webServices);

  Future<Model> getInfo(String seriesList) async {
    return await webServices.getInfo(WebServices.options, seriesList);
  }

  Future<Model> getSeriesDetails(
      int index, String seriesList, String embed) async {
    return await webServices.getSeriesDetails(
        WebServices.options, seriesList, embed);
  }
}
