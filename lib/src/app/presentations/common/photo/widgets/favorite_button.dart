import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jwallpaper/src/app/presentations/common/photo/view_model/photo_view_model.dart';
import 'package:jwallpaper/src/config/theme/index.dart';
import 'package:jwallpaper/src/core/widgets/buttons/index.dart';
import 'package:provider/provider.dart';

/// The favorite button for the `[PostCardActionsRow]`.
class FavoriteButton extends StatelessWidget {
  const FavoriteButton({
    Key? key,
    this.padding = const EdgeInsets.all(8),
    this.iconSize = 22,
    this.sizeDelta = 0,
  }) : super(key: key);

  final EdgeInsets padding;
  final double iconSize;
  final double sizeDelta;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appTheme = context.watch<AppTheme>();

    final photoViewModel = context.watch<PhotoViewModel>();

    print(photoViewModel.isLiked);
    return ActionButton(
      active: photoViewModel.isLiked,
      padding: padding,
      activeIconColor: appTheme.favoriteColor,
      activeTextStyle: theme.textTheme.button!
          .copyWith(
            color: appTheme.favoriteColor,
            fontWeight: FontWeight.bold,
          )
          .apply(fontSizeDelta: sizeDelta),
      inactiveTextStyle: theme.textTheme.button!
          .copyWith(color: theme.textTheme.bodyText2!.color)
          .apply(fontSizeDelta: sizeDelta),
      activate: photoViewModel.onFavorite,
      deactivate: photoViewModel.onUnFavorite,
      iconSize: iconSize,
      iconBuilder: (_, active, size) => Icon(
        active ? CupertinoIcons.heart_solid : CupertinoIcons.heart,
        size: size,
      ),
    );
  }
}
