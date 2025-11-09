import 'package:flutter/material.dart';
import 'package:untitled/ui/widgets/screen_background.dart';
import 'package:untitled/ui/widgets/tm_app_bar.dart';

class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({super.key});

  final String name = 'add-new-task';

  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TMAppBar(),
      body: ScreenBackground(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          children: [
            const SizedBox(height: 50),
            Text('Add New Task', style: Theme.of(context).textTheme.titleLarge),
            Form(
              child: Column(
                spacing: 16,
                children: [
                  const SizedBox(height: 8),
                  TextFormField(
                    decoration: const InputDecoration(hintText: 'Subject'),
                  ),
                  TextFormField(
                    maxLines: 5,
                    decoration: const InputDecoration(
                        hintText: 'Description',
                    ),
                  ),
                  const SizedBox(height: 8),
                  FilledButton(onPressed: (){}, child: Icon(Icons.arrow_circle_right_outlined, size: 30,))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
