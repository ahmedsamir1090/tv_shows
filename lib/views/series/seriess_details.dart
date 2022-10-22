import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'package:tv_shows/view_model/cubit/hotd_cubit.dart';
import 'package:tv_shows/view_model/view_model.dart';
import 'package:tv_shows/views/series/seasons/season.dart';

import 'cast/cast.dart';
import 'characters/characters.dart';
import 'crew/crew.dart';
import 'episodes/season_episode_details.dart';

class SeriesDetails extends StatelessWidget {
  static const String id = "SeriesDetails";

  SeriesDetails(this.index, this.viewModel, {super.key});

  int index;
  ViewModel viewModel;

  Widget build(BuildContext context) {
    return BlocConsumer<HotdCubit, HotdState>(
      builder: (context, state) => DefaultTabController(
        length: 4,
        child: Scaffold(
          body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
              SliverAppBar(
                title: Text("${viewModel.getTitleList(index)}",
                    style: Theme.of(context).textTheme.headline1?.copyWith(
                          color: Colors.white,
                          fontSize: 20.sp,
                        )),
                snap: true,
                floating: true,
                pinned: true,
                bottom: PreferredSize(
                  preferredSize: Size(double.infinity, 5.12.h),
                  child: TabBar(
                    isScrollable: true,
                    indicatorWeight: 1,
                    indicatorColor: Colors.transparent,
                    tabs: [
                      ElevatedButton(
                        child: Text("Seasons",
                            style:
                                Theme.of(context).textTheme.headline1?.copyWith(
                                      color: Colors.white,
                                      fontSize: 12.sp,
                                    )),
                        onPressed: () {
                          HotdCubit.get(context)
                              .getSeasonInfo(index)
                              .then((value) {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return SeriesSeason(index, ViewModel());
                            }));
                          }).catchError((onError) {
                            print(onError.toString());
                          });
                        },
                      ),
                      ElevatedButton(
                        child: Text("Characters",
                            style:
                                Theme.of(context).textTheme.headline1?.copyWith(
                                      color: Colors.white,
                                      fontSize: 12.sp,
                                    )),
                        onPressed: () {
                          HotdCubit.get(context)
                              .getCastInfo(index)
                              .then((value) {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return SeriesCharacters(index, ViewModel());
                            }));
                          }).catchError((onError) {
                            print(onError.toString());
                          });
                        },
                      ),
                      ElevatedButton(
                        child: Text("Cast",
                            style:
                                Theme.of(context).textTheme.headline1?.copyWith(
                                      color: Colors.white,
                                      fontSize: 12.sp,
                                    )),
                        onPressed: () {
                          HotdCubit.get(context)
                              .getCastInfo(index)
                              .then((value) {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return SeriesCast(index, ViewModel());
                            }));
                          }).catchError((onError) {
                            print(onError.toString());
                          });
                        },
                      ),
                      ElevatedButton(
                        child: Text("Crew",
                            style:
                                Theme.of(context).textTheme.headline1?.copyWith(
                                      color: Colors.white,
                                      fontSize: 12.sp,
                                    )),
                        onPressed: () {
                          HotdCubit.get(context)
                              .getCrewInfo(index)
                              .then((value) {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return SeriesCrew(index, ViewModel());
                            }));
                          }).catchError((onError) {
                            print(onError.toString());
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
            body: SingleChildScrollView(
              padding: EdgeInsetsDirectional.only(top: 2.5.h),
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: EdgeInsets.all(1.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                            "Premiered : ${viewModel.getSeriesPremiered(index)}",
                            style:
                                Theme.of(context).textTheme.headline1?.copyWith(
                                      color: Colors.white,
                                      fontSize: 12.sp,
                                    )),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 1.h,
                              ),
                              Column(
                                children: [
                                  Text(
                                    "RATING",
                                    style: TextStyle(
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w300),
                                  ),
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                          'asstes/icons/star_fill.svg'),
                                      Text(
                                        "${viewModel.getRatingList(index)}",
                                        style: TextStyle(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 1.h,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => OpenImageFullScreen(
                              "${viewModel.getSeriesImageBanners(index)}",
                            ),
                          ),
                        );
                      },
                      child: CachedNetworkImage(
                        imageUrl: "${viewModel.getSeriesImageBanners(index)}",
                        height: 60.h,
                        fit: BoxFit.fill,
                        width: double.infinity,
                        placeholder: (context, url) =>
                            Center(child: CircularProgressIndicator()),
                        maxHeightDiskCache: 720,
                      ),
                    ),
                    Center(
                      heightFactor: 2,
                      child: Text("${viewModel.getSeriesGeneres(index)}",
                          style:
                              Theme.of(context).textTheme.headline1?.copyWith(
                                    color: Colors.white,
                                    fontSize: 12.sp,
                                  )),
                    ),
                    Text("${viewModel.getSeriesSummary(index)}",
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              color: Colors.white,
                              fontSize: 10.sp,
                            )),
                    // NotificationListener<OverscrollIndicatorNotification>(
                    //   onNotification: (notification) {
                    //     notification.disallowIndicator();
                    //     return true;
                    //   },
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      listener: (context, state) {},
    );
  }
}
