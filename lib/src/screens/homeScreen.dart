import 'package:flutter/material.dart';
import '../models/user.dart';
import '../services/services.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<User> _users;
  bool _loading = true;
  @override
  void initState() {
    Services.getUsers().then((users) {
      setState(() {
        _users = users;
        _loading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(_loading? 'Loading': 'Users'),
      ),
      body: Container(
        height: height,
        width: width,
        child: ListView.builder(
          itemCount: _users == null? 0 : _users.length,
          itemBuilder: (context, index) {
            var user = _users[index];
            return ListTile(
              title: Text(user.name),
              subtitle: Text(user.email),
            );
        },),

      ),
    );
  }
}
