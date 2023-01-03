import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _myController = TextEditingController();
  int _wordsCount = 0;
  List<String> _list = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SelectableText('文字数:${_myController.text.length}'),
              SelectableText('単語数（英語）:$_wordsCount'),
              const SizedBox(height: 4),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'テキストを入力',
                  hintStyle: const TextStyle(fontSize: 12, color: Colors.teal),
                  fillColor: Colors.teal[100],
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                      color: Colors.teal,
                      width: 2.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                      color: Colors.teal[100]!,
                      width: 1.0,
                    ),
                  ),
                ),
                keyboardType: TextInputType.multiline,
                maxLines: 10,
                controller: _myController,
                onChanged: (text) {
                  setState(() {
                    _list = _myController.text.trim().split(RegExp(r'[ \n]+'));
                    _wordsCount = _list.length;
                  });
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _myController.text = "";
            _wordsCount = 0;
            _list = [];
          });
        },
        child: const Text('clear'),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
