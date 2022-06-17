import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jwallpaper/src/app/presentations/common/photo/widgets/favorite_button.dart';
import 'package:jwallpaper/src/app/presentations/common/media/media_bottom_sheet.dart';
import 'package:jwallpaper/src/app/presentations/common/photo/widgets/view_more_action_button.dart';
import 'package:jwallpaper/src/config/constants/index.dart';
import 'package:jwallpaper/src/core/widgets/buttons/index.dart';

class MediaOverlayActionRow extends StatelessWidget {
  const MediaOverlayActionRow({
    required this.onDownload,
    required this.onOpenExternally,
    required this.onShare,
    Key? key,
  }) : super(key: key);

  final VoidCallback onDownload;
  final VoidCallback onOpenExternally;
  final VoidCallback onShare;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Theme(
      data: theme.copyWith(
        // force foreground colors to be white since they are always on a
        // dark background (independent of the theme)
        iconTheme: theme.iconTheme.copyWith(size: 24, color: Colors.white),
        textTheme: theme.textTheme.copyWith(
          button: theme.textTheme.button!.copyWith(
            fontSize: 18,
            color: Colors.white,
          ),
          bodyText2: theme.textTheme.bodyText2!.copyWith(
            color: Colors.white,
          ),
        ),
      ),
      child: Row(
        children: [
          const AnimatedSize(
            duration: kShortAnimationDuration,
            curve: Curves.easeOutCubic,
            alignment: Alignment.centerLeft,
            child: FavoriteButton(
              padding: EdgeInsets.all(16),
            ),
          ),
          const Spacer(),
          AppButton.flat(
            padding: const EdgeInsets.all(16),
            icon: const Icon(CupertinoIcons.arrow_down_to_line),
            onTap: onDownload,
          ),
          ViewMoreActionButton(
            onTap: () => showMediaBottomSheet(
              context,
              onOpenExternally: onOpenExternally,
              onDownload: onDownload,
              onShare: onShare,
            ),
          ),
        ],
      ),
    );
  }
}
