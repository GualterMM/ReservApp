import 'package:flutter/material.dart';
import 'package:reservapp/screens/home_page.dart';
import 'package:reservapp/assets/widgets/back_button.dart';

class Reservation extends StatelessWidget {
  const Reservation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Row(
            children: [
              Row(
                children: [
                  //Expanded(child: child)
                ],
              )
            ],
          ),
          
          Container(
            alignment: AlignmentDirectional.center,
            child: Padding(padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 25.0),
              child:const SendButton()
            ),
          ),

          Padding(
            padding: EdgeInsets.only(top: 45.0, left: 20.0, right: 20.0),
            child: Row(children: [
              const SendButton(),
              const SkipButton(),
            ],),
          )
        ],
      ),);
  }

}

class SendButton extends StatefulWidget {
  const SendButton({super.key});

  @override
  State<SendButton> createState() => _SendButton();
}

class _SendButton extends State<SendButton> {

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(15.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            minimumSize: const Size(200, 50),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
            )
        ),
        onPressed: () =>
        {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          )
        },
        child: const Text(
          'Enviar',
          style: TextStyle(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
          textScaleFactor: 1.3,
        ),
      ),
    );
  }

}

class SkipButton extends StatefulWidget {
  const SkipButton({super.key});

  @override
  State<SkipButton> createState() => _SkipButton();
}

class _SkipButton extends State<SkipButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.only(left: 20),
      child: GestureDetector(
        onTap: () =>
        {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          )
        },
        child: const Text(
          'Pular',
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold),
          textScaleFactor: 1.3,
        ),
      ),
    );
  }
}

