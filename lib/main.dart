import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ReservApp',
      theme: ThemeData(
        colorScheme: const ColorScheme(
            brightness: Brightness.light,
            primary: Color(0xFFF58008),
            onPrimary: Colors.white,
            secondary: Color(0xFFF58008),
            onSecondary: Colors.white,
            tertiary: Color(0xFFD9D9D9),
            onTertiary: Colors.white,
            error: Colors.red,
            onError: Colors.black,
            background: Color(0xFFFDFDFD),
            onBackground: Colors.black,
            surface: Colors.white,
            onSurface: Colors.grey
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(foregroundColor: const Color(0xFFF58008)),
        ),
        //primarySwatch: Colors.orange,

        fontFamily: 'Quicksand'
      ),
      home: TelaBemVindo(),
    );
  }
}

class TelaBemVindo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.only(left: 5.0, right: 5.0),
        children: [
          Image.asset(
            'lib/assets/food.png',
            width: 360,
            height: 240,
            fit: BoxFit.cover,
          ),
          welcomeText,
          welcomeSubtext,
          const RegisterButton(),
          const LoginButton(),
        ],
      ),
    );
  }
  
}

Widget welcomeText = const Padding(
  padding: EdgeInsets.only(top: 25.0, left: 20.0, right: 20.0),
  child: Text(
    'Bem-vindo',
    textAlign: TextAlign.center,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(fontWeight: FontWeight.bold),
    textScaleFactor: 1.7,
  )
);

Widget welcomeSubtext = const Padding(
  padding: EdgeInsets.only(top: 25.0, left: 25.0, right: 25.0, bottom: 20.0),
  child: Text(
    'Bem-vindo ao ReservAPP, o melhor aplicativo para reserva de restaurantes!',
    textAlign: TextAlign.center,
    style: TextStyle(fontWeight: FontWeight.normal),
    textScaleFactor: 1.3,
  )
);


class RegisterButton extends StatefulWidget {
  const RegisterButton({super.key});

  @override
  State<RegisterButton> createState() => _RegisterButton();
}

class _RegisterButton extends State<RegisterButton>{

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(20.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(300, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
          )
        ),
        onPressed: () => {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SecondRoute()),
          )
        },
        child: const Text(
          'Sou novo',
          style: TextStyle(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
          textScaleFactor: 1.3,
        ),
      ),
    );
  }

}

class LoginButton extends StatefulWidget {
  const LoginButton({super.key});

  @override
  State<LoginButton> createState() => _LoginButton();
}

class _LoginButton extends State<LoginButton>{
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: () => {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SecondRoute()),
          )
        },
        child: const Text(
          'Já tenho conta',
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold),
          textScaleFactor: 1.3,
        ),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

}
