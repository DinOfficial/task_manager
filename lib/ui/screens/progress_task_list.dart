import 'package:flutter/material.dart';
import '../widgets/task_card.dart';
import 'add_new_task_screen.dart';

class ProgressTaskListScreen extends StatefulWidget {
  const ProgressTaskListScreen({super.key});

  @override
  State<ProgressTaskListScreen> createState() => _ProgressTaskListScreenState();
}

class _ProgressTaskListScreenState extends State<ProgressTaskListScreen> {

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: ListView(
        children: [
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
              itemCount: 10,
              itemBuilder: (context, index) {
                return TaskCard();
              },
            ),
          ),
        ],
      ),
    );
  }
  void _onTapAddIcon(){
    Navigator.pushNamed(context, AddNewTaskScreen().name);
  }
}

