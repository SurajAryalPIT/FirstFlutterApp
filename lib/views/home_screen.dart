import 'package:flutter/material.dart';
import 'package:supporttools/controlers/post_controller.dart';
import 'package:supporttools/models/get_project_response_model.dart';
import 'package:supporttools/models/login_response_models.dart';
import 'package:supporttools/views/login_screen.dart';

import '../data.dart';
import 'add_post_screen.dart';

class HomeScreen extends StatefulWidget {
  LoginResponseModel rm;
  HomeScreen(this.rm);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Current User: ${widget.rm.data.userName}"),
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.settings))],
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              ListTile(
                leading: Icon(Icons.account_balance_rounded),
                title: Text("My View"),
                onTap: () {
                  print("Hello");
                },
              ),
              ListTile(
                leading: Icon(Icons.portable_wifi_off),
                title: Text("View Issue"),
                onTap: () {
                  print("Hello");
                },
              ),
              ListTile(
                leading: Icon(Icons.create),
                title: Text("Create Issue"),
                onTap: () {
                  print("Hello");
                },
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text("Log Out"),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => AddPostScreen()),
              );
            }),
        body: ListView.builder(
            itemCount: todo.length,
            itemBuilder: (ctx, index) {
              return ListTile(
                leading: Icon(Icons.info),
                title: Text(todo[index]),
                trailing: Icon(Icons.delete),
              );
            }));
  }
}


// GridView.builder(
//             itemCount: 25,
//             gridDelegate:
//                 SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
//             itemBuilder: (ctx, index) {
//               return Center(
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Container(
//                     child: Column(
//                       children: [
//                         Image.network(
//                           "https://cdn.pixabay.com/photo/2018/09/17/23/21/imagination-3685048_1280.png",
//                           height: 50,
//                           width: 50,
//                         ),
//                         Text("Hello")
//                       ],
//                     ),
//                   ),
//                 ),
//               );
//             }));