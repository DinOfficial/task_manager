import 'package:flutter/material.dart';
import 'package:untitled/data/models/task_list_model.dart';
import 'package:untitled/data/services/network_caller.dart';
import 'package:untitled/data/utils/urls.dart';
import 'package:untitled/ui/widgets/show_snackbar_message.dart';

class TaskCard extends StatefulWidget {
  const TaskCard({super.key, required this.taskListModel, required this.refreshList});

  final TaskListModel taskListModel;
  final VoidCallback refreshList;

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  bool _taskStatusChangeInProgress = false;

  @override
  Widget build(BuildContext context) {
    Color statusTagColor() {
      if (widget.taskListModel.status == 'New') {
        return Colors.blue;
      } else if (widget.taskListModel.status == 'Progress') {
        return Colors.amber;
      } else if (widget.taskListModel.status == 'Cancelled') {
        return Colors.red;
      } else {
        return Colors.green;
      }
    }

    void changeTaskStatus() {
      showDialog(
        context: context,
        builder: (ctx) {
          bool isCurrentStatus(String status) {
            return widget.taskListModel.status == status;
          }

          Future<void> changeTaskStatusFetch(String status) async {
            _taskStatusChangeInProgress = true;
            setState(() {});

            NetworkResponse response = await NetWorkCaller().getRequest(
              Urls.updateTaskStatus(widget.taskListModel.id, status),
            );

            if (response.isSuccess) {
             widget.refreshList();
            } else {
              _taskStatusChangeInProgress = false;
              setState(() {});
              showSnackbarMessage(context, response.errorMessage.toString());
            }
          }

          void _onTapTaskChangeHandle(String status){
            if (isCurrentStatus(status)) return;
            Navigator.pop(context);
            changeTaskStatusFetch(status);
          }

          return AlertDialog(
            title: Text('Change Status'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  title: Text('New'),
                  trailing: isCurrentStatus('New') ? Icon(Icons.done) : null,
                  onTap: () {
                    _onTapTaskChangeHandle('New');
                  },
                ),
                ListTile(
                  title: Text('Progress'),
                  trailing: isCurrentStatus('Progress') ? Icon(Icons.done) : null,
                  onTap: () {
                    _onTapTaskChangeHandle('Progress');
                  },
                ),
                ListTile(
                  title: Text('Cancelled'),
                  trailing: isCurrentStatus('Cancelled') ? Icon(Icons.done) : null,
                  onTap: () {
                    _onTapTaskChangeHandle('Cancelled');
                  },
                ),
                ListTile(
                  title: Text('Completed'),
                  trailing: isCurrentStatus('Completed') ? Icon(Icons.done) : null,
                  onTap: () {
                    _onTapTaskChangeHandle('Completed');
                  },
                ),
              ],
            ),
          );
        },
      );
    }

    return Card(
      color: Colors.white,
      elevation: 0,
      child: ListTile(
        title: Text(
          widget.taskListModel.title,
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(widget.taskListModel.description),
            const SizedBox(height: 4),
            Text('Date:${widget.taskListModel.createdDate}'),
            const SizedBox(height: 4),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  decoration: BoxDecoration(
                    color: statusTagColor(),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    widget.taskListModel.status,
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                  ),
                ),
                Spacer(),
                Visibility(
                  visible: !_taskStatusChangeInProgress,
                  replacement: CircularProgressIndicator(),
                  child: IconButton(
                    onPressed: () {
                      changeTaskStatus();
                    },
                    icon: Icon(Icons.edit, color: Colors.blue, size: 20),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.delete, color: Colors.red, size: 20),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
