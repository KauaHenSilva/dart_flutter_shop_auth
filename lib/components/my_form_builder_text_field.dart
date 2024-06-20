import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class MyFormBuilderTextField extends StatelessWidget {
  final String name;
  final String label;
  final Icon icon;
  final Map<String, Object> values;
  final String? Function(String?)? validators;

  const MyFormBuilderTextField({
    super.key,
    required this.name,
    required this.label,
    required this.icon,
    required this.values,
    required this.validators,
  });
  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: name,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.never,
        border: const OutlineInputBorder(gapPadding: 12),
        alignLabelWithHint: true,
        labelText: label,
        prefixIcon: icon,
        prefixText: ' ',
      ),
      validator: validators,
      onChanged: (value) => values[name],
    );
  }
}
