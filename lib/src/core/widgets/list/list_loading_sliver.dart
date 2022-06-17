import 'package:flutter/material.dart';
import 'package:jwallpaper/src/core/widgets/list/index.dart';
import 'package:jwallpaper/src/core/widgets/loaders/loading_widget.dart';

/// Builds a sliver with a [CircularProgressIndicator] indicating that the list
/// content is currently loading.
class ListLoadingSliver extends StatelessWidget {
  const ListLoadingSliver({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SliverFillRemaining(
      hasScrollBody: false,
      child: Center(
        child: LoadingWidget(),
      ),
    );
  }
}
