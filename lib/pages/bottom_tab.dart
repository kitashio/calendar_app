import 'package:calender_app/pages/schedule_add_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'month_page.dart';
import 'schedule_page.dart';
import 'package:flutter/material.dart';

class BottomTabPage extends StatefulWidget {
  final User user;
  BottomTabPage(this.user);

  @override
  _BottomTabPageState createState() => _BottomTabPageState();
}

class _BottomTabPageState extends State<BottomTabPage>{

  int _currentIndex = 0;
  void _onItemTapped (int index) {
    setState(() {
      _currentIndex = index;
    } );
  }

  @override
  Widget build(BuildContext context) {

    final _pageWidgets = [
      SchedulePage(widget.user),
      MonthPage(widget.user),
    ];

    return Scaffold(
      body: _pageWidgets.elementAt(_currentIndex),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        height: 50,
        margin: const EdgeInsets.only(top: 50,),
        child: FittedBox(
          alignment: Alignment.topCenter,
          child: FloatingActionButton(
            elevation: 2,
            hoverElevation: 0,
            highlightElevation: 0,
            child: Icon(Icons.add, color:  Colors.black,),
            backgroundColor: Colors.white,
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddSchedulePage(widget.user),
                  fullscreenDialog: true,),
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.lens_outlined), label: '予定',),
          BottomNavigationBarItem(
            icon: Icon(Icons.fiber_smart_record_outlined), label: 'カレンダー',),
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