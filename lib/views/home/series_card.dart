// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

import '../../view_model/cubit/hotd_cubit.dart';
import '../../view_model/view_model.dart';
import '../series/seriess_details.dart';

class SeriesCard extends StatelessWidget {
  ViewModel viewModel;
  int index;

  SeriesCard(this.viewModel, this.index, {super.key});

  // CacheManager customCacheManager = CacheManager(
  //   Config(
  //     'customCacheManger',
  //     fileService: HttpFileService(),
  //     stalePeriod: const Duration(days: 5),
  //     maxNrOfCacheObjects: 50,
  //   ),
  // );

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HotdCubit, HotdState>(
      builder: (context, state) => InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return SeriesDetails(index, ViewModel());
          }));
        },
        child: ConditionalBuilder(
          builder: (context) => Column(
            children: [
              Padding(
                padding: EdgeInsets.all(2.6.h),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(5.h)),
                  child: ConditionalBuilder(
                    builder: (context) => CachedNetworkImage(
                      fit: BoxFit.fill,
                      imageUrl: "${viewModel.getSeriesImage(index)}",
                      height: MediaQuery.of(context).size.height * .705,
                      placeholder: (context, url) =>
                          const Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                    condition: viewModel.getSeriesImage(index) != null,
                    fallback: (context) =>
                        const Center(child: CircularProgressIndicator()),
                  ),
                ),
              ),
              Text("${viewModel.getTitleList(index)}",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(fontSize: 10.sp, color: Colors.white)),
              SizedBox(
                height: 1.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('asstes/icons/star_fill.svg'),
                  SizedBox(
                    width: 1.h,
                  ),
                  Text(
                    "${viewModel.getRatingList(index)}",
                    style:
                        TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500),
                  ),
                ],
              )
            ],
          ),
          condition: viewModel.getSeriesImage(index) != null,
          fallback: (context) =>
              const Center(child: CircularProgressIndicator()),
        ),
      ),
      listener: (context, state) {},
    );
  }
}
