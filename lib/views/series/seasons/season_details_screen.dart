import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:html/parser.dart';
import 'package:sizer/sizer.dart';
import 'package:tv_shows/view_model/cubit/hotd_cubit.dart';

import '../../../view_model/view_model.dart';
import '../episodes/season_episode_details.dart';
import '../episodes/season_episodes.dart';

class SeasonDetailsScreen extends StatelessWidget {
  SeasonDetailsScreen(this.viewModel, this.index, this.seasonIndex, {Key? key})
      : super(key: key);
  int index;
  int seasonIndex;
  ViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    /// sanitize or query document here
    String myHtmlText =
        "${viewModel.getSeriesSeasonsSummary(index, seasonIndex)}";
    var doc = parse(myHtmlText);
    return BlocConsumer<HotdCubit, HotdState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: NestedScrollView(
            floatHeaderSlivers: true,
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
              SliverAppBar(
                title: Text("Season  ${seasonIndex + 1}"),
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
                            "${viewModel.getSeriesSeasonsImageFullHd(index, seasonIndex)}",
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
                                  "${viewModel.getSeriesSeasonsImageFullHd(index, seasonIndex)}",
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
                        SelectableText(
                            "episodes in order:${viewModel.getSeriesSeasonsEpisodesInOrder(index, seasonIndex)}",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                ?.copyWith(
                                    color: Colors.lime, fontSize: 12.sp)),
                        SelectableText(
                            "premiere Date : ${viewModel.getSeriesSeasonsPremiereDate(index, seasonIndex)}",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                ?.copyWith(
                                    color: Colors.lime, fontSize: 12.sp)),
                        SelectableText(
                            "End Date : ${viewModel.getSeriesSeasonsEndDate(index, seasonIndex)}",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                ?.copyWith(
                                    color: Colors.lime, fontSize: 12.sp)),
                        SizedBox(
                          height: 1.h,
                        ),
                        SelectableText(
                          "${doc.body?.text}",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(color: Colors.white, fontSize: 10.sp),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Center(
                          child: ElevatedButton(
                            child: Text("Episodes",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline1
                                    ?.copyWith(
                                      color: Colors.white,
                                      fontSize: 12.sp,
                                    )),
                            onPressed: () {
                              HotdCubit.get(context)
                                  .getEpisodesInfo(index)
                                  .then((value) {
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (context) {
                                  return SeasonEpisodes(
                                      seasonIndex, index, ViewModel());
                                }));
                              }).catchError((onError) {
                                print(onError.toString());
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
