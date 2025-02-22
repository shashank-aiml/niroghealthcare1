import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:niroghealthcare/components/button.dart';
import 'package:niroghealthcare/components/custom_appbar.dart';
import 'package:table_calendar/table_calendar.dart';

import '../utils/config.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({Key? key}) : super(key: key);

  @override
  State<BookingPage> createState() => _BookingState();
}

class _BookingState extends State<BookingPage> {
  //declaration
  CalendarFormat _format = CalendarFormat.month;
  DateTime _focusDay = DateTime.now();
  DateTime _currentDay = DateTime.now();
  int? _currentIndex;
  bool _isWeekend = false;
  bool _dateSelected = false;
  bool _timeSelected = false;
  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Scaffold(
      appBar: const CustomAppBar(
        appTitle: 'Appointment',
        icon: FaIcon(Icons.arrow_back_ios),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Column(
              children: <Widget>[
                _tableCalendar(),
                const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 25),
                  child: Center(
                    child: Text('Select Consultation Time',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    ),
                  ),
                )
              ],
            ),
          ),
          _isWeekend? SliverToBoxAdapter
            (
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10, vertical: 30),
              alignment: Alignment.center,
              child: const Text('Weekend is not available, please select another date',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),),
            ),
          ) : SliverGrid(delegate: SliverChildBuilderDelegate((context, index){
            return InkWell(
              splashColor: Colors.transparent,
              onTap: () {
                setState(() {
                  //after selecting time update current index
                  _currentIndex = index;
                  _timeSelected = true;
                });
              },
              child: Container(
                margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: _currentIndex == index
                        ? Colors.white: Colors.black
                  ),
                  borderRadius: BorderRadius.circular(15),
                  color: _currentIndex == index
                    ? Config.primarycolor
                      :null,
                ),
                alignment: Alignment.center,
                child: Text(
                  '${index + 9}:00 ${index + 9 > 11 ? "PM" : "AM"}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: _currentIndex == index ? Colors.white : null,
                    ),
                  ),
                ),
              );
            },
            childCount: 12,
          ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio: 1.5
              ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 80),
              child: Button(
                width: double.infinity,
                title: 'Make Appointment',
                onPressed: () {
                  Navigator.of(context).pushNamed('success_booking');
                },
                disable: _timeSelected && _dateSelected ? false : true,
              ),
            ),
          ),
        ],
      ),
    );
  }
//table calendar
  Widget _tableCalendar() {
    return TableCalendar(
      focusedDay: _focusDay,
      firstDay: DateTime(1500, 1, 1),
      lastDay: DateTime(2099, 12, 31),
      calendarFormat: _format,
      currentDay: _currentDay,
      rowHeight: 48,
      calendarStyle: const CalendarStyle(
        todayDecoration: BoxDecoration(
          color: Config.primarycolor,
          shape: BoxShape.circle,
        ),
      ),
      availableCalendarFormats: const {
        CalendarFormat.month: 'Month',
      },
      onFormatChanged: (format) {
        setState(() {
          _format = format;
          //check if weekend is selected
        });
      },
      onDaySelected: ((selectedDay, focusedDay) {
        setState(() {
          _currentDay = selectedDay;
          _focusDay = focusedDay;
          _dateSelected = true;

          //weekend
          if(selectedDay.weekday == 6 || selectedDay.weekday == 7) {
            _isWeekend = true;
            _timeSelected = false;
            _currentIndex = null;
          } else{
            _isWeekend = false;
            }
          }
        );
      }),
    );
  }
}