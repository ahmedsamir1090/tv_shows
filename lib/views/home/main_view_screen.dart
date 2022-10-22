import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv_shows/views/home/series_carousel.dart';

import '../../shared/injection.dart';
import '../../view_model/cubit/hotd_cubit.dart';
import '../../view_model/view_model.dart';

class HomeView extends StatefulWidget {
  static const String id = "HomeView";

  HomeView(this.viewModel, {Key? key}) : super(key: key);
  ViewModel viewModel;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HotdCubit, HotdState>(
      builder: (context, state) => Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          title: Text("TV Shows", style: Theme.of(context).textTheme.headline1),
          // leading: IconButton(
          //   icon: SvgPicture.asset(
          //     "asstes/icons/menu.svg",
          //   ),
          //   onPressed: () {
          //     scaffoldKey.currentState?.openDrawer();
          //   },
          // ),
        ),
        drawerEdgeDragWidth: MediaQuery.of(context).size.width * .2,
        // drawer: Drawer(
        //   width: 250,
        //   backgroundColor: Colors.cyan,
        //   child: Scaffold(
        //     appBar: AppBar(
        //         centerTitle: true,
        //         leading: null,
        //         title: TextButton(
        //           onPressed: () {},
        //           child: const Text("Home"),
        //         )),
        //     body: Column(
        //       children: const [
        //         Text("Series"),
        //       ],
        //     ),
        //   ),
        // ),
        body: Column(
          children: [
            Row(
              children: [
                Spacer(),
                IconButton(
                    onPressed: () {
                      getIt<HotdCubit>().changeView();
                    },
                    icon: getIt<HotdCubit>().listView == false
                        ? Icon(Icons.grid_view)
                        : Icon(Icons.view_list)),
              ],
            ),
            SeriesCarousel(),
          ],
        ),
      ),
      listener: (context, state) {},
    );
  }
}
