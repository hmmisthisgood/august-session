import 'package:flutter/material.dart';

class CommonTextField extends StatelessWidget {
  final String? hintText;
  final String? label;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final int? maxLength, maxLines;
  final bool? enabled;
  final bool readOnly;

  const CommonTextField(
      {super.key,
      this.hintText,
      this.label = "",
      required this.controller,
      this.keyboardType,
      this.onChanged,
      this.onSubmitted,
      this.validator,
      this.prefixIcon,
      this.suffixIcon,
      this.maxLength,
      this.maxLines,
      this.enabled,
      this.readOnly = false});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label!),
          SizedBox(height: 5),
          Container(
            // height: 40,
            child: TextFormField(
              controller: controller,
              // enabled: false,
              maxLines: maxLines,
              readOnly: readOnly,
              enabled: enabled,
              maxLength: maxLength,
              keyboardType: keyboardType,
              onFieldSubmitted: onSubmitted,
              onChanged: onChanged,
              validator: validator,
              // autofocus: true,
              textInputAction: TextInputAction.send,
              decoration: InputDecoration(
                hintText: hintText,
                // labelText: label,
                prefixIcon: prefixIcon,
                suffixIcon: suffixIcon,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green, width: 1)),
                focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 1)),
                errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red)),
                enabledBorder: OutlineInputBorder(),
                disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.yellow)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
