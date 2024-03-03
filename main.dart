import 'package:flutter/material.dart';

void main() {
  runApp(TaskApp());
}

class Task {
  final String title;
  final String description;
  final DateTime dateTime;

  Task({
    required this.title,
    required this.description,
    required this.dateTime,
  });
}

class TaskApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Management',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome to',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              'Plant IT',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 60),
            Text(
              'Your personal task management and planning solution',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: 200,
              height: 60,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SecondPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                 
                  elevation: 0, // Make edges sharper
                  
                 
                ),
                child: Text(
                  'Let\'s get started',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  final List<Task> tasks = [
    Task(
      title: 'Task 1',
      description:
          'Your Personal task management and planning solution for planning your day, week & months',
      dateTime: DateTime(2023, 5, 25, 12, 55),
    ),
    Task(
      title: 'Task 2',
      description:
          'Your Personal task management and planning solution for planning your day, week & months',
      dateTime: DateTime(2023, 5, 25, 12, 55),
    ),
    Task(
      title: 'Task 3',
      description:
          'Your Personal task management and planning solution for planning your day, week & months',
      dateTime: DateTime(2023, 5, 25, 12, 55),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Task Board',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final task = tasks[index];
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Card(
              color: Colors.blue.shade50,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
              child: ListTile(
                contentPadding: EdgeInsets.all(16.0),
                title: Text(
                  task.title,
                ),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween, // Align items to the start and end
                  children: [
                    Expanded(
                      child: Text(
                        task.description,
                      ),
                    ),
                    Text(
                      '${task.dateTime.hour}:${task.dateTime.minute} ${task.dateTime.day}/${task.dateTime.month}/${task.dateTime.year}',
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add functionality to add more items to the list
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
