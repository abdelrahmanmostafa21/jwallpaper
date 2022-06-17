import 'package:flutter/material.dart';
import 'package:jwallpaper/src/config/layout/index.dart';
import 'package:jwallpaper/src/core/widgets/loaders/index.dart';
import 'package:provider/provider.dart';

/// Builds a sliver for the end of a [CustomScrollView] indicating that more
/// data is being requested.
class LoadMoreIndicator extends StatelessWidget {
   const LoadMoreIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final config = context.watch<LayoutConfigCubit>().state;

    return SliverToBoxAdapter(
      child: Container(
        alignment: Alignment.center,
        padding: config.edgeInsets,
        child: const LoadingWidget(),
      ),
    );
  }
}
