import 'package:flutter/material.dart';
import 'package:jwallpaper/src/config/constants/index.dart';
import 'package:jwallpaper/src/core/widgets/layout/index.dart';
import 'package:jwallpaper/src/core/widgets/loaders/index.dart';

/// Builds a status message based on the [LoadingStatus] of the [notifier].
class LoadingStatusMessage extends StatefulWidget {
  const LoadingStatusMessage({
    required this.notifier,
    Key? key,
  }) : super(key: key);

  final ValueNotifier<LoadingStatus> notifier;

  @override
  _LoadingStatusMessageState createState() => _LoadingStatusMessageState();
}

class _LoadingStatusMessageState extends State<LoadingStatusMessage> {
  @override
  void initState() {
    super.initState();

    widget.notifier.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final status = widget.notifier.value;

    return AnimatedSwitcher(
      duration: kShortAnimationDuration,
      switchInCurve: Curves.easeInOut,
      switchOutCurve: Curves.easeInOut,
      child: Row(
        key: ValueKey(status),
        children: [
          Flexible(
            child: Text(
              status.message,
              style: theme.textTheme.subtitle2,
            ),
          ),
          if (status.state == LoadingState.inProgress) ...[
            horizontalSpacer,
            SizedBox(
              width: 18,
              height: 18,
              child: LoadingWidget(
                loadingColor: theme.colorScheme.secondary,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
