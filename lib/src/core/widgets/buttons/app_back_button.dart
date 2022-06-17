import 'package:flutter/cupertino.dart';
import 'package:jwallpaper/src/core/widgets/buttons/index.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({
    Key? key,
    this.color,
  }) : super(key: key);

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return AppButton.flat(
      padding: const EdgeInsets.all(16),
      foregroundColor: color,
      icon: Transform.translate(
        offset: const Offset(-1, 0),
        child: const Icon(CupertinoIcons.left_chevron),
      ),
      onTap: Navigator.of(context).maybePop,
    );
  }
}

class AppCloseButton extends StatelessWidget {
  const AppCloseButton({
    Key? key,
    this.color,
  }) : super(key: key);

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return AppButton.flat(
      padding: const EdgeInsets.all(16),
      foregroundColor: color,
      icon: Transform.translate(
        offset: const Offset(-1, 0),
        child: const Icon(CupertinoIcons.xmark),
      ),
      onTap: Navigator.of(context).maybePop,
    );
  }
}
