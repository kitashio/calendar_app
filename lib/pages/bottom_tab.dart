import 'month_page.dart';
import 'schedule_page.dart';
import 'package:flutter/material.dart';
import 'day_page.dart';
import 'week_page.dart';

class BottomTabPage extends StatefulWidget {

  @override
  _BottomTabPageState createState() => _BottomTabPageState();
}

class _BottomTabPageState extends State<BottomTabPage>{

  int _currentIndex = 0;
  void _onItemTapped (int index) => setState(() => _currentIndex = index );

  @override
  Widget build(BuildContext context) {

    final _pageWidgets = [
      SchedulePage(),
      WeekPage(),
      MonthPage(),
      MonthPage(),
      DayPage(),
    ];

    return Scaffold(
      body: _pageWidgets.elementAt(_currentIndex),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        elevation: 1,
        onPressed: () {},
        child: Icon(Icons.add,color: Colors.black,),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.lens_outlined), label: '予定',),
          BottomNavigationBarItem(
            icon: Icon(Icons.fiber_smart_record_outlined), label: '週',),
          BottomNavigationBarItem(
            icon: Icon(Icons.fiber_smart_record_outlined),label: '月',),
          BottomNavigationBarItem(
            icon: Icon(Icons.fiber_smart_record_outlined), label: '月',),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined), label: '日',),
        ],
        currentIndex: _currentIndex,
        fixedColor: Colors.black,
        elevation: 0,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

}