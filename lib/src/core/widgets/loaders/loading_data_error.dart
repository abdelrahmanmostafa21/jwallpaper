
import 'package:flutter/material.dart';
import 'package:jwallpaper/src/config/layout/index.dart';
import 'package:jwallpaper/src/core/widgets/buttons/index.dart';
import 'package:jwallpaper/src/core/widgets/layout/index.dart';
import 'package:provider/provider.dart';

/// Builds an error message with an optional retry button when [onRetry] is not
/// `null`.
class LoadingDataError extends StatelessWidget {
  const LoadingDataError({
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
    final theme = Theme.of(context);
    final config = context.watch<LayoutConfigCubit>().state;

    return Container(
      padding: config.edgeInsets,
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DefaultTextStyle(
            style: theme.textTheme.headline6!,
            textAlign: TextAlign.center,
            child: message,
          ),
          if (onRetry != null) ...[
            verticalSpacer,
            AppButton.flat(
              dense: true,
              text: const Text('retry'),
              onTap: onRetry,
            ),
          ],
          if (onClearFilter != null) ...[
            verticalSpacer,
            AppButton.flat(
              dense: true,
              text: Text(
                'common.clearFilter',
                style: TextStyle(
                  color: theme.colorScheme.secondary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: onClearFilter,
            ),
          ],
        ],
      ),
    );
  }
}
