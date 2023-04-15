import 'package:flutter/material.dart';
import 'package:reservapp/screens/HomePage.dart';

class Login extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: TelaLogin());
  }
}

class TelaLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(left: 5.0, right: 5.0),
      children: [
        const BackButton(),
        loginInfoText,
        Padding(
          padding: EdgeInsets.only(top: 25.0, left: 20.0, right: 20.0),
          child: TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'E-mail',
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 25.0, left: 20.0, right: 20.0),
          child: TextFormField(
            obscureText: true,
            obscuringCharacter: "*",
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Senha',
            ),
          ),
        ),
        const EnterButton(),
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
    return Container(
      alignment: Alignment.topLeft,
      padding: const EdgeInsets.all(20.0),
      child: Ink(
        decoration: ShapeDecoration(
          color: Theme.of(context).colorScheme.primary,
          shape: const CircleBorder(),
        ),
        child: IconButton(
          iconSize: 30,
          icon: const Icon(Icons.arrow_back),
          color: Theme.of(context).colorScheme.tertiary,
          onPressed: () => {
            Navigator.pop(context)
          },
        ),
      ),
    );
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
            MaterialPageRoute(builder: (context) => HomePage()),
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

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
