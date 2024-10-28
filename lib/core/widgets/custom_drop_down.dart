import 'package:flutter/material.dart';
import 'package:hawdaj/core/app_style.dart';

class CustomDropdown<T> extends StatelessWidget {
  final List<T> items;
  final String label;
  final T? value;
  final ValueChanged<T?> onChanged;
  final String hint;

  const CustomDropdown({
    super.key,
    required this.items,
    required this.label,
    this.value,
    required this.onChanged,
    required this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppStyle.style16W500Black.copyWith()),
        const SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0), // Rounded corners
            boxShadow: const [
              BoxShadow(
                color: Color(0x07000000),
                blurRadius: 24,
                offset: Offset(0, 3),
                spreadRadius: 0,
              )
            ],
          ),
          child: DropdownButtonFormField<T>(
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 20),
              border: const OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: Colors.black.withOpacity(0.1),
                ),
              ),
            ),
            value: value,
            onChanged: onChanged,
            icon: const Icon(
              Icons.keyboard_arrow_down_outlined,
              color: Color(0xff5EA1D8),
            ),
            hint: Text(hint,
                style: AppStyle.style14W500Black
                    .copyWith(color: const Color(0xFF797979))),
            items: items.map((T item) {
              return DropdownMenuItem<T>(
                value: item,
                child: Text(item.toString()), // Customize how the item appears
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
