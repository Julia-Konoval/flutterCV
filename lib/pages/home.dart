import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notepad'),
        centerTitle: true,
        backgroundColor: Colors.purple[900],
      ),
      body: Container(
      alignment: Alignment.topRight,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.purple[900],
          shadowColor: Colors.deepPurple[100]
        ),
        onPressed: () {
            Navigator.pushNamed(context, '/notes');
          }, child: Text('Go to notes'))
        )
    );
  }
}
