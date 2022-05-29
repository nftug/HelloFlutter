import 'package:flutter/material.dart';

import 'password_repository.dart';
import 'next_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var repository = PasswordRepository();

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'パスワードポスト', repository: repository),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title, required this.repository})
      : super(key: key);

  final String title;
  final PasswordRepository repository;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void onTapList(int id) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NextPage(repository: widget.repository, id: id),
      ),
    );
  }

  void onPressAddButton() {
    setState(() {
      widget.repository.add("Google", "test4", "hogefuga");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
          itemCount: widget.repository.length,
          itemBuilder: (BuildContext context, int i) {
            return Column(
              children: [
                ListTile(
                  onTap: () => onTapList(i),
                  leading: const Icon(Icons.vpn_key),
                  title: Text(widget.repository.getSiteName(i)),
                ),
                const Divider()
              ],
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: onPressAddButton,
        tooltip: 'サイトを追加',
        child: const Icon(Icons.add),
      ),
    );
  }
}
