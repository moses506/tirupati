import 'package:flutter/material.dart';

class CustomDropdown<T> extends StatelessWidget {
  final T? value;
  final String labelText;
  final double? hPadding;
  final List<T> items;
  final Function(T?) onChanged;
  final String Function(T) itemLabelBuilder;
final Icon? icon;
  const CustomDropdown({
    super.key,
    required this.value,
    required this.labelText,
    this.hPadding,
    required this.items,
    required this.onChanged,
    required this.itemLabelBuilder,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: hPadding ?? 0),
      child: SizedBox(
        height: 50,
        child: DropdownButtonFormField<T>(
          value: value,
          isExpanded: true,
          decoration: InputDecoration(prefixIcon:
             icon,
            hintText: labelText,
            labelStyle: const TextStyle(
              
              fontSize: 12,
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          onChanged: onChanged,
          items:
              items.map<DropdownMenuItem<T>>((T item) {
                return DropdownMenuItem<T>(
                  value: item,
                  child: Text(
                    itemLabelBuilder(
                      item,
                    ), // Use itemLabelBuilder for dynamic text
                    style: const TextStyle(fontSize: 14),
                  ),
                );
              }).toList(),
        ),
      ),
    );
  }
}
