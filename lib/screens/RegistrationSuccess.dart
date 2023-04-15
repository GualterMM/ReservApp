import 'package:flutter/material.dart';
import 'package:reservapp/screens/HomePage.dart';

class RegistrationSucess extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TelaBemVindo(),
    );
  }
}

class TelaBemVindo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(left: 5.0, right: 5.0),
      children: [
        Image.asset(
          'lib/assets/images/food.png',
          width: 360,
          height: 240,
          fit: BoxFit.cover,
        ),
        Container(
          child: SizedBox(
            height: 200,
            width: 100,
            child: Image.asset(
              'lib/assets/images/success.png',
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
        congratsText,
        congratsSubtext,
        const ContinueButton(),
      ],
    );
  }
}

Widget congratsText = const Padding(
    padding: EdgeInsets.only(top: 25.0, left: 20.0, right: 20.0),
    child: Text(
      'Parabéns!',
      textAlign: TextAlign.center,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(fontWeight: FontWeight.bold),
      textScaleFactor: 1.7,
    ));

Widget congratsSubtext = const Padding(
    padding: EdgeInsets.only(top: 25.0, left: 25.0, right: 25.0, bottom: 20.0),
    child: Text(
      'Seu cadastro foi concluído com sucesso',
      textAlign: TextAlign.center,
      style: TextStyle(fontWeight: FontWeight.normal),
      textScaleFactor: 1.3,
    ));

class ContinueButton extends StatefulWidget {
  const ContinueButton({super.key});

  @override
  State<ContinueButton> createState() => _ContinueButton();
}

class _ContinueButton extends State<ContinueButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(20.0),
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
          'Seguir',
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
