import 'package:flutter/material.dart';
import 'package:reservapp/screens/home_page.dart';
import 'package:reservapp/assets/widgets/back_button.dart';
import 'package:reservapp/screens/restaurant_rating.dart';
import 'package:flutter_material_pickers/flutter_material_pickers.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class Reservation extends StatefulWidget {
  const Reservation({super.key});

  @override
  State<StatefulWidget> createState() {
    return _Reservation();
  }
}

class _Reservation extends State<Reservation> {
  DateTime? date = DateTime(2023, 04, 27);
  TimeOfDay? time = const TimeOfDay(hour: 19, minute: 00);
  DateFormat dateFormatter = DateFormat('dd/MM/yyyy');
  var qt_people = 1;

  @override
  void initState() {
    super.initState();
    initializeDateFormatting('pt_BR', null);
  }

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
                GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20.0, bottom: 10.0),
                      child: Material(
                        elevation: 10,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          height: 70,
                          width: 160,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Icon(
                                  color: Theme.of(context).colorScheme.primary,
                                  Icons.calendar_month_outlined,
                                  size: 40,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 6),
                                child: Text(
                                  dateFormatter.format(date!),
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 18.0,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    onTap: () async {
                      DateTime? newDate = await showDatePicker(
                        context: context,
                        initialDate: date!,
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                      );
                      if (newDate != null) {
                        setState(() {
                          date = newDate;
                        });
                      }
                    }),
                GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: Material(
                        elevation: 10,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          height: 70,
                          width: 160,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Icon(
                                  color: Theme.of(context).colorScheme.primary,
                                  Icons.schedule,
                                  size: 40,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 20.0),
                                child: Text(
                                  '${time!.hour.toString().padLeft(2, '0')}:${time!.minute.toString().padLeft(2, '0')}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 18.0,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    onTap: () async {
                      final newTime = await showTimePicker(
                        context: context,
                        initialTime: time!,
                        builder: (context, child) {
                          return MediaQuery(
                            data: MediaQuery.of(context)
                                .copyWith(alwaysUse24HourFormat: true),
                            child: child ?? Container(),
                          );
                        },
                      );
                      if (newTime != null) {
                        setState(() {
                          time = newTime;
                        });
                      }
                    }),
                GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: Material(
                        elevation: 10,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          height: 70,
                          width: 160,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Icon(
                                  color: Theme.of(context).colorScheme.primary,
                                  Icons.person,
                                  size: 40,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 25.0),
                                child: Text(
                                  '${qt_people}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 24.0,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    onTap: () async {
                      showMaterialNumberPicker(
                        headerColor: Theme.of(context).colorScheme.primary,
                        title: 'Número de pessoas',
                        context: context,
                        minNumber: 1,
                        maxNumber: 20,
                        selectedNumber: qt_people,
                        onChanged: (value) => setState(() => qt_people = value),
                      );
                    }),
                Padding(
                  padding: EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
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
