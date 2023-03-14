library rounded_button;

import 'package:flutter/material.dart';
import 'package:inter_app_text_theme/inter_app_text_theme.dart';
import 'package:size_config/size_config.dart';

enum ButtonType { solid, outlined }

class RoundedButton extends StatelessWidget {
  const RoundedButton(
      {super.key,
      this.onPressed,
      required this.text,
      this.leading,
      this.tailing,
      this.radius = 24,
      this.color = const Color(0xff134E4A),
      this.textColor,
      this.shrinkWrap = false,
      this.contentPadding = 0,
      this.buttonType = ButtonType.solid,
      this.textStyle,
      this.textScaleFactor});
  final void Function()? onPressed;
  final String text;
  final Widget? leading;
  final Widget? tailing;
  final Color color;
  final Color? textColor;
  final double radius;
  final bool shrinkWrap;
  final double contentPadding;
  final ButtonType buttonType;
  final TextStyle? textStyle;
  final double? textScaleFactor;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return ElevatedButton(
      style: ButtonStyle(
          shape: MaterialStateProperty.resolveWith((states) =>
              RoundedRectangleBorder(
                  side: buttonType == ButtonType.solid
                      ? BorderSide.none
                      : BorderSide(color: color),
                  borderRadius: BorderRadius.circular(radius))),
          elevation: MaterialStateProperty.resolveWith((states) => 0),
          backgroundColor: MaterialStateColor.resolveWith((states) =>
              buttonType == ButtonType.solid ? color : Colors.white)),
      onPressed: onPressed,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: contentPadding),
        child: Row(
          mainAxisSize: shrinkWrap ? MainAxisSize.min : MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            leading ?? const SizedBox(),
            Text(
              text,
              textScaleFactor:
                  textScaleFactor ?? SizeConfig.blockSizeHorizontal / 4,
              style: (textStyle ?? AppTheme.appTextTheme.regulerNoneMedium)
                  ?.copyWith(
                color: textColor ??
                    (buttonType == ButtonType.solid
                        ? const Color(0xffffffff)
                        : const Color(0xff000000)),
              ),
            ),
            if (tailing != null)
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: tailing,
              ),
          ],
        ),
      ),
    );
  }
}
