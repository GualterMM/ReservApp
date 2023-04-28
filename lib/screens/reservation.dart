import 'package:flutter/material.dart';
import 'package:reservapp/screens/home_page.dart';
import 'package:reservapp/assets/widgets/back_button.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:reservapp/screens/restaurant_rating.dart';

class Reservation extends StatelessWidget {
  Reservation({super.key});

  DateTime date = DateTime(2023, 04, 27);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            children: [
              Image.network(
                'https://images.pexels.com/photos/67468/pexels-photo-67468.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                width: 400,
                height: 360,
                fit: BoxFit.cover,
              ),
              Container(
                  alignment: Alignment.topLeft, child: backButton(context))
            ],
          ),
          Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 40.0, bottom: 20.0),
                  child: Material(
                    elevation: 10,
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      height: 80,
                      width: 180,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Icon(
                              color: Theme.of(context).colorScheme.primary,
                              Icons.calendar_month_outlined,
                              size: 40,
                            ),
                          ),
                          GestureDetector(
                              child: Padding(
                                padding: EdgeInsets.only(left: 20),
                                child: Text(
                                  '28/04/2023',
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary),
                                ),
                              ),
                              onTap: () async {
                                showDatePicker(
                                  context: context,
                                  initialDate: date,
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime(2100),
                                );
                              })
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 40.0, bottom: 20.0),
                  child: Material(
                    elevation: 10,
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      height: 80,
                      width: 180,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Icon(
                              color: Theme.of(context).colorScheme.primary,
                              Icons.schedule,
                              size: 40,
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.only(left: 20.0),
                              child: Text(
                                '20:00',
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    color:
                                        Theme.of(context).colorScheme.primary),
                              ))
                          // GestureDetector(
                          //     child: Padding(
                          //       padding: EdgeInsets.only(left: 20),
                          //       child: Text(
                          //         '28/04/2023',
                          //         style: TextStyle(
                          //             fontWeight: FontWeight.normal,
                          //             color: Theme
                          //                 .of(context)
                          //                 .colorScheme
                          //                 .primary),
                          //       ),
                          //     ),
                          //     onTap: () async {
                          //       showDatePicker(
                          //         context: context,
                          //         initialDate: date,
                          //         firstDate: DateTime(1900),
                          //         lastDate: DateTime(2100),
                          //
                          //       );
                          //     }
                          // )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 40.0, bottom: 20.0),
                  child: Material(
                    elevation: 10,
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      height: 80,
                      width: 180,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Icon(
                              color: Theme.of(context).colorScheme.primary,
                              Icons.person,
                              size: 40,
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.only(left: 20.0),
                              child: Align(
                                alignment: Alignment.center,
                                child:
                                  Text(
                                    '2',
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        color:
                                        Theme.of(context).colorScheme.primary),
                                  )
                              ))

                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 45.0, left: 20.0, right: 20.0),
                  child: const ConfirmButton(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ConfirmButton extends StatefulWidget {
  const ConfirmButton({super.key});

  @override
  State<ConfirmButton> createState() => _ConfirmButton();
}

class _ConfirmButton extends State<ConfirmButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(15.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            minimumSize: const Size(200, 50),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        onPressed: () => {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => RestaurantRating()),
          )
        },
        child: const Text(
          'Confirmar Reserva',
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
        onTap: () => {
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
