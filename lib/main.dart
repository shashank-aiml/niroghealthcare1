import 'package:flutter/material.dart';
import 'package:niroghealthcare/main_layout.dart';
import 'package:niroghealthcare/screens/auth_page.dart';
import 'package:niroghealthcare/screens/booking_page.dart';
import 'package:niroghealthcare/screens/doctor_details.dart';
import 'package:niroghealthcare/screens/home_page.dart';
import 'package:niroghealthcare/screens/success_booked.dart';
import 'package:niroghealthcare/utils/config.dart';

void main() {
  runApp(const MyApp());
}
// welcome
class MyApp extends StatelessWidget {
  const MyApp({super.key});
//this is for push navigator
  static final navigatorKey = GlobalKey<NavigatorState>();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //define ThemeData here
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      title: 'Healthcare',
      theme: ThemeData(
        //predefine decoration
        inputDecorationTheme: const InputDecorationTheme(
          focusColor: Config.primarycolor,
          border: Config.outlineBorder,
          focusedBorder: Config.focusBorder,
          errorBorder: Config.errorBorder,
          enabledBorder: Config.outlineBorder,
          floatingLabelStyle: TextStyle(color: Config.primarycolor),
          prefixIconColor: Colors.black38
        ),
        scaffoldBackgroundColor: Colors.white,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Config.primarycolor,
          selectedItemColor: Colors.white,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          unselectedItemColor: Colors.grey.shade700,
          elevation: 10,
          type: BottomNavigationBarType.fixed
        ),
      ),
      initialRoute: '/',
      routes: {
        // this is initial route of app which is auth page and login signup
        '/': (context) => const AuthPage(),
        'main': (context) => const MainLayout(),
        'doc_details': (context) => const DoctorDetails(),
        'booking_page': (context) => const BookingPage(),
        'success_booking': (context) => const AppointmentBooked(),
      },
    );
  }
}
// login component
// page view
