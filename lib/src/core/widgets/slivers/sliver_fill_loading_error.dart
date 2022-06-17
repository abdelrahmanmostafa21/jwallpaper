import 'package:flutter/material.dart';
import 'package:jwallpaper/src/config/constants/index.dart';
import 'package:jwallpaper/src/core/widgets/animations/index.dart';
import 'package:jwallpaper/src/core/widgets/loaders/index.dart';

/// A [LoadingDataError] widget for a [CustomScrollView].
///
/// Builds an optional retry button when [onRetry] is not `null`.
class SliverFillLoadingError extends StatelessWidget {
  const SliverFillLoadingError({
    required this.message,
    Key? key,
    this.onRetry,
    this.onClearFilter,
  }) : super(key: key);

  final Widget message;
  final VoidCallback? onRetry;
  final VoidCallback? onClearFilter;

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: FadeAnimation(
        duration: kShortAnimationDuration,
        curve: Curves.easeInOut,
        child: LoadingDataError(
          message: message,
          onRetry: onRetry,
          onClearFilter: onClearFilter,
        ),
      ),
    );
  }
}
