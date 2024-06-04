import 'package:gap/gap.dart';

import '../core/app_export.dart';

class CustomAppTextFormField extends StatelessWidget {
  TextFormFieldShape? shape;

  TextFormFieldPadding? padding;

  TextFormFieldVariant? variant;
  BorderRadius? borderRadius;

  TextStyle? fontStyle;
  TextStyle? hintFontStyle;

  Alignment? alignment;

  double? width;
  EdgeInsetsGeometry? margin;

  TextEditingController? controller;

  FocusNode? focusNode;

  bool? isObscureText;

  TextInputAction? textInputAction;

  TextInputType? textInputType;

  int? maxLines;

  String? hintText;

  Widget? prefix;

  BoxConstraints? prefixConstraints;

  Widget? suffix;
  Color? fillColor;
  Color? borderColor;

  BoxConstraints? suffixConstraints;

  FormFieldValidator<String>? validator;

  bool? readOnly;

  Function()? onTap;

  Function(String)? onChanged;

  CustomAppTextFormField(
      {super.key,
      this.shape,
      this.padding,
      this.variant,
      this.fontStyle,
      this.alignment,
      this.borderColor,
      this.width,
      this.margin,
      this.hintFontStyle,
      this.controller,
      this.focusNode,
      this.borderRadius,
      this.isObscureText = false,
      this.textInputAction = TextInputAction.next,
      this.textInputType = TextInputType.text,
      this.maxLines,
      this.hintText,
      this.fillColor,
      this.prefix,
      this.prefixConstraints,
      this.suffix,
      this.suffixConstraints,
      this.readOnly,
      this.onTap,
      this.onChanged,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: _buildTextFormFieldWidget(),
          )
        : _buildTextFormFieldWidget();
  }

  _buildTextFormFieldWidget() {
    return Container(
      width: width ?? double.maxFinite,
      margin: margin,
      child: TextFormField(
        controller: controller,
        readOnly: readOnly ?? false,
        onTap: onTap,
        onChanged: onChanged,
        focusNode: focusNode,
        style: fontStyle ?? AppStyle.style(14),
        obscureText: isObscureText!,
        textInputAction: textInputAction,
        keyboardType: textInputType,
        maxLines: maxLines ?? 1,
        decoration: _buildDecoration(),
        validator: validator,
      ),
    );
  }

  _buildDecoration() {
    return InputDecoration(
      hintText: hintText ?? "",
      hintStyle: hintFontStyle ?? AppStyle.style(14),
      border: _setBorderStyle(),
      enabledBorder: _setBorderStyle(),
      focusedBorder: _setBorderStyle(),
      disabledBorder: _setBorderStyle(),
      prefixIcon: prefix,

      prefixIconConstraints: prefixConstraints,
      suffixIcon: suffix,
      suffixIconConstraints: suffixConstraints,
      fillColor: fillColor ?? ColorConstant.primaryWhite,
      filled: true,

      isDense: true,
      // contentPadding: _setPadding(),
    );
  }

  _setOutlineBorderRadius() {
    switch (shape) {
      case TextFormFieldShape.RoundedBorder18:
        return BorderRadius.circular(
          getWidth(
            18.00,
          ),
        );

      default:
        return BorderRadius.circular(
          getWidth(
            12.00,
          ),
        );
    }
  }

  _setBorderStyle() {
    switch (variant) {
      case TextFormFieldVariant.White:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: const BorderSide(
            color: ColorConstant.redFF2,
            width: 1,
          ),
        );
      case TextFormFieldVariant.None:
        return InputBorder.none;
      default:
        return OutlineInputBorder(
          borderRadius: borderRadius ?? _setOutlineBorderRadius(),
          borderSide: BorderSide(
            color: borderColor ?? ColorConstant.transparent,
            width: 1,
          ),
        );
    }
  }

// _setPadding() {
//   switch (padding) {
//     case TextFormFieldPadding.PaddingT13:
//       return getPadding(
//         left: 12,
//         top: 13,
//         bottom: 13,
//       );
//     default:
//       return getPadding(
//         left: 12,
//         top: 16,
//         right: 12,
//         bottom: 16,
//       );
//   }
// }
}

enum TextFormFieldShape {
  RoundedBorder12,
  RoundedBorder18,
}

enum TextFormFieldPadding {
  PaddingT14,
  PaddingT13,
}

enum TextFormFieldVariant {
  None,
  OutlineGray200,
  White,
}

enum TextFormFieldFontStyle {
  GilroyMedium16Bluegray40001,
  GilroyMedium16,
  txtGilroyMedium
}

class CustomTextFormFiled extends StatelessWidget {
  final TextEditingController? controller;
  final void Function()? onTap;
  final void Function(String)? onChange;
  final String? text;
  final bool? isEmpty;
  final bool? isObscureText;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? suffixIcons;
  final TextInputAction? textInputAction;

  final TextInputType? textInputType;
  final String? hintText;

  const CustomTextFormFiled({
    super.key,
    this.controller,
    this.onTap,
    this.isEmpty,
    this.text,
    this.hintText,
    this.onChange,
    this.isObscureText = false,
    this.textInputAction = TextInputAction.next,
    this.textInputType = TextInputType.text,
    this.suffixIcons, this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              text ?? '',
              style: AppStyle.style(
                 16,
                fontColor: isEmpty == true
                    ? ColorConstant.textRedFF
                    : ColorConstant.primaryBlack,
              ),
            ),
            Text(
              isEmpty == true ? AppString.isRequired : "",
              style: AppStyle.style(getFontSize(14),
                  fontColor: ColorConstant.textRedFF),
            ),
          ],
        ),
        Gap(getHeight(3)),
        Container(
          decoration: BoxDecoration(
              border: Border.all(
                  color: isEmpty == true
                      ? ColorConstant.textRedFF
                      : ColorConstant.greyE6E6,
                  width: 1),
              borderRadius: BorderRadius.circular(30)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 7),
            child: TextFormField(
              cursorColor: ColorConstant.primaryBlack,
              onTap: onTap,
              onChanged: onChange,
              controller: controller,
              style: AppStyle.style(14,
                  fontColor: ColorConstant.primaryBlack),
              obscureText: isObscureText!,
              textInputAction: textInputAction,
              keyboardType: textInputType,
              inputFormatters:inputFormatters?? [],
              decoration: InputDecoration(
                isDense: true,
                contentPadding: const EdgeInsets.only(left: 10,bottom: 13,top: 10),
                hintText: hintText ?? '',
                hintStyle: AppStyle.style(14, fontColor: ColorConstant.grey9DA),
                border: InputBorder.none,
                suffixIcon: suffixIcons,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
