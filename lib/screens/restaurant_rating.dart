import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:reservapp/screens/home_page.dart';

class RestaurantRating extends StatelessWidget {
  const RestaurantRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.only(left: 5.0, right: 5.0),
        children: [
        Image.asset(
        'lib/assets/images/food.png',
        width: 360,
        height: 240,
        fit: BoxFit.cover,
      ),
      thanksText,
      thanksSubtext,
      Container(
        alignment: AlignmentDirectional.center,
        child: Padding(padding: EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0, bottom: 25.0),
        child: RatingBar.builder(
          initialRating: 3,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
          itemBuilder: (context, _) =>
              Icon(
                Icons.star,
                color: Theme.of(context).colorScheme.primary,
              ),
          onRatingUpdate: (rating) {
            print(rating);
          },
        ),
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

Widget thanksText = const Padding(
    padding: EdgeInsets.only(top: 25.0, left: 20.0, right: 20.0),
    child: Text(
      'Agradecemos sua reserva!',
      textAlign: TextAlign.center,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(fontWeight: FontWeight.bold),
      textScaleFactor: 1.7,
    )
);

Widget thanksSubtext = const Padding(
    padding: EdgeInsets.only(top: 25.0, left: 25.0, right: 25.0, bottom: 20.0),
    child: Text(
      'Por favor adicione uma nota para o restaurante',
      textAlign: TextAlign.center,
      style: TextStyle(fontWeight: FontWeight.normal),
      textScaleFactor: 1.3,
    )
);


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

