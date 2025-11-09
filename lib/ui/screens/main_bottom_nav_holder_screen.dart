import 'package:flutter/material.dart';
import 'package:untitled/ui/screens/add_new_task_screen.dart';
import '../widgets/tm_app_bar.dart';

class MainBottomNavHolderScreen extends StatefulWidget {
  const MainBottomNavHolderScreen({super.key});

  final String name = 'main-bottom-nav-holder';

  @override
  State<MainBottomNavHolderScreen> createState() =>
      _MainBottomNavHolderScreenState();
}

class _MainBottomNavHolderScreenState extends State<MainBottomNavHolderScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TMAppBar(),
      floatingActionButton: FloatingActionButton.small(
        backgroundColor: Colors.green,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        elevation: 0,

        onPressed: _onTapAddIcon,
        child: Icon(Icons.add, color: Colors.white, size: 24),
      ),
      bottomNavigationBar: NavigationBar(
        indicatorColor: Colors.green,
        animationDuration: Duration(milliseconds: 700),
        indicatorShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        backgroundColor: Colors.white,
        selectedIndex: _selectedIndex,
        onDestinationSelected: (int index) {
          _selectedIndex = index;
          setState(() {});
        },
        destinations: [
          NavigationDestination(
            icon: Icon(
              Icons.new_label,
              color: _selectedIndex == 0 ? Colors.white : Colors.black,
            ),
            label: 'New',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.access_time_rounded,
              color: _selectedIndex == 1 ? Colors.white : Colors.black,
            ),
            label: 'Progress',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.cancel_outlined,
              color: _selectedIndex == 2 ? Colors.white : Colors.black,
            ),
            label: 'Cancelled',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.done,
              color: _selectedIndex == 3 ? Colors.white : Colors.black,
            ),
            label: 'Completed',
          ),
        ],
      ),
    );
  }

  void _onTapAddIcon(){
    Navigator.pushNamed(context, AddNewTaskScreen().name);
  }
}
