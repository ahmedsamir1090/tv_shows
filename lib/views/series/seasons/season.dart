import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:tv_shows/shared/injection.dart';
import 'package:tv_shows/view_model/cubit/hotd_cubit.dart';
import 'package:tv_shows/view_model/view_model.dart';
import 'package:tv_shows/views/series/seasons/season_details_screen.dart';

class SeriesSeason extends StatelessWidget {
  static const String id = "SeriesDetails";

  SeriesSeason(this.pageIndex, this.viewModel, {super.key});

  int pageIndex;
  ViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HotdCubit, HotdState>(
      builder: (context, state) => Scaffold(
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            const SliverAppBar(
              expandedHeight: 60,
              title: Text("Seasons"),
            ),
          ],
          body: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisSpacing: 1.h,
                            childAspectRatio: .19.h / .3.h,
                            crossAxisSpacing: 1.h,
                            crossAxisCount: 2),
                        itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            getIt<HotdCubit>()
                                .getSeasonInfo(pageIndex)
                                .then((value) {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => SeasonDetailsScreen(
                                    viewModel, pageIndex, index),
                              ));
                            });
                          },
                          child: ConditionalBuilder(
                            builder: (context) => CachedNetworkImage(
                              imageUrl:
                                  "${viewModel.getSeriesSeasonsImage(pageIndex, index)}",
                              fit: BoxFit.fill,
                              placeholder: (context, url) => const Center(
                                  child: CircularProgressIndicator()),
                              maxHeightDiskCache: 720,
                            ),
                            condition: viewModel.getSeriesSeasonsImage(
                                    pageIndex, index) !=
                                null,
                            fallback: (context) => const Center(
                                child: CircularProgressIndicator()),
                          ),
                        ),
                        shrinkWrap: true,
                        itemCount: viewModel.getSeasonCount(pageIndex) ?? 0,
                        scrollDirection: Axis.vertical,
                        physics: const BouncingScrollPhysics(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      listener: (context, state) {},
    );
  }
}
