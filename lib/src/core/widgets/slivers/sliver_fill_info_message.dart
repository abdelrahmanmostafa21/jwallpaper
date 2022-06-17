import 'package:flutter/material.dart';
import 'package:jwallpaper/src/core/widgets/list/index.dart';

/// A message for the center of a [CustomScrollView].
class SliverFillInfoMessage extends StatelessWidget {
  const SliverFillInfoMessage({
    Key? key,
    this.primaryMessage,
    this.secondaryMessage,
  }) : super(key: key);

  final Widget? primaryMessage;
  final Widget? secondaryMessage;

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: ListInfoMessage(
        primaryMessage: primaryMessage,
        secondaryMessage: secondaryMessage,
      ),
    );
  }
}
