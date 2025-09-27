import 'package:flutter/material.dart';

class Mybutton extends StatefulWidget {
  final VoidCallback? onTap;
  final Future<void> Function()? onTapAsync;
  final String? text;
  final double? width;
  final double? radius;
  final Color? color;
  final double? height;
  final bool? isDisabled;
  final IconData? icon;
  final Color? buttoncolor;
  final bool enableHover; // 👈 new flag for hover effect

  const Mybutton({
    super.key,
    this.onTap,
    this.color,
    this.text,
    this.width,
    this.onTapAsync,
    this.height,
    this.radius,
    this.isDisabled = false,
    this.icon,
    this.buttoncolor,
    this.enableHover = false, // 👈 default false (disabled)
  }) : assert(
         onTap == null || onTapAsync == null,
         'Use only one: onTap OR onTapAsync',
       );

  @override
  State<Mybutton> createState() => _MybuttonState();
}

class _MybuttonState extends State<Mybutton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final buttonColor =
        widget.enableHover && _isHovered
            // ignore: deprecated_member_use
            ? (widget.color ?? Colors.grey) // 👈 hover effect
            : widget.color;

    return MouseRegion(
      onEnter: (_) {
        if (widget.enableHover) {
          setState(() => _isHovered = true);
        }
      },
      onExit: (_) {
        if (widget.enableHover) {
          setState(() => _isHovered = false);
        }
      },
      child: GestureDetector(
        onTap:
            widget.isDisabled!
                ? null
                : () async {
                  if (widget.onTap != null) {
                    widget.onTap!(); // normal callback
                  } else if (widget.onTapAsync != null) {
                    await widget.onTapAsync!(); // async callback
                  }
                },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: widget.width ?? MediaQuery.of(context).size.width * 0.2,
          height: widget.height ?? MediaQuery.of(context).size.height * 0.06,
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(widget.radius ?? 10),
            boxShadow:
                widget.enableHover && _isHovered
                    ? [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      ),
                    ]
                    : [],
          ),
          child: Center(
            child:
                widget.icon != null
                    ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        children: [
                          Icon(widget.icon, color: widget.buttoncolor),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.01,
                          ),
                          Text(
                            widget.text ?? "",
                            style: TextStyle(
                              color: widget.buttoncolor ?? Colors.black,
                            ),
                          ),
                        ],
                      ),
                    )
                    : Text(
                      widget.text ?? "",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: widget.buttoncolor ?? Colors.black,
                      ),
                    ),
          ),
        ),
      ),
    );
  }
}
