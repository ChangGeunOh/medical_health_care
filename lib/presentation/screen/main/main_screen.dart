import 'package:flutter/material.dart';
import 'package:medical_health_care/common/const/color.dart';
import 'package:medical_health_care/presentation/screen/home/home_screen.dart';
import 'package:medical_health_care/presentation/screen/message/message_screen.dart';
import 'package:medical_health_care/presentation/screen/schedule/schedule_screen.dart';
import 'package:medical_health_care/presentation/screen/setting/setting_screen.dart';

class MainScreen extends StatefulWidget {
  static String get routePath => '/main';

  static String get routeName => 'main';

  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int index = 1;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this, initialIndex: 1)
      ..addListener(_tabListener);
  }

  void _tabListener() {
    setState(() {
      index = _tabController.index;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.removeListener(_tabListener);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          _tabController.animateTo(index);
        },
        currentIndex: index,
        selectedItemColor: primaryColor,
        unselectedItemColor: Colors.black26,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Message',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: 'Schedule',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          HomeScreen(),
          MessageScreen(),
          ScheduleScreen(),
          SettingScreen(),
        ],
      ),
    );
  }
}
