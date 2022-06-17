import 'package:flutter/cupertino.dart';
import 'package:jwallpaper/src/app/presentations/common/media/media_overlay.dart';
import 'package:jwallpaper/src/core/widgets/bottom_sheet/index.dart';
import 'package:jwallpaper/src/core/widgets/misc/index.dart';

/// Shows a app bottom sheet for the post media actions.
///
/// If the [url] is provided and no callbacks, the default implementation is
/// used with the [url].
/// Otherwise the callback is used.
void showMediaBottomSheet(
  BuildContext context, {
  String? url,
  VoidCallback? onOpenExternally,
  VoidCallback? onDownload,
  VoidCallback? onShare,
}) {
  assert(onOpenExternally != null || (url != null));
  assert(onDownload != null || (url != null));
  assert(onShare != null || (url != null));

  showAppBottomSheet<void>(
    context,
    hapticFeedback: true,
    children: [
      AppListTile(
        leading: const Icon(CupertinoIcons.square_arrow_left),
        title: const Text('open photo externally'),
        onTap: () {
          if (onOpenExternally != null) {
            onOpenExternally();
          } else {
            defaultOnMediaOpenExternally(url);
          }

          Navigator.of(context).maybePop();
        },
      ),
      AppListTile(
        leading: const Icon(CupertinoIcons.arrow_down_to_line),
        title: const Text('download photo'),
        onTap: () {
          if (onDownload != null) {
            onDownload();
          } else {
            defaultOnMediaDownload(url);
          }

          Navigator.of(context).maybePop();
        },
      ),
      AppListTile(
        leading: const Icon(CupertinoIcons.share),
        title: const Text('share photo'),
        onTap: () {
          if (onShare != null) {
            onShare();
          } else {
            defaultOnMediaShare(url);
          }

          Navigator.of(context).maybePop();
        },
      )
    ],
  );
}
