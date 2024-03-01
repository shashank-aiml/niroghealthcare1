import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:niroghealthcare/components/appointment_card.dart';
import 'package:niroghealthcare/components/doctor_card.dart';
import 'package:niroghealthcare/utils/config.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> medCat = [
    {
      "icon":FontAwesomeIcons.userDoctor,
      "category":"Physician",
    },
    {
      "icon":FontAwesomeIcons.heartPulse,
      "category":"Cardiology",
    },
    {
      "icon":FontAwesomeIcons.lungs,
      "category":"Respiratory",
    },
    {
      "icon":FontAwesomeIcons.personPregnant,
      "category":"Gynacologist",
    },
    {
      "icon":FontAwesomeIcons.teeth,
      "category":"Dental",
    },
    {
      "icon":FontAwesomeIcons.hand,
      "category":"Dermatologist",
    },
  ];
  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 15,
        ),
         child: SafeArea(
           child: SingleChildScrollView(
             child: Column(
               mainAxisAlignment: MainAxisAlignment.start,
               crossAxisAlignment: CrossAxisAlignment.start,
               children: <Widget>[
                 const Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: <Widget>[
                     Text(
                       'Saadgi',
                       style: TextStyle(
                         fontSize: 24,
                         fontWeight: FontWeight.bold,
                       ),
                     ),
                     SizedBox(
                       child: CircleAvatar(
                         radius: 30,
                         backgroundImage:
                         AssetImage('assets/profile1.jpg'),
                       ),
                     ),
                   ],
                 ),
                 Config.spaceSmall,
                 //category listing
                 const Text(
                   'Category',
                     style: TextStyle(
                       fontSize: 16,
                       fontWeight: FontWeight.bold,
                     ),
                 ),
                 Config.spaceSmall,
                 SizedBox(
                   height: Config.heightSize * 0.05,
                   child: ListView(
                     scrollDirection: Axis.horizontal,
                     children: List<Widget>.generate(medCat.length, (index){
                       return Card(
                         margin: const EdgeInsets.only(right: 20),
                         color: Config.primarycolor,
                         child: Padding(
                           padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceAround,
                             children: <Widget>[
                               FaIcon(
                                 medCat[index]['icon'],
                                 color: Colors.white,
                               ),
                               const SizedBox(
                                 width: 20,
                               ),
                               Text(
                                 medCat[index]['category'],
                                 style: const TextStyle(
                                   fontSize: 16,
                                   color: Colors.white,
                                 ),
                               ),
                             ],
                           ),
                       ),
                       );
                     }),
                   ),
                 ),
                 Config.spaceSmall,
                 const Text('Appointment Today',
                 style: TextStyle(
                   fontSize: 16,
                   fontWeight: FontWeight.bold,
                  ),
                 ),
                 Config.spaceSmall,
                 //appointment card
                 const AppointmentCard(),
                 Config.spaceSmall,
                 const Text('Top Doctors',
                   style: TextStyle(
                     fontSize: 16,
                     fontWeight: FontWeight.bold,
                   ),
                 ),
                 //list of top doctors
                 Config.spaceSmall,
                 Column(
                   children: List.generate(10, (index) {
                     return const DoctorCard(
                       route: 'doc_details',
                     );
                   }),
                 )
               ],
             ),
           ),
         ),
      ),
    );
  }
}
