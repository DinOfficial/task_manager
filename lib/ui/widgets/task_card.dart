
import 'package:flutter/material.dart';
import 'package:untitled/data/models/task_list_model.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
    required this.taskListModel
  });
  final TaskListModel taskListModel;

  @override
  Widget build(BuildContext context) {

    Color _getCardColor(){
      if(taskListModel.status == 'New'){
        return Colors.blue;
      } else if(taskListModel.status == 'Progress'){
        return Colors.amber;
      }else if(taskListModel.status == 'Cancelled'){
        return Colors.red;
      }else{
        return Colors.green;
      }
    }
    return Card(
      color: Colors.white,
      elevation: 0,
      child: ListTile(
        title: Text(taskListModel.title, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 4,),
            Text(taskListModel.description),
            const SizedBox(height: 4,),
            Text('Date:${taskListModel.createdDate}'),
            const SizedBox(height: 4,),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  decoration: BoxDecoration(
                    color: _getCardColor(),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(taskListModel.status, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),),
                ),
                Spacer(),
                IconButton(onPressed: (){}, icon: Icon(Icons.edit, color: Colors.blue, size: 20)),
                IconButton(onPressed: (){}, icon: Icon(Icons.delete, color: Colors.red,size: 20))
              ],
            )
          ],
        ),
      ),
    );
  }
}