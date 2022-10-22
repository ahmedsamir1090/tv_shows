import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:tv_shows/view_model/cubit/hotd_cubit.dart';
import 'package:tv_shows/view_model/view_model.dart';
import 'package:tv_shows/views/series/episodes/episodes_details_screen.dart';

class SeriesEpisodes extends StatelessWidget {
  SeriesEpisodes(this.pageIndex, this.viewModel, {super.key});

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
              title: Text("Episodes"),
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
                            childAspectRatio: .19.h / .25.h,
                            crossAxisSpacing: 1.h,
                            crossAxisCount: 2),
                        itemBuilder: (context, index) => InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => EpisodesDetailsScreen(
                                    viewModel, pageIndex, index),
                              ));
                            },
                            child: Stack(
                              children: [
                                // CachedNetworkImage(
                                //   imageUrl:
                                //       "${viewModel.getSeriesEpisodesImage(pageIndex, index)}",
                                //   fit: BoxFit.fill,
                                //   placeholder: (context, url) => const Center(
                                //       child: CircularProgressIndicator()),
                                //   maxHeightDiskCache: 720,
                                //   width: double.infinity,
                                //   height: double.infinity,
                                // ),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: double.infinity,
                                    height: MediaQuery.of(context).size.height *
                                        .037,
                                    color: Colors.red.withOpacity(.8),
                                    // child: Text(
                                    //     "${viewModel.getSeriesEpisodesName(pageIndex, index)}",
                                    //     style: Theme.of(context)
                                    //         .textTheme
                                    //         .bodyText1
                                    //         ?.copyWith(fontSize: 7.sp)),
                                  ),
                                ),
                              ],
                            )),
                        shrinkWrap: true,
                        itemCount: viewModel.getEpisodesCount(pageIndex) ?? 0,
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
