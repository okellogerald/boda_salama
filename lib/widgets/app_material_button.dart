import '../source.dart';

class AppMaterialButton extends StatefulWidget {
  const AppMaterialButton(
      {required this.child,
      required this.onPressed,
      this.borderRadius = 0,
      this.elevation = 0.0,
      this.padding = EdgeInsets.zero,
      this.margin = EdgeInsets.zero,
      this.color = Colors.transparent,
      this.shadowColor = Colors.transparent,
      key})
      : super(key: key);

  final Widget child;
  final VoidCallback onPressed;
  final double borderRadius;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final Color color, shadowColor;
  final double elevation;

  @override
  State<AppMaterialButton> createState() => _AppMaterialButtonState();
}

class _AppMaterialButtonState extends State<AppMaterialButton>
    with SingleTickerProviderStateMixin {
  final isTappedNotifier = ValueNotifier<bool>(false);

  late final AnimationController controller;
  late final Animation animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    animation =
        ColorTween(begin: widget.color, end: Colors.grey.withOpacity(.25))
            .animate(controller)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) controller.reverse();
            if (status == AnimationStatus.reverse) widget.onPressed();
          });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        controller.forward();
      },
      padding: EdgeInsets.zero,
      splashColor: Colors.transparent,
      child: _animatedChild(),
    );
  }

  _animatedChild() {
    return AnimatedBuilder(
        animation: animation,
        child: widget.child,
        builder: (_, child) {
          return Material(
            elevation: widget.elevation,
            shadowColor: widget.shadowColor,
            borderRadius:
                BorderRadius.all(Radius.circular(widget.borderRadius)),
            child: Container(
              child: child,
              padding: widget.padding,
              margin: widget.margin,
              decoration: BoxDecoration(
                  color: animation.value,
                  borderRadius:
                      BorderRadius.all(Radius.circular(widget.borderRadius))),
            ),
          );
        });
  }
}
