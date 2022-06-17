import 'package:flutter/material.dart';
import 'package:jwallpaper/src/config/layout/index.dart';
import 'package:jwallpaper/src/core/widgets/layout/index.dart';
import 'package:provider/provider.dart';

/// A tab for a [-AppTabBar].
class AppTab extends StatefulWidget {
  const AppTab({
    required this.icon,
    Key? key,
    this.text,
    this.cardColor,
    this.selectedCardColor,
    this.selectedForegroundColor,
  }) : super(key: key);

  final Widget icon;
  final Widget? text;

  final Color? cardColor;
  final Color? selectedCardColor;
  final Color? selectedForegroundColor;

  static double height(BuildContext context) {
    final iconSize = Theme.of(context).iconTheme.size!;

    return tabPadding(context) * 2 + iconSize;
  }

  static double tabPadding(BuildContext context) {
    return context.read<LayoutConfigCubit>().state.paddingValue;
  }

  @override
  _AppTabState createState() => _AppTabState();
}

class _AppTabState extends State<AppTab> with SingleTickerProviderStateMixin<AppTab> {
  /// Controls how much the tab's associated content is in view.
  ///
  /// 1: Tab content is fully in view and tab should appear selected.
  /// 0: Tab content is not visible.
  late AnimationController _animationController;

  late Animation<Color?> _foregroundColorAnimation;
  late Animation<Color?> _cardColorAnimation;
  late Animation<double> _textOpacityAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(vsync: this)..addListener(() => setState(() {}));

    _textOpacityAnimation = Tween<double>(
      begin: 1,
      end: 0,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0, .5),
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (AppTabScope.of(context) != null) {
      _animationController.value = AppTabScope.of(context)!.animationValue;
    }

    final theme = Theme.of(context);

    final cardColor = widget.cardColor ?? theme.cardTheme.color!;
    final selectedCardColor = widget.selectedCardColor ?? cardColor;

    _cardColorAnimation = ColorTween(
      begin: selectedCardColor,
      end: cardColor.withOpacity(cardColor.opacity * .65),
    ).animate(_animationController);

    _foregroundColorAnimation = ColorTween(
      begin: widget.selectedForegroundColor ?? theme.colorScheme.primary,
      end: theme.textTheme.subtitle1!.color,
    ).animate(_animationController);
  }

  @override
  void dispose() {
    super.dispose();

    _animationController.dispose();
  }

  Widget _buildText() {
    return Opacity(
      opacity: _textOpacityAnimation.value,
      child: Align(
        widthFactor: 1 - _animationController.value,
        alignment: Alignment.centerRight,
        child: Row(
          children: [
            smallHorizontalSpacer,
            widget.text!,
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final iconTheme = IconTheme.of(context);

    return AnimatedBuilder(
      animation: _animationController,
      builder: (_, __) => Card(
        color: _cardColorAnimation.value,
        child: Padding(
          padding: EdgeInsets.all(AppTab.tabPadding(context)),
          child: IconTheme(
            data: iconTheme.copyWith(
              color: _foregroundColorAnimation.value,
            ),
            child: DefaultTextStyle(
              style: theme.textTheme.subtitle1!.copyWith(
                color: _foregroundColorAnimation.value,
              ),
              child: SizedBox(
                height: iconTheme.size,
                child: Row(
                  children: [
                    widget.icon,
                    if (widget.text != null) _buildText(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Exposes values for the [AppTab].
class AppTabScope extends InheritedWidget {
  const AppTabScope({
    required this.index,
    required this.animationValue,
    required Widget child,
    Key? key,
  }) : super(key: key, child: child);

  final int index;

  /// A value between 0 and 1 that corresponds to how much the tab content
  /// for [index] is in view.
  final double animationValue;

  static AppTabScope? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppTabScope>();
  }

  @override
  bool updateShouldNotify(AppTabScope oldWidget) {
    return oldWidget.index != index || oldWidget.animationValue != animationValue;
  }
}
