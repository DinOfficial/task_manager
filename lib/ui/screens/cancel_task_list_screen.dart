import 'package:flutter/material.dart';
import 'package:untitled/data/models/task_list_model.dart';
import 'package:untitled/data/services/network_caller.dart';
import 'package:untitled/data/utils/urls.dart';
import 'package:untitled/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:untitled/ui/widgets/show_snackbar_message.dart';
import '../widgets/task_card.dart';
import 'add_new_task_screen.dart';

class CancelTaskListScreen extends StatefulWidget {
  const CancelTaskListScreen({super.key});

  @override
  State<CancelTaskListScreen> createState() => _CancelTaskListScreenState();
}

class _CancelTaskListScreenState extends State<CancelTaskListScreen> {

  bool _cancelledTaskInProgerss = false;
  List<TaskListModel> _cancelledTaskList = [];

  @override
  void initState() {
    super.initState();
    _getCancelledTaskList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: _getCancelledTaskList,
        child: ListView(
          children: [
            Visibility(
              visible: !_cancelledTaskInProgerss,
              replacement: SizedBox(height:300,child: CenteredCircularProgressIndicator()),
              child: Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                  itemCount: _cancelledTaskList.length,
                  itemBuilder: (context, index) {
                    return TaskCard( taskListModel: _cancelledTaskList[index],);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _getCancelledTaskList() async{
    _cancelledTaskInProgerss = true;
    setState(() {});

    NetworkResponse response = await NetWorkCaller().getRequest(Urls.cancelledTaskList);

    if(response.isSuccess){
      List<TaskListModel> list = [];
      for(Map<String, dynamic> jsonData in response.body['data']){
        list.add(TaskListModel.fromJson(jsonData));
      }
      _cancelledTaskList = list;
    }else{
      showSnackbarMessage(context, response.errorMessage.toString(), true);
    }

    _cancelledTaskInProgerss = false;
    setState(() {});
  }
}

