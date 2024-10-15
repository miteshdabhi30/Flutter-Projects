import 'package:flutter/material.dart';

class CustomDropDownMenu extends StatefulWidget {
  final String? selectedValue;
  final String hint;
  final List<String> items;
  final ValueChanged<String?> onChanged;
  final double height;
  final double width;

  const CustomDropDownMenu(
      {super.key,
      required this.selectedValue,
      required this.hint,
      required this.items,
      required this.onChanged,
      required this.height,
      required this.width});

  @override
  State<CustomDropDownMenu> createState() => _CustomDropDownMenuState();
}

class _CustomDropDownMenuState extends State<CustomDropDownMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      decoration: BoxDecoration(
          color: Colors.grey.shade300, borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            Expanded(
              child: DropdownButton<String>(
                value: widget.selectedValue,
                hint: Text(widget.hint),
                underline: Container(
                  height: 2,
                  color: Colors.transparent, // Change underline color
                ),
                items: widget.items.map((String item) {
                  return DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: const TextStyle(
                          fontSize: 16, // Change font size here
                          fontWeight: FontWeight.normal, // Change font weight
                        ),
                      ));
                }).toList(),
                onChanged: widget.onChanged,
                isExpanded: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
