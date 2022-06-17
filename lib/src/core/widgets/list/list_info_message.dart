import 'package:flutter/material.dart';
import 'package:jwallpaper/src/config/constants/index.dart';
import 'package:jwallpaper/src/core/widgets/animations/index.dart';

/// Builds an info message intended to be used inside lists.
///
/// Either [primaryMessage] or [secondaryMessage] must not be `null`.
class ListInfoMessage extends StatelessWidget {
  const ListInfoMessage({
    Key? key,
    this.primaryMessage,
    this.secondaryMessage,
  })  : assert(primaryMessage != null || secondaryMessage != null),
        super(key: key);

  final Widget? primaryMessage;
  final Widget? secondaryMessage;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return FadeAnimation(
      duration: kShortAnimationDuration,
      curve: Curves.easeInOut,
      child: Container(
        padding: const EdgeInsets.all(16),
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (primaryMessage != null)
              DefaultTextStyle(
                style: theme.textTheme.headline6!,
                textAlign: TextAlign.center,
                child: primaryMessage!,
              ),
            if (primaryMessage != null && secondaryMessage != null) const SizedBox(height: 16),
            if (secondaryMessage != null)
              DefaultTextStyle(
                style: theme.textTheme.subtitle2!,
                textAlign: TextAlign.center,
                child: secondaryMessage!,
              ),
          ],
        ),
      ),
    );
  }
}
