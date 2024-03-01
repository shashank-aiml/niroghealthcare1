import 'package:flutter/material.dart';
import 'package:niroghealthcare/utils/config.dart';

class AppointmentPage extends StatefulWidget {
  const AppointmentPage({Key? key}) : super(key: key);

  @override
  State<AppointmentPage> createState() => _AppointmentPageState();
}
//three status of appointment
enum FilterStatus{upcoming, complete, cancel}

class _AppointmentPageState extends State<AppointmentPage> {
  FilterStatus status = FilterStatus.upcoming;//initial status
  Alignment _alignment = Alignment.centerLeft;
  List<dynamic> schedule = [
    {
      "doctor_name":"  Prashasti Gupta",
      "doctor_profile":"assets/doctor2.jpeg",
      "category":"  Dental",
      "status":'upcoming',
    },
    {
      "doctor_name":"  Gargi Tiwari",
      "doctor_profile":"assets/doctor3.jpeg",
      "category":"  Respiratory",
      "status":'complete',
    },
    {
      "doctor_name":"  Shreyal Srivastava",
      "doctor_profile":"assets/doctor5.jpeg",
      "category":"  Cardiology",
      "status":'cancel',
    },
    {
      "doctor_name":"  Aparna jha",
      "doctor_profile":"assets/doctor4.jpeg",
      "category":"  Physician",
      "status":'upcoming',
    }
  ];
  @override
  Widget build(BuildContext context) {
    List<dynamic> filteredSchedules = schedule.where((var schedule) {
      FilterStatus appointmentStatus;
          switch(schedule['status']){
            case 'upcoming':
              appointmentStatus = FilterStatus.upcoming;
              break;
            case 'complete':
              appointmentStatus = FilterStatus.complete;
              break;
            case 'cancel':
              appointmentStatus = FilterStatus.cancel;
              break;
            default:
              appointmentStatus = FilterStatus.upcoming;
      }
      return appointmentStatus == status;
    }).toList();
    return SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children:  <Widget>[
              const Text(
                  'Appointment Schedule',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Config.spaceSmall,
              Stack(
                children: [
                  Container(
                  width: double.infinity,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //filter tabs
                        for(FilterStatus filterStatus in FilterStatus.values)
                          Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if(filterStatus == FilterStatus.upcoming) {
                                      status = FilterStatus.upcoming;
                                      _alignment = Alignment.centerLeft;
                                    }else if(filterStatus == FilterStatus.complete){
                                      status = FilterStatus.complete;
                                      _alignment = Alignment.center;
                                    }else if(filterStatus == FilterStatus.cancel){
                                      status = FilterStatus.cancel;
                                      _alignment = Alignment.centerRight;
                                    }
                                  });
                                },
                                child: Center(
                                  child: Text(filterStatus.name),
                                ),
                              ),
                          ),
                      ],
                    ),
                  ),
                  AnimatedAlign(alignment: _alignment,
                      duration: const Duration(milliseconds: 200),
                      child: Container(
                        width: 100,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Config.primarycolor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            status.name,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                  )
                ],
              ),
              Config.spaceSmall,
              Expanded(
                  child: ListView.builder(
                    itemCount: filteredSchedules.length,
                    itemBuilder: ((context, index) {
                      var _schedule = filteredSchedules[index];
                      bool isLastElement = filteredSchedules.length + 1 == index;
                      return Card(
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        margin: !isLastElement
                        ? const EdgeInsets.only(bottom: 20):
                            EdgeInsets.zero,
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    backgroundImage:
                                    AssetImage(_schedule['doctor_profile']),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        _schedule['doctor_name'],
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                      const SizedBox(height: 5,),
                                      Text(
                                        _schedule['category'],
                                        style: const TextStyle(
                                          color: Colors.grey,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              const ScheduleCard(),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                      child: OutlinedButton(
                                        style: OutlinedButton.styleFrom(
                                          backgroundColor: Config.primarycolor,
                                        ),
                                        onPressed: () {},
                                        child: const Text(
                                          'Cancel',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            fontSize: 17,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                  ),
                                  const SizedBox(width: 20,),
                                  Expanded(
                                    child: OutlinedButton(
                                      style: OutlinedButton.styleFrom(
                                        backgroundColor: Config.primarycolor,
                                      ),
                                      onPressed: () {},
                                      child: const Text(
                                        'Reschedule',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                            fontSize: 17,
                                            color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),

                                ],
                              )
                              //schedule card
                            ],
                          ),
                        ),
                      );
                    }),
                  ))
            ],
          ),
        ),
    );
  }
}


class ScheduleCard extends StatelessWidget {
  const ScheduleCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10),
      ),
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon(Icons.calendar_today,
            color: Config.primarycolor,
            size: 17,
          ),
          SizedBox(width: 5,),
          Text(
            'Monday, 11/20/2023',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Config.primarycolor,),
          ),
          SizedBox(width: 20,),
          Icon(Icons.access_alarm,
            color: Config.primarycolor,
            size: 17,
          ),
          SizedBox(width: 5,),
          Flexible(child: Text('2:00 PM', style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Config.primarycolor,),
          ))
        ],
      ),
    );
  }
}