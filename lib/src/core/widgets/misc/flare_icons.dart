import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_cache.dart';
import 'package:flare_flutter/provider/asset_flare.dart';
import 'package:flutter/material.dart';

const _path = 'assets/flare';

class FlareIcon extends StatelessWidget {
  const FlareIcon({
    required this.fileName,
    Key? key,
    this.size = 18,
    this.sizeDifference = 0,
    this.offset = Offset.zero,
    this.animation,
    this.color,
  }) : super(key: key);

  /// An animated shining star icon.
  const FlareIcon.shiningStar({
    Key? key,
    double size = 18,
    Offset offset = Offset.zero,
  }) : this(
      key: key,
          fileName: '$_path/shining_star.flr',
          size: size,
          offset: offset,
          animation: 'shining',
        );


  /// The path of the flare asset file.
  final String fileName;

  /// The size is used with the [sizeDifference] to calculate the size of the
  /// container.
  final double size;

  /// The size difference is used to have the flare icon with a given size
  /// appear the same as material icons with the same size.
  final double sizeDifference;

  /// Used to transform the icon using a translation.
  final Offset offset;

  /// The name of the animation that should play.
  final String? animation;

  /// Overrides the icon color when set.
  final Color? color;

  double get _calculatedSize => size + sizeDifference;

  /// Loads the icons and adds them into the cache to make sure a widget
  /// using a [FlareIcon] doesn't appear blank for a few frames when it
  /// builds for the first time.
  static void cacheIcons(BuildContext context) {
    cachedActor(
      AssetFlare(
        bundle: DefaultAssetBundle.of(context),
        name: '$_path/shining_star.flr',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: offset,
      child: SizedBox(
        width: _calculatedSize,
        height: _calculatedSize,
        child: FlareActor(
          fileName,
          animation: animation,
          color: color,
        ),
      ),
    );
  }
}
