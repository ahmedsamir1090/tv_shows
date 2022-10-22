import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:tv_shows/view_model/cubit/hotd_cubit.dart';
import 'package:tv_shows/view_model/view_model.dart';

class SeriesCast extends StatelessWidget {
  static const String id = "SeriesCast";

  SeriesCast(this.pageIndex, this.viewModel, {super.key});

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
              title: Text("Cast"),
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
                            // Navigator.of(context).push(MaterialPageRoute(
                            //   builder: (context) => SeasonDetailsScreen(
                            //       viewModel, pageIndex, index),
                            // ));
                          },
                          child: Stack(
                            children: [
                              CachedNetworkImage(
                                imageUrl:
                                    "${viewModel.getSeriesCastImage(pageIndex, index)}",
                                fit: BoxFit.fill,
                                placeholder: (context, url) => const Center(
                                    child: CircularProgressIndicator()),
                                maxHeightDiskCache: 720,
                                width: double.infinity,
                                height: double.infinity,
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  alignment: Alignment.center,
                                  width: double.infinity,
                                  height:
                                      MediaQuery.of(context).size.height * .04,
                                  color: Colors.lightGreen.withOpacity(.9),
                                  child: Column(
                                    children: [
                                      Text(
                                          "${viewModel.getSeriesCastName(pageIndex, index)}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1
                                              ?.copyWith(
                                                  fontSize: 7.sp,
                                                  fontWeight: FontWeight.bold)),
                                      Text(
                                        " as ${viewModel.getSeriesCharactersName(pageIndex, index)}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1
                                            ?.copyWith(
                                                fontSize: 7.sp,
                                                overflow: TextOverflow.ellipsis,
                                                fontWeight: FontWeight.bold),
                                        maxLines: 1,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        shrinkWrap: true,
                        itemCount: viewModel.getCastCount(pageIndex) ?? 0,
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
