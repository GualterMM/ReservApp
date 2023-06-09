import 'package:flutter/material.dart';
import 'package:reservapp/assets/widgets/back_button.dart';
import 'package:reservapp/controllers/user_controller.dart';
import 'package:reservapp/models/user.dart';
import 'package:reservapp/screens/registration_success.dart';
import 'package:reservapp/services/user_service.dart';

class Registration extends StatelessWidget {
  Registration({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: TelaRegistro()));
  }
}

class TelaRegistro extends StatelessWidget {
  const TelaRegistro({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(left: 5.0, right: 5.0),
      children: [
        const BackButton(),
        registerInfoText,
        const RegistrationForm(),
      ],
    );
  }
}

Widget registerInfoText = const Padding(
    padding: EdgeInsets.only(top: 25.0, left: 20.0, right: 20.0),
    child: Text(
      'Preencha as informações para efetuar o seu cadastro',
      textAlign: TextAlign.left,
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(fontWeight: FontWeight.bold),
      textScaleFactor: 1.8,
    ));

class BackButton extends StatefulWidget {
  const BackButton({super.key});

  @override
  State<BackButton> createState() => _BackButton();
}

class _BackButton extends State<BackButton> {
  @override
  Widget build(BuildContext context) {
    return Align(alignment: Alignment.topLeft, child: backButton(context));
  }
}

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  State<RegistrationForm> createState() {
    return _RegistrationForm();
  }
}

class _RegistrationForm extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();
  UserController userController = UserController(UserService());
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
              child: TextFormField(
                controller: nameController,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Nome',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "O campo \"Nome\" não pode ser vazio.";
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
              child: TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'E-mail',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "O campo \"E-mail\" não pode ser vazio.";
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
              child: TextFormField(
                controller: passwordController,
                obscureText: true,
                obscuringCharacter: "*",
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Senha',
                    errorMaxLines: 3),
                validator: (value) {
                  RegExp regex = RegExp(
                      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                  if (value == null || value.isEmpty) {
                    return "O campo \"Senha\" não pode ser vazio.";
                  } else if (!regex.hasMatch(value)) {
                    return "A senha deve conter ao menos uma letra maiúscula, uma minúscula, um número, um carácter especial e ser 8 carácteres de tamanho.";
                  }
                  return null;
                },
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding:
                  const EdgeInsets.only(top: 100.0, left: 20.0, right: 20.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(300, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    await userController
                        .registerUser(nameController.text, emailController.text,
                            passwordController.text)
                        .then((jsonResponse) {
                      if (jsonResponse.containsKey("error")) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Erro: ${jsonResponse['error']}')));
                      } else {
                        User user = User.fromJson(jsonResponse);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegistrationSucess(
                                    user: user.name,
                                  )),
                        );
                      }
                    }).catchError((error, stack) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Erro: $error')));
                      throw error;
                    });
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Falha ao cadastrar, tente novamente.')));
                  }
                },
                child: const Text(
                  'Finalizar Cadastro',
                  style: TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                  textScaleFactor: 1.3,
                ),
              ),
            )
          ],
        ));
  }
}
