
import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 0,
      child: ListTile(
        title: Text('This is task title ', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18)),
        subtitle: Column(
          spacing: 8,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('this is a task description where appear everything details'),
            Text('Date: 12 june 2025'),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text('New', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),),
                ),
                Spacer(),
                IconButton(onPressed: (){}, icon: Icon(Icons.edit, color: Colors.grey, size: 20)),
                IconButton(onPressed: (){}, icon: Icon(Icons.delete, color: Colors.red,size: 20))
              ],
            )
          ],
        ),
      ),
    );
  }
}