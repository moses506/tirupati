import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddClientTextField extends StatelessWidget {
  const AddClientTextField({
    Key? key,
    this.hintText,
    this.maxLine,
    this.enabled,
    this.keyboardType,
    this.validatorFun,
    this.textController,
    this.prefixIcon,
  }) : super(key: key);

  final String? hintText;
  final TextEditingController? textController;
  final String? Function(String?)? validatorFun;
  final int? maxLine;
  final bool? enabled;
  final TextInputType? keyboardType;
  final IconData? prefixIcon; // Added prefix icon

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xffEAEAEA)),
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),
      child: TextFormField(
        controller: textController,
        maxLines: maxLine ?? 1,
        enabled: enabled ?? true,
        cursorColor: const Color(0xff5B58FF),
        keyboardType: keyboardType ?? TextInputType.text,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText ?? "Enter_your_value".tr(),
          prefixIcon: prefixIcon != null 
              ? Icon(prefixIcon, color: Colors.grey)
              : null,
        ),
        validator: (value) {
          if (validatorFun != null) {
            return validatorFun!(value);
          }
          if (value == null || value.trim().isEmpty) {
            return tr("this_field_is_required");
          }
          return null;
        },
      ),
    );
  }
}