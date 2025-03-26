import 'package:flutter/rendering.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:orizon/app/core/constants/images_string.dart';
import 'package:orizon/app/core/theme/app_theme.dart';
import 'package:orizon/app/core/theme/text_theme.dart';

const Duration _kExpand = Duration(milliseconds: 200);

class CustomExpandedTile extends StatefulWidget {
  const CustomExpandedTile({
    super.key,
    this.children = const <Widget>[],
    this.initiallyExpanded = false,
    this.maintainState = false,
    required this.title,
    this.expandedCrossAxisAlignment,
    this.expandedAlignment = Alignment.bottomLeft,
    this.expansionAnimationStyle,
  }) : assert(
          expandedCrossAxisAlignment != CrossAxisAlignment.baseline,
          'CrossAxisAlignment.baseline is not supported since the expanded children '
          'are aligned in a column, not a row. Try to use another constant.',
        );
  final String title;
  final List<Widget> children;
  final bool initiallyExpanded;
  final bool maintainState;
  final Alignment? expandedAlignment;
  final CrossAxisAlignment? expandedCrossAxisAlignment;
  final AnimationStyle? expansionAnimationStyle;

  @override
  State<CustomExpandedTile> createState() => _CustomExpandedTileState();
}

class _CustomExpandedTileState extends State<CustomExpandedTile>
    with SingleTickerProviderStateMixin {
  static final Animatable<double> _easeInTween = CurveTween(curve: Curves.easeIn);
  final ColorTween _headerColorTween = ColorTween();
  final CurveTween _heightFactorTween = CurveTween(curve: Curves.easeIn);

  late AnimationController _animationController;
  late Animation<double> _heightFactor;
  late Animation<Color?> _headerColor;

  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(duration: _kExpand, vsync: this);
    _heightFactor = _animationController.drive(_heightFactorTween);
    _headerColor = _animationController.drive(_headerColorTween.chain(_easeInTween));

    _isExpanded =
        PageStorage.maybeOf(context)?.readState(context) as bool? ?? widget.initiallyExpanded;
    if (_isExpanded) {
      _animationController.value = 1.0;
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleExpansion() {
    final TextDirection textDirection = WidgetsLocalizations.of(context).textDirection;
    final MaterialLocalizations localizations = MaterialLocalizations.of(context);
    final String stateHint = _isExpanded ? localizations.expandedHint : localizations.collapsedHint;
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _animationController.forward();
      } else {
        _animationController.reverse().then<void>((void value) {
          if (!mounted) {
            return;
          }
          setState(() {
            // Rebuild without widget.children.
          });
        });
      }

      PageStorage.maybeOf(context)?.writeState(context, _isExpanded);
    });

    SemanticsService.announce(stateHint, textDirection);
  }

  Widget _buildChildren(BuildContext context, Widget? child) {
    final ThemeData theme = Theme.of(context);
    final ExpansionTileThemeData expansionTileTheme = ExpansionTileTheme.of(context);
    switch (theme.platform) {
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        break;
    }

    return Container(
      decoration: BoxDecoration(
        color: expansionTileTheme.backgroundColor ?? Colors.transparent,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ListTileTheme.merge(
            iconColor: expansionTileTheme.iconColor,
            textColor: _headerColor.value,
            child: ListTile(
              dense: true,
              contentPadding: EdgeInsets.zero,
              onTap: _toggleExpansion,
              title: Text(
                widget.title,
                style: AppTextStyle.s14.medium.black,
              ),
              trailing: _isExpanded
                  ? RotatedBox(
                      quarterTurns: 3,
                      child: SvgPicture.asset(
                        Images.arrow_left_icon,
                        width: 5,
                        colorFilter: const ColorFilter.mode(
                          AppTheme.grey_color,
                          BlendMode.srcIn,
                        ),
                      ),
                    )
                  : RotatedBox(
                      quarterTurns: 1,
                      child: SvgPicture.asset(
                        Images.arrow_left_icon,
                        width: 5,
                        colorFilter: const ColorFilter.mode(
                          AppTheme.grey_color,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
            ),
          ),
          ClipRect(
            child: Align(
              alignment: widget.expandedAlignment ??
                  expansionTileTheme.expandedAlignment ??
                  Alignment.center,
              heightFactor: _heightFactor.value,
              child: child,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void didUpdateWidget(covariant CustomExpandedTile oldWidget) {
    super.didUpdateWidget(oldWidget);
    final ExpansionTileThemeData expansionTileTheme = ExpansionTileTheme.of(context);
    if (widget.expansionAnimationStyle != oldWidget.expansionAnimationStyle) {
      _updateAnimationDuration(expansionTileTheme);
      _updateHeightFactorCurve(expansionTileTheme);
    }
  }

  @override
  void didChangeDependencies() {
    final ExpansionTileThemeData expansionTileTheme = ExpansionTileTheme.of(context);
    _updateAnimationDuration(expansionTileTheme);
    _updateHeightFactorCurve(expansionTileTheme);
    super.didChangeDependencies();
  }

  void _updateAnimationDuration(ExpansionTileThemeData expansionTileTheme) {
    _animationController.duration = widget.expansionAnimationStyle?.duration ??
        expansionTileTheme.expansionAnimationStyle?.duration ??
        _kExpand;
  }

  void _updateHeightFactorCurve(ExpansionTileThemeData expansionTileTheme) {
    _heightFactorTween.curve = widget.expansionAnimationStyle?.curve ??
        expansionTileTheme.expansionAnimationStyle?.curve ??
        Curves.easeIn;
  }

  @override
  Widget build(BuildContext context) {
    final ExpansionTileThemeData expansionTileTheme = ExpansionTileTheme.of(context);
    final bool closed = !_isExpanded && _animationController.isDismissed;
    final bool shouldRemoveChildren = closed && !widget.maintainState;

    final Widget result = Offstage(
      offstage: closed,
      child: TickerMode(
        enabled: !closed,
        child: Padding(
          padding: expansionTileTheme.childrenPadding ?? EdgeInsets.zero,
          child: Column(
            crossAxisAlignment: widget.expandedCrossAxisAlignment ?? CrossAxisAlignment.center,
            children: widget.children,
          ),
        ),
      ),
    );

    return AnimatedBuilder(
      animation: _animationController.view,
      builder: _buildChildren,
      child: shouldRemoveChildren ? null : result,
    );
  }
}
