import 'package:flutter/material.dart';
import 'package:flutter_mvvm_getx/utils/constants/main_theme.dart';

class CustomizedButton extends StatelessWidget {
  const CustomizedButton(
      {required this.onPressed,
        this.iconWidget,
        required this.fontSize,
        required this.title,
        required this.buttonColor,
        required this.isActiveButton,
        required this.height,
        this.width,
        Key? key})
      : super(key: key);

  final Function()? onPressed;
  final String title;
  final double fontSize;
  final double? width;
  final Widget? iconWidget;
  final double height;
  final Color buttonColor;
  final bool isActiveButton;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: RaisedButton(
        color: buttonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
          side: BorderSide(
              color: buttonColor.computeLuminance() >= 0.5
                  ? Colors.black
                  : Colors.white,
              width: 2,
              style: BorderStyle.solid),
        ),
        elevation: 8.0,
        hoverElevation: 8,
        onPressed: isActiveButton
            ? onPressed
            : null,
        disabledColor: Theme.of(context).unselectedWidgetColor,
        child:iconWidget == null
            ? Text(
          title,
          style: MainThemes.textStyleIranBold(
              color: isActiveButton
                  ? buttonColor.computeLuminance() >= 0.5
                  ? Colors.black
                  : Colors.white
                  : Theme.of(context)
                  .unselectedWidgetColor
                  .computeLuminance() >=
                  0.5
                  ? Colors.black
                  : Colors.white,
              fontSize: fontSize),
        )
            : Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            iconWidget!,
            Text(
              title,
              style: MainThemes.textStyleIranBold(
                  color: isActiveButton
                      ? buttonColor.computeLuminance() >= 0.5
                      ? Colors.black
                      : Colors.white
                      : Theme.of(context)
                      .unselectedWidgetColor
                      .computeLuminance() >=
                      0.5
                      ? Colors.black
                      : Colors.white,
                  fontSize: fontSize),
            ),

          ],
        ),
      ),
    );
  }
}