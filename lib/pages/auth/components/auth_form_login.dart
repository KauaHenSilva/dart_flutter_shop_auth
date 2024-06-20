import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:shop/components/my_form_builder_text_field.dart';
import 'package:shop/components/my_form_builder_text_field_obscure.dart';
import 'package:shop/utils/app_routes.dart';

class AuthFormLogin extends StatefulWidget {
  const AuthFormLogin({super.key});

  @override
  State<AuthFormLogin> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthFormLogin> {
  final _formKey = GlobalKey<FormBuilderState>();
  late Map<String, Object> loginValues;

  bool isloading = false;

  @override
  void initState() {
    super.initState();
    loginValues = {
      'e-mail': '',
      'senha': '',
    };
  }

  void login() {
    setState(() {
      isloading = true;
    });
    Future.delayed(const Duration(seconds: 2)).then((value) {
      setState(() {
        isloading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.all(15),
      child: FormBuilder(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            MyFormBuilderTextField(
              name: 'e-mail',
              label: 'E-mail',
              icon: const Icon(Icons.email),
              values: loginValues,
              validators: FormBuilderValidators.compose([
                FormBuilderValidators.required(errorText: 'digite um email'),
                FormBuilderValidators.email(errorText: 'O email é invalido'),
              ]),
            ),
            const SizedBox(height: 10),
            MyFormBuilderTextFieldObscure(
              name: 'senha',
              label: 'Senha',
              icon: const Icon(Icons.lock),
              values: loginValues,
              validators: FormBuilderValidators.compose([
                FormBuilderValidators.required(errorText: "Confirme sua senha"),
                FormBuilderValidators.min(8,
                    errorText: "A senha tem que ter no minimo 8 digitos"),
                FormBuilderValidators.max(10,
                    errorText: "A senha tem que ter no maximo 10 digitos"),
              ]),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: size.width * 0.90,
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.saveAndValidate() ?? false) {
                    login();
                  }
                },
                child: !isloading
                    ? const Text('Login')
                    : const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(strokeWidth: 2)),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('já possui uma conta?'),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(AppRoutes.authCadrast);
                  },
                  child: const Text("cadrastar"),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
