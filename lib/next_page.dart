import 'package:flutter/material.dart';
import 'password_repository.dart';

class NextPage extends StatefulWidget {
  final PasswordRepository repository;
  final int id;

  String _siteName = "";
  String _userId = "";
  String _password = "";

  NextPage({required this.repository, required this.id}) {
    _siteName = repository.getSiteName(id);
    _userId = repository.getUserId(id);
    _password = repository.getPassword(id);
  }

  @override
  State<NextPage> createState() => _State();
}

class _State extends State<NextPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget._siteName)),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(width: 50, child: const Text('ID')),
                  Container(width: 20, child: const Text(':')),
                  Text(widget._userId)
                ],
              ),
              const Padding(padding: EdgeInsets.all(20)),
              Row(
                children: [
                  Container(width: 50, child: const Text('PW')),
                  Container(width: 20, child: const Text(':')),
                  Text(widget._password)
                ],
              )
            ],
          ),
        ));
  }
}
