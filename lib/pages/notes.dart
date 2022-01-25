import 'package:flutter/material.dart';
import 'dart:developer';

class Notes extends StatefulWidget {
  const Notes({Key? key}) : super(key: key);

  @override
  _NotesState createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  String noteText = '';
  List notes = [];
  var textController = new TextEditingController();

  void _openEditor() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return Scaffold(
          appBar: AppBar(
            title: Text('Notes'),
            backgroundColor: Colors.purple[900],
          ),
          body: Row(
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/', (route) => false);
                  },
                  child: Text('Back')),
              Padding(padding: EdgeInsets.only(left: 15)),
              Text('Our simple menu')
            ],
          ));
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
        backgroundColor: Colors.purple[900],
        actions: [IconButton(onPressed: _openEditor, icon: Icon(Icons.note))],
      ),
      body: ListView.builder(
          itemCount: notes.length,
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
              key: Key(notes[index]),
              child: Card(
                child: ListTile(
                  title: Text(notes[index]),
                  leading: IconButton(
                    icon: Icon(
                      Icons.edit,
                      color: Colors.purple[900],
                    ),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              insetPadding: EdgeInsets.zero,
                              alignment: Alignment.topCenter,
                              title: Text(
                                'Edit note',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.purple[900],
                                  fontSize: 23,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              content: Builder(builder: (context) {
                                var height = MediaQuery.of(context).size.height;
                                var width = MediaQuery.of(context).size.width;
                                return Container(
                                  alignment: Alignment.topLeft,
                                  height: height - 60,
                                  width: width - 80,
                                  child: new TextField(
                                    controller: textController,
                                    keyboardType: TextInputType.multiline,
                                    minLines: null,
                                    maxLines: null,
                                    cursorColor: Colors.purple[900],
                                    decoration: new InputDecoration(
                                      alignLabelWithHint: true,
                                      border: new OutlineInputBorder(
                                        borderSide: new BorderSide(
                                            color: Colors.black12),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5.0)),
                                          borderSide: BorderSide(
                                              color: Colors.black12)),
                                      hintText: 'Enter text here',
                                    ),
                                    onChanged: (String value) {
                                      textController.text = value;
                                      value = noteText;
                                    },
                                  ),
                                );
                              }),
                              actions: [
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.purple[900]),
                                    onPressed: () {
                                      setState(() {
                                        if (noteText != '') {
                                          notes.add(noteText);
                                        }
                                      });
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('Save'))
                              ],
                            );
                          });
                    },
                  ),
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
          }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple[900],
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  insetPadding: EdgeInsets.zero,
                  alignment: Alignment.topCenter,
                  title: Text('Add note',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.purple[900],
                        fontSize: 23,
                        fontWeight: FontWeight.w500,
                      )),
                  content: Builder(builder: (context) {
                    var height = MediaQuery.of(context).size.height;
                    var width = MediaQuery.of(context).size.width;
                    return Container(
                      alignment: Alignment.topLeft,
                      height: height - 60,
                      width: width - 80,
                      child: TextField(
                        keyboardType: TextInputType.multiline,
                        minLines: null,
                        maxLines: null,
                        cursorColor: Colors.purple[900],
                        decoration: new InputDecoration(
                          alignLabelWithHint: true,
                          border: new OutlineInputBorder(
                            borderSide: new BorderSide(color: Colors.black12),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                              borderSide: BorderSide(color: Colors.black12)),
                          hintText: 'Enter text here',
                        ),
                        onChanged: (String value) {
                          noteText = value;
                        },
                      ),
                    );
                  }),
                  actions: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.purple[900]),
                        onPressed: () {
                          setState(() {
                            if (noteText != '') {
                              notes.add(noteText);
                            }
                            log('data: $noteText');
                          });
                          Navigator.of(context).pop();
                        },
                        child: Text('Save'))
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
