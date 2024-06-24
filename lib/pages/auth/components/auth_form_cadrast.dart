import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:provider/provider.dart';
import 'package:shop/components/my_form_builder_text_field.dart';
import 'package:shop/components/my_form_builder_text_field_obscure.dart';
import 'package:shop/models/auth.dart';
import 'package:shop/utils/app_routes.dart';

class AuthFormCadrast extends StatefulWidget {
  const AuthFormCadrast({super.key});

  @override
  State<AuthFormCadrast> createState() => _AuthFormCadrastState();
}

class _AuthFormCadrastState extends State<AuthFormCadrast> {
  late Map<String, Object> loginValues;
  final _formKey = GlobalKey<FormBuilderState>();
  bool isloading = false;

  @override
  void initState() {
    super.initState();
    loginValues = {
      'e-mail': '',
      'senha': '',
    };
  }

  void cadrast() async {
    setState(() {
      isloading = true;
    });

    final authProvider = Provider.of<Auth>(context, listen: false);
    authProvider
        .signUp(loginValues['e-mail'] as String, loginValues['senha'] as String)
        .onError((error, stackTrace) {
      authProvider.showDialogError(context, error.toString()).then((value) {
        setState(() {
          isloading = false;
        });
      });
    }).then((value) {
      setState(() {
        isloading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(20),
      child: FormBuilder(
        key: _formKey,
        child: Column(
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
                FormBuilderValidators.required(errorText: "Digite uma senha"),
                (value) {
                  if (value != null && value.length < 8) {
                    return "A senha tem que ter no minimo 8 digitos";
                  }
                  return null;
                }
              ]),
            ),
            const SizedBox(height: 10),
            MyFormBuilderTextFieldObscure(
              name: 'confirSenha',
              label: 'Confirmar senha',
              icon: const Icon(Icons.lock),
              values: loginValues,
              validators: FormBuilderValidators.compose(
                [
                  FormBuilderValidators.required(errorText: "Digite uma senha"),
                  FormBuilderValidators.min(8,
                      errorText: "A senha tem que ter no minimo 8 digitos"),
                  FormBuilderValidators.max(10,
                      errorText: "A senha tem que ter no maximo 10 digitos"),
                  (value) {
                    if (value !=
                        _formKey.currentState?.fields['senha']?.value) {
                      return "As senhas não são iguais";
                    }
                    if (value != null && value.length < 8) {
                      return "A senha tem que ter no minimo 8 digitos";
                    }
                    return null;
                  }
                ],
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: size.width * 0.90,
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.saveAndValidate() ?? false) {
                    cadrast();
                  }
                },
                child: !isloading
                    ? const Text('Cadrastrar')
                    : const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
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
                    Navigator.of(context)
                        .pushReplacementNamed(AppRoutes.authLogin);
                  },
                  child: const Text("Login"),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
