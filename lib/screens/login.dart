import 'package:flutter/material.dart';
import 'package:reservapp/assets/widgets/back_button.dart';
import 'package:reservapp/auth/local_storage.dart';
import 'package:reservapp/screens/home_page.dart';
import 'package:reservapp/services/user_service.dart';
import '../controllers/user_controller.dart';
import '../models/user.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: TelaLogin()));
  }
}

class TelaLogin extends StatelessWidget {
  const TelaLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(left: 5.0, right: 5.0),
      children: [
        const BackButton(),
        loginInfoText,
        const LoginForm(),
      ],
    );
  }
}

Widget loginInfoText = const Padding(
    padding: EdgeInsets.only(top: 25.0, left: 20.0, right: 20.0),
    child: Text(
      'Insira suas informações para realizar o login',
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

class EnterButton extends StatefulWidget {
  const EnterButton({super.key});

  @override
  State<EnterButton> createState() => _EnterButton();
}

class _EnterButton extends State<EnterButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.fromLTRB(20, 80, 20, 20),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            minimumSize: const Size(300, 50),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        onPressed: () => {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
          )
        },
        child: const Text(
          'Entrar',
          style: TextStyle(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
          textScaleFactor: 1.3,
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LoginForm();
  }
}

class _LoginForm extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  UserController userController = UserController(UserService());
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
                  const EdgeInsets.only(top: 25.0, left: 20.0, right: 20.0),
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
                  const EdgeInsets.only(top: 25.0, left: 20.0, right: 20.0),
              child: TextFormField(
                controller: passwordController,
                obscureText: true,
                obscuringCharacter: "*",
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Senha',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "O campo \"Senha\" não pode ser vazio.";
                  }
                  return null;
                },
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.fromLTRB(20, 80, 20, 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(300, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    await userController
                        .loginUser(
                            emailController.text, passwordController.text)
                        .then((jsonResponse) async {
                      if (jsonResponse.containsKey("error")) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Erro: ${jsonResponse['error']}')));
                      } else {
                        User user = User.fromJson(jsonResponse);
                        await LocalStorage()
                            .setUser(user.idUser, user.email, user.name,
                                user.pictureUrl)
                            .then((boolean) {
                          if (boolean == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        'Não foi possível armazenar as informações do servidor. Verifique a memória do dispositivo.')));
                          } else {
                            Navigator.of(context).pushNamedAndRemoveUntil('/home', (route) => false);
                          }
                        });
                      }
                    }).catchError((error, stack) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Erro: $error')));
                      throw error;
                    });
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Falha ao logar, tente novamente.')));
                  }
                },
                child: const Text(
                  'Entrar',
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
