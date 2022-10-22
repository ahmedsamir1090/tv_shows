// ignore_for_file: must_be_immutable

import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:tv_shows/views/home/series_card.dart';

import '../../shared/injection.dart';
import '../../view_model/cubit/hotd_cubit.dart';
import '../../view_model/view_model.dart';

class SeriesCarousel extends StatefulWidget {
  SeriesCarousel({Key? key}) : super(key: key);
  ViewModel? viewModel;

  @override
  State<SeriesCarousel> createState() => _SeriesCarouselState();
}

class _SeriesCarouselState extends State<SeriesCarousel> {
  PageController? pageController;
  int initialPage = getIt<HotdCubit>().seriesList.length ~/ 2;

  @override
  void initState() {
    pageController = PageController(
      viewportFraction: .84,
      initialPage: initialPage,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HotdCubit, HotdState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(0.0),
          child: AspectRatio(
            aspectRatio: MediaQuery.of(context).size.aspectRatio * 1.2,
            child: NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (overScroll) {
                overScroll.disallowIndicator();
                return false;
              },
              child: getIt<HotdCubit>().listView == true
                  ? GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: .08.h / .25.h,
                        crossAxisCount: 2,
                      ),
                      itemBuilder: (context, index) =>
                          SeriesCard(ViewModel(), index),
                      scrollDirection: Axis.vertical,
                      itemCount: getIt<HotdCubit>().seriesList.length,
                    )
                  : PageView.builder(
                      controller: pageController,
                      itemBuilder: (context, index) => buildMovieCard(index),
                      scrollDirection: Axis.horizontal,
                      itemCount: getIt<HotdCubit>().seriesList.length,
                    ),
            ),
          ),
        );
      },
    );
  }

  AnimatedBuilder buildMovieCard(int index) => AnimatedBuilder(
        builder: (context, child) {
          double value = 0;
          if (pageController!.position.haveDimensions) {
            value = index - pageController!.page!;
            value = (value * .0038.h).clamp(-1, 1);
          }
          return Transform.rotate(
            angle: value * math.pi,
            child: SeriesCard(ViewModel(), index),
          );
        },
        animation: pageController!,
      );
}
