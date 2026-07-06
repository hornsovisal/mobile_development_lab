import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

void main() {
  runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: Screen()));
}

//our UI Button
class MyButton extends StatelessWidget {
  final String title;
  final bool selected;
  final VoidCallback onPressed; //call to the screen

  const MyButton({
    super.key,
    required this.title,
    required this.selected,
    required this.onPressed,
  });

  Color get color {
    if (selected == true) {
      return Colors.blue;
    } else {
      return Colors.white;
    }
  }

  Color get textColor {
    if (selected == true) {
      return Colors.white;
    } else {
      return Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: textColor,
      ),
      onPressed: onPressed,
      child: Text(title),
    );
  }
}

enum AsyncState { notstarted, loading, error, success }

//Json to Object
class ButtonStatus {
  final String id;
  final String title;
  final bool selection;

  ButtonStatus({
    required this.id,
    required this.title,
    required this.selection,
  });

  static ButtonStatus fromJson(String id, Map<String, dynamic> json) {
    return ButtonStatus(
      id: id,
      title: json['title'],
      selection: json['selection'],
    );
  }
}

//Class to manipilate with data in fireabse
class ButtonRepository {
  //Function to Fetch Button , it will returrn as a List of ButtonStatus (but Future)
  Future<List<ButtonStatus>> fetchButtons() async {
    Uri url = Uri.parse(
      'https://dict-67168-default-rtdb.asia-southeast1.firebasedatabase.app/buttons.json',
    );

    Response response = await http.get(url);

    if (response.statusCode != 200) {
      throw Exception('Cannot fetch buttons');
    }

    //decode from respone body to json
    Map<String, dynamic> json = jsonDecode(response.body);

    List<ButtonStatus> buttons = [];

    for (String key in json.keys) {
      Map<String, dynamic> jsonButton = Map<String, dynamic>.from(json[key]);

      ButtonStatus button = ButtonStatus.fromJson(key, jsonButton);

      buttons.add(button);
    }

    return buttons;
  }

  Future<void> updateButton(String id, bool selection) async {
    Uri url = Uri.parse(
      'https://dict-67168-default-rtdb.asia-southeast1.firebasedatabase.app/buttons/$id.json',
    );

    Response response = await http.patch(
      url,
      body: jsonEncode({'selection': selection}),
    );

    if (response.statusCode != 200) {
      throw Exception('Cannot update button');
    }
  }
}

ButtonRepository buttonRepository = ButtonRepository();

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() {
    return _ScreenState();
  }
}

class _ScreenState extends State<Screen> {
  AsyncState state = AsyncState.notstarted;

  List<ButtonStatus> buttons = [];
  String error = '';

  @override
  void initState() {
    super.initState();
    fetchButtons();
  }

  //fetch data
  void fetchButtons() async {
    try {
      setState(() {
        state = AsyncState.loading;
      });

      buttons = await buttonRepository.fetchButtons();

      setState(() {
        state = AsyncState.success;
      });
    } catch (e) {
      setState(() {
        error = e.toString();
        state = AsyncState.error;
      });
    }
  }

  //Post on DATA
  void updateButton(ButtonStatus button) async {
    try {
      bool newSelection = !button.selection;

      await buttonRepository.updateButton(button.id, newSelection);

      fetchButtons();
    } catch (e) {
      setState(() {
        error = e.toString();
        state = AsyncState.error;
      });
    }
  }

  Widget get content {
    switch (state) {
      case AsyncState.notstarted:
        return const Text('Not started');

      case AsyncState.loading:
        return const CircularProgressIndicator();

      case AsyncState.error:
        return Text(error, style: const TextStyle(color: Colors.red));

      case AsyncState.success:
        List<Widget> buttonWidgets = [];

        for (ButtonStatus button in buttons) {
          buttonWidgets.add(
            Padding(
              padding: const EdgeInsets.all(8),
              child: MyButton(
                title: button.title,
                selected: button.selection,
                onPressed: () {
                  updateButton(button);
                },
              ),
            ),
          );
        }

        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: buttonWidgets,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Button Status App'),
        actions: [
          IconButton(onPressed: fetchButtons, icon: const Icon(Icons.refresh)),
        ],
      ),
      body: Center(child: content),
    );
  }
}
