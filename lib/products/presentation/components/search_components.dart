
// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import '../../../core/style/color_consts.dart';
import '../../../core/style/sizes_consts.dart';
import '../../../core/style/text_style_consts.dart';

class SearchFormField extends StatelessWidget {
  TextEditingController controller;
  TextInputType type;
  Function onSubmit;
  Function onChange;
  Function onTap;
  bool obscureText = false;
  Function validate;
  String hintText;
  Widget? prefixIcon;
  Function prefixPressed;
  Widget? suffixIcon;
  Color suffixColor;
  TextInputAction?keyboardType;
  int? maxLength;
  Color prefixColor;
  String? initialValue;
  Function suffixPressed;
  bool isClickable = true;
  bool readOnly = false;
  bool autoFocus = false;
  FocusNode? focusNode;
  bool removeBorder;
  double height;
  EdgeInsetsGeometry? contentPadding;


  SearchFormField(
      {Key? key,
        required this.controller,
        required this.type,
        required this.onSubmit,
        required this.onChange,
        required this.focusNode,
        required this.onTap,
        this.removeBorder = true,
        this.obscureText = false,
        required this.validate,
        this.prefixColor = ColorConsts.blackColor,
        required this.hintText,
        this.prefixIcon,
        required this.prefixPressed,
        this.suffixIcon,
        this.suffixColor = ColorConsts.blackColor,
        required this.suffixPressed,
        this.isClickable = true,
        this.readOnly = false,
        this.contentPadding,
        this.initialValue,
        this.height = SizeConsts.s45,
        this.keyboardType,
        this.maxLength,
        this.autoFocus = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:  SizeConsts.s45,
      child: InkWell(
        onTap: isClickable == false
            ? () {
          onTap();
        }
            : null,
        child: Container(
          alignment: AlignmentDirectional.center,
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 4),
          decoration: removeBorder
              ? BoxDecoration(
            color: ColorConsts.blackColor,
              border: Border.all(color: ColorConsts.blackColor),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(SizeConsts.s6),
                topLeft: Radius.circular(SizeConsts.s6),
              ))
              : null,
          child: TextFormField(
            textAlign: TextAlign.center,
            autofocus: autoFocus,
            controller: controller,
            focusNode: focusNode,
            keyboardType: type,
            obscureText: obscureText,
            readOnly: readOnly,
            enabled: isClickable,
            textInputAction: keyboardType??TextInputAction.done,
            initialValue: initialValue,
            onFieldSubmitted: (val) {
              onSubmit();
            },
            onChanged: (val) {
              onChange();
            },
            onTap: () {
              onTap();
            },
            validator: (val) {
              validate;
              return null;
            },
            cursorColor: ColorConsts.blackColor,
            decoration: InputDecoration(
              fillColor: ColorConsts.blackColor,
                hintText: hintText,
                border: InputBorder.none,
                prefixIcon: prefixIcon != null
                    ? IconButton(
                  icon: prefixIcon!,
                  onPressed: () {
                    prefixPressed();
                  },
                )
                    : null,
                suffixIcon: suffixIcon != null
                    ? IconButton(
                  onPressed: () {
                    suffixPressed();
                  },
                  icon: suffixIcon!,
                )
                    : null,
                hintStyle: TextStyleConsts.textSmall.copyWith(color: ColorConsts.whiteColor),
                labelStyle: TextStyle(
                    color: isClickable ?ColorConsts.blackColor : ColorConsts.blackColor,
                    fontSize:  FontSizeConsts.s12),
                filled: true,
                errorStyle: const TextStyle(color: ColorConsts.blackColor),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                contentPadding:
                contentPadding ?? const EdgeInsets.all(10) ),
            style: TextStyleConsts.textSmall.copyWith(color: ColorConsts.whiteColor)
          ),
        ),
      ),
    );
  }
}


class SearchButton extends StatelessWidget {
  double width;
  double height;
  double radius;
  Color buttonBackgroundColor;
  Color? borderColor;
  Widget iconOrTitle;

  SearchButton(
      {Key? key,
        this.width = double.infinity,
        this.height = SizeConsts.s45,
        this.radius = SizeConsts.s6,
        this.buttonBackgroundColor = ColorConsts.blackColor,
        this.borderColor,
        required this.iconOrTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius:const BorderRadius.only(
            bottomRight: Radius.circular(SizeConsts.s6),
            topRight: Radius.circular(SizeConsts.s6)),
        border: Border.all(color: borderColor ?? buttonBackgroundColor),
        color: buttonBackgroundColor,
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).shadowColor,
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Center(child: iconOrTitle
        // child:   Text(
        //   title,
        //   style: TextStyle(
        //     fontSize: 12,
        //     color: borderColor ?? Colors.white,
        //   ),
        // ),
      ),
    );
  }
}



class GeneralSquareButton extends StatelessWidget {
  Widget widget;
  double? scale;
  Color? backgroundColor;

  GeneralSquareButton(
      {this.backgroundColor, this.scale, required this.widget, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: SizeConsts.s4,
      color: backgroundColor ??ColorConsts.whiteColor,
      child: SizedBox(
        height: SizeConsts.s35,
        width: SizeConsts.s35,
        child: Transform.scale(
          scale: scale ?? 1,
          child: widget,
        ),
      ),
    );
  }
}


class GeneralButton extends StatelessWidget {
  double width;
  double height;
  double radius;
  Color buttonBackgroundColor;
  Color? borderColor;
  Color? texColor;
  String title;

  GeneralButton({
    Key? key,
    this.width = double.infinity,
    this.height = SizeConsts.s45,
    this.radius = SizeConsts.s6,
    this.buttonBackgroundColor = ColorConsts.blackColor,
    this.borderColor,
    this.texColor,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(color: borderColor ?? buttonBackgroundColor),
        color: buttonBackgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: SizeConsts.s2,
            blurRadius: SizeConsts.s5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            fontSize: FontSizeConsts.s14,
            color:texColor??ColorConsts.whiteColor  ,
          ),
        ),
      ),
    );
  }
}

