import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class MyFormBuilderTextFieldObscure extends StatefulWidget {
  final String name;
  final String label;
  final Icon icon;
  final Map<String, Object> values;
  final String? Function(String?)? validators;

  const MyFormBuilderTextFieldObscure({
    super.key,
    required this.name,
    required this.label,
    required this.icon,
    required this.values,
    required this.validators,
  });

  @override
  State<MyFormBuilderTextFieldObscure> createState() =>
      _MyFormBuilderTextFieldObscureState();
}

class _MyFormBuilderTextFieldObscureState
    extends State<MyFormBuilderTextFieldObscure> {
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: widget.name,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.never,
        border: const OutlineInputBorder(gapPadding: 12),
        alignLabelWithHint: true,
        labelText: widget.label,
        prefixIcon: widget.icon,
        prefixText: ' ',
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              isObscure = !isObscure;
            });
          },
          child: Icon(
            isObscure ? Icons.visibility_off : Icons.visibility,
          ),
        ),
      ),
      validator: widget.validators,
      onChanged: (value) => widget.values[widget.name] = value ?? '',
      obscureText: isObscure,
    );
  }
}
