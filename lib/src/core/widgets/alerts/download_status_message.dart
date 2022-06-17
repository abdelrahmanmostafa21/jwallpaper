import 'package:flutter/material.dart';
import 'package:jwallpaper/src/config/constants/index.dart';
import 'package:jwallpaper/src/core/utils/services/index.dart';
import 'package:jwallpaper/src/core/widgets/layout/index.dart';


/// Builds a status message based on the [DownloadStatus] of the [notifier].
class DownloadStatusMessage extends StatefulWidget {
   const DownloadStatusMessage({Key? key, 
    required this.notifier,
  }) : super(key: key);

  final ValueNotifier<DownloadStatus> notifier;

  @override
  _DownloadStatusMessageState createState() => _DownloadStatusMessageState();
}

class _DownloadStatusMessageState extends State<DownloadStatusMessage> {
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
          if (status.state == DownloadState.inProgress) ...[
            horizontalSpacer,
            SizedBox(
              width: 18,
              height: 18,
              child: CircularProgressIndicator(
                color: theme.colorScheme.secondary,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
