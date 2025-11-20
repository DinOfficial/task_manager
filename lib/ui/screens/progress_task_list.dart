import 'package:flutter/material.dart';
import 'package:untitled/data/models/task_list_model.dart';
import 'package:untitled/data/services/network_caller.dart';
import 'package:untitled/data/utils/urls.dart';
import '../widgets/task_card.dart';
import 'add_new_task_screen.dart';

class ProgressTaskListScreen extends StatefulWidget {
  const ProgressTaskListScreen({super.key});

  @override
  State<ProgressTaskListScreen> createState() => _ProgressTaskListScreenState();
}

class _ProgressTaskListScreenState extends State<ProgressTaskListScreen> {
  bool _taskInProgressInProgress = false;


  @override
  Widget build(BuildContext context) {
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
                return TaskCard(taskListModel: ,);
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

  Future<void> _getProgressTaskList() async{
    _taskInProgressInProgress = true;
    setState(() {});

    NetworkResponse response = await NetWorkCaller().getRequest(Urls.progressTaskList);

    if(response.isSuccess){
      List<TaskListModel> list = [];

    }else{

    }
  }
}

