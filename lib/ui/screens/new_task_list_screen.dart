import 'package:flutter/material.dart';

import 'add_new_task_screen.dart';

class NewTaskListScreen extends StatefulWidget {
  const NewTaskListScreen({super.key});

  @override
  State<NewTaskListScreen> createState() => _NewTaskListScreenState();
}

class _NewTaskListScreenState extends State<NewTaskListScreen> {

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: 90,
            child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index){
                  return Container(
                    margin: EdgeInsets.all(4),
                    decoration:BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    height: 100,
                    width: 130,
                    child: ListTile(
                      title: Text('12', style: textTheme.titleLarge?.copyWith(color: Colors.black87),),
                      subtitle: Text('Canceled',style: textTheme.labelLarge?.copyWith(color: Colors.grey),),
                    ),
                  );
                }),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
              itemCount: 10,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text('This is task title '),
                    subtitle: Column(
                      children: [
                        Text('this is a task description where appear everything details'),
                        Text('Date: 12 june 2025'),
                        Row(
                          children: [
                            Container(
                              child: Text('New'),
                            ), 
                            Spacer(),
                            IconButton(onPressed: (){}, icon: Icon(Icons.edit))
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.small(
        backgroundColor: Colors.green,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        elevation: 0,
        onPressed: _onTapAddIcon,
        child: Icon(Icons.add, color: Colors.white, size: 24),
      ),
    );
  }
  void _onTapAddIcon(){
    Navigator.pushNamed(context, AddNewTaskScreen().name);
  }
}
