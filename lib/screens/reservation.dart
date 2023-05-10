import 'package:flutter/material.dart';
import 'package:reservapp/models/reservation.dart';
import 'package:reservapp/screens/home_page.dart';
import 'package:reservapp/assets/widgets/back_button.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:reservapp/screens/restaurant_rating.dart';
import 'package:flutter_material_pickers/flutter_material_pickers.dart';

class Reservation extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return _Reservation();
  }
}

class _Reservation extends State<Reservation> {
  DateTime? date = DateTime(2023, 04, 27);
  TimeOfDay? time = const TimeOfDay(hour: 19, minute: 00);
  var qt_people = 1;

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
                  padding: EdgeInsets.only(top: 20.0, bottom: 10.0),
                  child: Material(
                    elevation: 10,
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      height: 70,
                      width: 160,
                      decoration: BoxDecoration(
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
                          GestureDetector(
                              child: Padding(
                                padding: EdgeInsets.only(left: 6),
                                child: Text(
                                  '${date!.day.toString()}/${date!.month.toString()}/${date!.year.toString()}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 18.0,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary),
                                ),
                              ),
                              onTap: () async {
                                DateTime? newDate = await showDatePicker(
                                  context: context,
                                  initialDate: date!,
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2100),
                                );
                                if (newDate != null){
                                  setState(() {
                                  date = newDate;
                                });
                              }
                                })
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: Material(
                    elevation: 10,
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      height: 70,
                      width: 160,
                      decoration: BoxDecoration(
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
                          GestureDetector(
                              child: Padding(
                                padding: EdgeInsets.only(left: 20.0),
                                child: Text(
                                  '${time!.hour.toString()}:${time!.minute.toString()}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 24.0,
                                      color: Theme
                                          .of(context)
                                          .colorScheme
                                          .primary),
                                ),
                              ),
                              onTap: () async {
                                TimeOfDay? newTime = await showTimePicker(
                                  context: context,
                                  initialTime: time!,
                                );
                                if (newTime != null){
                                  setState(() {
                                    time = newTime;
                                  });
                                }
                              }
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: Material(
                    elevation: 10,
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      height: 70,
                      width: 160,
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
                          GestureDetector(
                              child: Padding(
                                padding: EdgeInsets.only(left: 25.0),
                                child: Text(
                                  '${qt_people}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 24.0,
                                      color: Theme
                                          .of(context)
                                          .colorScheme
                                          .primary),
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
                                }
                          )
                        ],
                      ),
                    ),
                  ),
                ),
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
