import 'package:flutter/material.dart';

class Notes extends StatefulWidget {
 const Notes({Key? key}) : super (key: key);

 @override
 _NotesState createState() => _NotesState();
}

class _NotesState extends State<Notes> {

  String noteText = '';
  List notes = [];

void _openEditor() {
  Navigator.of(context).push(
    MaterialPageRoute(builder: (BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Notes'),
          backgroundColor: Colors.purple[900],
          ),
        body: Row(children: [
          ElevatedButton(onPressed: () {
            Navigator.pop(context);
            Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
          }, 
          child: Text('Back')),
          Padding(padding: EdgeInsets.only(left: 15)),
          Text('Our simple menu')
        ],)
      );
    })
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
        backgroundColor: Colors.purple[900],
        actions: [
          IconButton(onPressed: _openEditor, icon: Icon(Icons.note))
        ],
      ),
      body: ListView.builder(
        itemCount: notes.length,
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
            key: Key(notes[index]),
            child: Card(
              child: ListTile(title: Text(notes[index]),
              trailing: IconButton(
                icon: Icon(
                 Icons.delete_sweep,
                 color: Colors.purple[900],
                ),
              onPressed: () {
                setState(() {
                  notes.removeAt(index);
                });
              },
            ),
          ),
        ),
        onDismissed: (direction) {
          setState(() {
            notes.removeAt(index);
          });
        },
      );
    }
  ),
  floatingActionButton: FloatingActionButton(
    backgroundColor: Colors.purple[900],
    onPressed: () {
      showDialog(context: context, builder: (BuildContext context) {
        return AlertDialog(
          insetPadding: EdgeInsets.zero,
          contentPadding: EdgeInsets.all(120),
          title: Text('Add note', style: TextStyle(color: Colors.purple[900], )),
          content: TextField(
            decoration: InputDecoration.collapsed(hintText: "Enter your text here"),
            onChanged: (String value) {
              noteText = value;
            },
          ),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.purple[900]
              ), 
              onPressed: () {
              setState(() {
                notes.add(noteText);
              });
              Navigator.of(context).pop();
            }, 
            child: 
            Text('Save')
            )
          ],
        );
      });
    },
    child: Icon(
      Icons.add_box,
      color: Colors.white,
    ),
  ),
  );
  }
}