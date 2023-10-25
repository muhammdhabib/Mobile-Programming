import 'package:flutter/material.dart';
import 'package:medicalapp/controllers/todo_controller.dart'; // Sesuaikan dengan impor yang sesuai
import 'package:medicalapp/models/todo_model.dart'; // Sesuaikan dengan impor yang sesuai

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TodoController _todoController = TodoController();
  late Future<Todo> _futureTodo;

  @override
  void initState() {
    super.initState();
    _futureTodo = _todoController.fetchTodo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: AppBar(
          backgroundColor: Color(0xFF7165D6),
          leadingWidth: 30,
          title: Row(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage("images/doctor1.jpg"),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  "Dr. Mamat",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Icon(
                Icons.call,
                color: Colors.white,
                size: 26,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Icon(
                Icons.video_call,
                color: Colors.white,
                size: 30,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Icon(
                Icons.more_vert,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      body: FutureBuilder<Todo>(
        future: _futureTodo,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            return Column(
              children: [
                Text('UserID: ${snapshot.data!.userId}'),
                Text('ID: ${snapshot.data!.id}'),
                Text('Title: ${snapshot.data!.title}'),
                Text('Completed: ${snapshot.data!.completed}'),
              ],
            );
          } else {
            return Center(child: Text('No data available'));
          }
        },
      ),
      bottomSheet: Container(
        height: 65,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 10,
            offset: Offset(0, 3),
          ),
        ]),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF7165D6),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.add, size: 25, color: Colors.white),
                    onPressed: () {
                      // Handle the action when the "add" button is pressed
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 0),
              child: Icon(
                Icons.emoji_emotions_outlined,
                size: 35,
                color: Colors.amber,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Container(
                alignment: Alignment.centerRight,
                width: 230,
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Tulis Sesuatu",
                  ),
                ),
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 0),
              child: Icon(
                Icons.send,
                size: 30,
                color: Color(0xFF7165D6),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
