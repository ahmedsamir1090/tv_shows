import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:photo_view/photo_view.dart';
import 'package:sizer/sizer.dart';

import '../../../view_model/view_model.dart';

class SeasonEpisodesDetailsScreen extends StatelessWidget {
  SeasonEpisodesDetailsScreen(this.viewModel, this.index, this.seasonIndex,
      {Key? key})
      : super(key: key);
  int index;
  int seasonIndex;
  ViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    /// sanitize or query document here
    String myHtmlText =
        "${viewModel.getSeasonEpisodesSummary(index, seasonIndex)}";
    var doc = parse(myHtmlText);

    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            title: Text(
                "episode  ${viewModel.getSeasonEpisodesNumber(index, seasonIndex)}"),
          ),
        ],
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CachedNetworkImage(
                    imageUrl:
                        "${viewModel.getSeasonEpisodesImage(index, seasonIndex)}",
                    height: 60.h,
                    width: double.infinity,
                    fit: BoxFit.fill,
                    maxHeightDiskCache: 720,
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => OpenImageFullScreen(
                              "${viewModel.getSeasonEpisodesImage(index, seasonIndex)}",
                            ),
                          ),
                        );
                      },
                      icon: Icon(
                        Icons.fullscreen,
                        size: 20.sp,
                      )),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.all(1.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: SelectableText(
                          "${viewModel.getSeasonEpisodesName(index, seasonIndex)}",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(color: Colors.lime, fontSize: 12.sp)),
                    ),
                    SelectableText(
                        "Season : ${viewModel.getSeriesEpisodesSeason(index, seasonIndex)}",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            ?.copyWith(color: Colors.lime, fontSize: 12.sp)),
                    SelectableText(
                        "Air Date : ${viewModel.getSeasonEpisodesAirDate(index, seasonIndex)}",
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

class OpenImageFullScreen extends StatelessWidget {
  OpenImageFullScreen(this.image, {Key? key}) : super(key: key);
  String image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomRight,
        children: [
          PhotoView(
            imageProvider: CachedNetworkImageProvider(image),
            filterQuality: FilterQuality.high,

            // imageUrl: ,
            // height: double.infinity,
            // width: double.infinity,
            // fit: BoxFit.fill,
            // placeholder: (context, url) =>
            //     const Center(child: CircularProgressIndicator()),
          ),
          IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.fullscreen_exit,
                size: 20.sp,
              )),
        ],
      ),
    );
  }
}
