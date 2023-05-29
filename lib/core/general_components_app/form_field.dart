
// ignore_for_file: must_be_immutable

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../style/color_consts.dart';
import '../style/sizes_consts.dart';
import '../style/text_style_consts.dart';

class DefaultFormField extends StatelessWidget {
  String labelText;
  ScrollController? scrollController;
  TextEditingController controller;
  TextInputType type;
  Function onSubmit;
  Function onChange;
  Function onTap;
  bool obscureText = false;
  Function validate;
  String? hintText;
  String?suffixText;
  Widget? prefixIcon;
  Function prefixPressed;
  Widget? suffixIcon;
  Color suffixColor;
  int? maxLines;
  Color prefixColor;
  dynamic initialValue;
  Function suffixPressed;
  bool isClickable = true;
  bool readOnly = false;
  bool autoFocus = false;
  FocusNode? focusNode;
  bool removeBorder;
  double height;
  double? width;
  bool? timePickerFree;
  EdgeInsetsGeometry? contentPadding;
  TextInputAction?keyboardType;
  List<TextInputFormatter>? inputFormatter;
  Iterable<String>?autofillHints;
  VoidCallback?onEditingComplete;
  DefaultFormField(
      {Key? key,
        this.scrollController,
        this.keyboardType,
        required this.labelText,
        required this.controller,
        required this.type,
        required this.onSubmit,
        required this.onChange,
        this.suffixText,
        required this.focusNode,
        required this.onTap,
        this.removeBorder = true,
        this.obscureText = false,
        this.timePickerFree=true,
        required this.validate,
        this.inputFormatter,
        this.prefixColor = ColorConsts.blackColor,
        this.prefixIcon,
        this.onEditingComplete,
        required this.prefixPressed,
        this.suffixIcon,
        this.suffixColor = ColorConsts.blackColor,
        required this.suffixPressed,
        this.isClickable = true,
        this.readOnly = false,
        this.autofillHints,
        this.contentPadding,
        this.initialValue,
        this.height = SizeConsts.s58,
        this.width,
        this.maxLines,
        this.hintText,
        this.autoFocus = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:height,
      width: width,
      child: InkWell(
        onTap: isClickable == false
            ? () {
          onTap();
        }
            : null,
        child: Container(
          alignment: AlignmentDirectional.center,
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
          decoration: removeBorder
              ?const BoxDecoration(
          )
              : null,
          child: Align(
            alignment: Alignment.centerLeft,
            child: TextFormField(
              key: key,
              scrollController: scrollController,
              textInputAction:keyboardType??TextInputAction.done,
              maxLines: maxLines,
              autofocus: autoFocus,
              controller: controller,
              focusNode: focusNode,
              keyboardType: type,
              obscureText: obscureText,
              readOnly: readOnly,
              enabled: isClickable,
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
                  suffixText:suffixText,
                  suffixStyle:TextStyleConsts.textMedium,
                  labelText: labelText,
                  hintText: hintText,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.0),
                    borderSide:const BorderSide(
                      //color: Colors.red,
                      color: ColorConsts.whiteColor,
                      // width: 2.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide:const BorderSide(
                      color: ColorConsts.whiteColor,
                    ),
                  ),
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
                  hintStyle: TextStyleConsts.textMedium,
                  labelStyle: TextStyleConsts.textMedium,
                  filled: removeBorder ? true : false,
                  errorStyle: const TextStyle(color:ColorConsts.blackColor),
                  contentPadding: const EdgeInsets.only(
                      right: SizeConsts.s10, left: SizeConsts.s10, bottom: SizeConsts.s10, top: SizeConsts.s10)),
              style: TextStyleConsts.textMedium,
              autofillHints:autofillHints,
              onEditingComplete:onEditingComplete ,
            ),
          ),
        ),
      ),
    );
  }
}


void doneBotToast({required String title}) {
  BotToast.showSimpleNotification(
      titleStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: ColorConsts.whiteColor,
      ),
      onClose: (){
        return;
      },
      closeIcon:const Icon(Icons.check) ,
      hideCloseButton: false,
      title: title,
      subTitleStyle:const TextStyle(
        color: ColorConsts.whiteColor,
        fontSize: 14,
      ) ,
      backgroundColor:Colors.green,
      borderRadius:14.0
  );
}

void errorBotToast({required String title}) {
  BotToast.showSimpleNotification(
      titleStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: ColorConsts.whiteColor,
      ),
      onClose: (){
        return;
      },
      closeIcon:const Icon(Icons.close) ,
      hideCloseButton: false,
      title: title,
      subTitleStyle:const TextStyle(
        color: ColorConsts.whiteColor,
        fontSize: 14,
      ) ,
      backgroundColor:Colors.red,
      borderRadius:14.0
  );
}
