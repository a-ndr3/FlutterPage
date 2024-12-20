import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_spa_v3/functions.dart';

class HoverIconButton extends StatefulWidget {
  final Icon icon;
  final VoidCallback? onPressed;
  final double scale;
  final Color color;

  const HoverIconButton({
    Key? key,
    required this.icon,
    this.onPressed,
    this.scale = 1.2,
    required this.color,
  }) : super(key: key);

  @override
  _HoverIconButtonState createState() => _HoverIconButtonState();
}

class _HoverIconButtonState extends State<HoverIconButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final SupportMethods supportMethods = SupportMethods();
    return MouseRegion(
      onEnter: (_) => _setHovered(true),
      onExit: (_) => _setHovered(false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onPressed,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          transform: Matrix4.identity()..scale(isHovered ? widget.scale : 1.0),
          transformAlignment: Alignment.center,
          child: Icon(
            color: widget.color,
            widget.icon.icon,
            size: supportMethods.getCorrectSize(context, 65.sp, 25.sp, 25),
          ),
        ),
      ),
    );
  }

  void _setHovered(bool value) {
    setState(() {
      isHovered = value;
    });
  }
}

class HoverableElevatedButton extends StatefulWidget {
  final Widget child;
  final VoidCallback onPressed;
  final String? url;

  HoverableElevatedButton(
      {required this.child, required this.onPressed, this.url});

  @override
  _HoverableElevatedButtonState createState() =>
      _HoverableElevatedButtonState();
}

class _HoverableElevatedButtonState extends State<HoverableElevatedButton> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    final SupportMethods supportMethods = SupportMethods();
    final buttonStyle = ElevatedButton.styleFrom(
      backgroundColor: _isHovering ? Colors.black : Colors.black,
      shadowColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      foregroundColor: Colors.transparent,
      padding: supportMethods.isMobile(context)
          ? supportMethods.isMobileWidth(context)
              ? EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h)
              : EdgeInsets.symmetric(horizontal: 30.w, vertical: 15.h)
          : EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      side:
          const BorderSide(color: Color.fromRGBO(255, 255, 255, 0.8), width: 2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      elevation: _isHovering ? 3 : 0,
    );

    return MouseRegion(
      onEnter: (_) => _setHovering(true),
      onExit: (_) => _setHovering(false),
      child: Transform.scale(
        scale: _isHovering ? 1.03 : 1,
        alignment: Alignment.center,
        child: ElevatedButton(
          style: buttonStyle,
          onPressed: widget.onPressed,
          child: FractionalTranslation(
            translation: _isHovering ? Offset(-0.005, -0.005) : Offset.zero,
            child: widget.child,
          ),
        ),
      ),
    );
  }

  void _setHovering(bool isHovering) {
    setState(() {
      _isHovering = isHovering;
    });
  }
}
