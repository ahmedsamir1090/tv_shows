import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:sizer/sizer.dart';

import '../../../view_model/view_model.dart';

class EpisodesDetailsScreen extends StatelessWidget {
  EpisodesDetailsScreen(this.viewModel, this.index, this.seasonIndex,
      {Key? key})
      : super(key: key);
  int index;
  int seasonIndex;
  ViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    /// sanitize or query document here
    String myHtmlText = "${viewModel.getEpisodesSummary(index, seasonIndex)}";
    var doc = parse(myHtmlText);
    // String? getSeriesEpisodesSeason(int pageIndex, int index) {
    //   if (pageIndex == 0) {
    //     var i = index;
    //     while (i < viewModel.hotdEpisodes!.length) {
    //       var a = viewModel.hotdEpisodes?[i];
    //       return a?.season.toString();
    //     }
    //   }
    //   if (pageIndex == 1) {
    //     var i = index;
    //     while (i < viewModel.gotEpisodes!.length) {
    //       var a = viewModel.gotEpisodes?[i];
    //       return a?.season.toString();
    //     }
    //   }
    //   return null;
    // }
    //
    // String? getSeriesEpisodesNumber(int pageIndex, int index) {
    //   if (pageIndex == 0) {
    //     var i = index;
    //     while (i < viewModel.hotdEpisodes!.length) {
    //       var a = viewModel.hotdEpisodes?[i];
    //       return a?.number.toString();
    //     }
    //   }
    //   if (pageIndex == 1) {
    //     var i = index;
    //     while (i < viewModel.gotEpisodes!.length) {
    //       var a = viewModel.gotEpisodes?[i];
    //       return a?.number.toString();
    //     }
    //   }
    //   return null;
    // }
    //
    // String? getSeriesEpisodesAirDate(int pageIndex, int index) {
    //   if (pageIndex == 0) {
    //     var i = index;
    //     while (i < viewModel.hotdEpisodes!.length) {
    //       var a = viewModel.hotdEpisodes?[i];
    //       return a?.airdate;
    //     }
    //   }
    //   if (pageIndex == 1) {
    //     var i = index;
    //     while (i < viewModel.gotEpisodes!.length) {
    //       var a = viewModel.gotEpisodes?[i];
    //       return a?.airdate;
    //     }
    //   }
    //   return null;
    // }

    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            title: Text("episode "
                // " ${getSeriesEpisodesNumber(index, seasonIndex)}"
                ),
          ),
        ],
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  print("ss");
                },
                child: CachedNetworkImage(
                  imageUrl:
                      "${viewModel.getSeriesEpisodesImage(index, seasonIndex)}",
                  height: 60.h,
                  width: double.infinity,
                  fit: BoxFit.fill,
                  maxHeightDiskCache: 720,
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.all(1.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: SelectableText(
                          "${viewModel.getSeriesEpisodesName(index, seasonIndex)}",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(color: Colors.lime, fontSize: 12.sp)),
                    ),
                    SelectableText(
                        "Season :"
                        // " ${getSeriesEpisodesSeason(index, seasonIndex)}"
                        ,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            ?.copyWith(color: Colors.lime, fontSize: 12.sp)),
                    SelectableText(
                        "Air Date : "
                        // "${getSeriesEpisodesAirDate(index, seasonIndex)}"
                        ,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            ?.copyWith(color: Colors.lime, fontSize: 12.sp)),
                    SizedBox(
                      height: 2.h,
                    ),
                    SelectableText(
                      "${doc.body?.text}",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          ?.copyWith(color: Colors.white, fontSize: 10.sp),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
