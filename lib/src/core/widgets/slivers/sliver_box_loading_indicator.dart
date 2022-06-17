import 'package:flutter/material.dart';
import 'package:jwallpaper/src/config/constants/index.dart';
import 'package:jwallpaper/src/config/layout/index.dart';
import 'package:jwallpaper/src/core/widgets/animations/index.dart';
import 'package:provider/provider.dart';

/// A loading indicator for the beginning or end of a [CustomScrollView].
class SliverBoxLoadingIndicator extends StatelessWidget {
  const SliverBoxLoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final config = context.watch<LayoutConfigCubit>().state;

    return SliverToBoxAdapter(
      child: FadeAnimation(
        duration: kShortAnimationDuration,
        curve: Curves.easeInOut,
        child: Container(
          padding: config.edgeInsets,
          alignment: Alignment.center,
          child: const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
