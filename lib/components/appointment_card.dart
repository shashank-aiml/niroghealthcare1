import 'package:flutter/material.dart';
import 'package:niroghealthcare/utils/config.dart';

class AppointmentCard extends StatefulWidget {
  const AppointmentCard({Key? key}) : super(key: key);

  @override
  State<AppointmentCard> createState() => _AppointmentCardState();
}

class _AppointmentCardState extends State<AppointmentCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Config.primarycolor,
        borderRadius: BorderRadius.circular(20),
      ),
      child:Material(
        color: Colors.transparent,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              const Row(
                children: [
                  CircleAvatar(
                    backgroundImage:
                    AssetImage('assets/doctor1.jpeg'),
                    //doctor profile
                  ),
                  SizedBox(width: 20,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Dr Aparna Jha',style: TextStyle(color: Colors.white),),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        'Dental',
                        style: TextStyle(color: Colors.black),)
                    ],
                  ),
                ],
              ),
              Config.spaceSmall,
              const ScheduleCard(),
              Config.spaceSmall,
              //action button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                        child: const Text('Cancel',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {},
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                        ),
                        child: const Text('Completed',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {},
                      ),
                  ),
                ],
              )
  ],
        )
      ),
      ),
    );
  }
}


//schedule widget
class ScheduleCard extends StatelessWidget {
  const ScheduleCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(10),
      ),
      width: double.infinity,
        padding: const EdgeInsets.all(20),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.calendar_today,
          color: Colors.white,
              size: 15,
          ),
          SizedBox(width: 5,),
          Text(
            'Monday, 11/20/2023',
            style: TextStyle(color: Colors.white,),
          ),
          SizedBox(width: 20,),
          Icon(Icons.access_alarm,
            color: Colors.white,
            size: 17,
          ),
          SizedBox(width: 5,),
          Flexible(child: Text('2:00 PM', style: TextStyle(color: Colors.white),
          ))
        ],
      ),
    );
  }
}
