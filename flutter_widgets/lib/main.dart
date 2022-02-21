import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<MyApp> {
  String _value = "Hello World";
  int counter = 0;
  String _inputText = "";
  bool? _isChecked = false;
  int? _isRadioChecked = 0;
  bool _isSwitchChecked = false;
  double _sliderValue = 0.0;
  String _datePickerValue = "";

  // Bottom bar
  List<BottomNavigationBarItem> _navigationItems = <BottomNavigationBarItem>[];
  int _navigationIndex = 0;

  void _onPressed(String value) {
    setState(() {
      _value = value;
    });
  }

  void _operation(bool isAdd) {
    setState(() {
      if (isAdd) {
        counter++;
      } else {
        counter--;
      }
    });
  }

  void _onTextChange(String value) {
    setState(() {
      _inputText = "Change: $value";
    });
  }

  void _onSubmit(String value) {
    setState(() {
      _inputText = "Submit: $value";
    });
  }

  void _onChecked(bool? value) {
    setState(() {
      _isChecked = value;
    });
  }

  void _onRadioChecked(int? value) {
    setState(() {
      _isRadioChecked = value;
    });
  }

  void _onSwitchChecked(bool value) {
    setState(() {
      _isSwitchChecked = value;
    });
  }

  void _onSliderChange(double value) {
    setState(() {
      _sliderValue = value;
    });
  }

  Future _datePicker(BuildContext context) async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2016),
        lastDate: DateTime(2023));
    setState(() {
      String formattedDate =
          "${picked?.year.toString()}-${picked?.month.toString().padLeft(2, '0')}-${picked?.day.toString().padLeft(2, '0')}";
      _datePickerValue = formattedDate;
    });
  }

  @override
  void initState() {
    _navigationItems.add(
        BottomNavigationBarItem(icon: Icon(Icons.people), label: "People"));
    _navigationItems.add(
        BottomNavigationBarItem(icon: Icon(Icons.message), label: "Message"));
    _navigationItems.add(BottomNavigationBarItem(
        icon: Icon(Icons.add_comment), label: "Comment"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Hello"),
          backgroundColor: Colors.red,
          actions: <Widget>[
            IconButton(
                onPressed: () => _operation(true), icon: Icon(Icons.add)),
            IconButton(
                onPressed: () => _operation(false), icon: Icon(Icons.remove)),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _onPressed("Clicked on floating!"),
          backgroundColor: Colors.red,
          mini: false,
          child: Icon(Icons.note_add),
        ),
        drawer: Drawer(
          child: Column(
            children: [
              Spacer(flex: 1),
              Text("Drawer Menu"),
              ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Close")),
              Spacer(flex: 1),
            ],
          ),
        ),
        persistentFooterButtons: [
          IconButton(
              onPressed: () => _onPressed("Footer Timer Click"),
              icon: Icon(Icons.timer)),
          IconButton(
              onPressed: () => _onPressed("Footer Map Click"),
              icon: Icon(Icons.map)),
          IconButton(
              onPressed: () => _onPressed("Footer Profile Click"),
              icon: Icon(Icons.people)),
        ],
        bottomNavigationBar: BottomNavigationBar(
          items: _navigationItems,
          fixedColor: Colors.blue,
          currentIndex: _navigationIndex,
          onTap: (int item) {
            setState(() {
              _navigationIndex = item;
              _value = "Clicked on $_navigationIndex no index";
            });
          },
        ),
        body: SingleChildScrollView(
            child: Container(
          padding: EdgeInsets.all(32.0),
          child: Center(
            child: Column(
              children: [
                Text(_value),
                ElevatedButton(
                    onPressed: () => _onPressed("My Name is Touhid"),
                    child: Text("Click Me")),
                TextButton(
                    onPressed: () => _onPressed("My Name is Touhidul Islam"),
                    child: Text("Click Me")),
                IconButton(
                    onPressed: () => _operation(true), icon: Icon(Icons.add)),
                Text("Count: $counter"),
                IconButton(
                    onPressed: () => _operation(false),
                    icon: Icon(Icons.remove)),
                Text(_inputText),
                TextField(
                  decoration: InputDecoration(
                      labelText: "Hello",
                      hintText: "Hint",
                      icon: Icon(Icons.people)),
                  autocorrect: true,
                  autofocus: true,
                  keyboardType: TextInputType.text,
                  onChanged: _onTextChange,
                  onSubmitted: _onSubmit,
                ),
                CheckboxListTile(
                  value: _isChecked,
                  onChanged: _onChecked,
                  title: Text("Check This Option"),
                  subtitle: Text("This is a Subtitle"),
                  controlAffinity: ListTileControlAffinity.leading,
                  secondary: Icon(Icons.question_answer_sharp),
                  activeColor: Colors.red,
                ),
                RadioListTile(
                  value: 1,
                  groupValue: _isRadioChecked,
                  onChanged: _onRadioChecked,
                  activeColor: Colors.cyan,
                  controlAffinity: ListTileControlAffinity.leading,
                  title: Text("Check this radio"),
                  subtitle: Text("This is subtitle"),
                ),
                RadioListTile(
                    value: 2,
                    groupValue: _isRadioChecked,
                    onChanged: _onRadioChecked,
                    activeColor: Colors.cyan,
                    controlAffinity: ListTileControlAffinity.leading,
                    title: Text("Check this radio"),
                    subtitle: Text("This is subtitle")),
                SwitchListTile(
                  value: _isSwitchChecked,
                  onChanged: _onSwitchChecked,
                  title: Text("Please switch the button"),
                  subtitle: Text("This will do nothing :)"),
                ),
                Text("Slider Value: ${(_sliderValue * 100).round()}"),
                Slider(value: _sliderValue, onChanged: _onSliderChange),
                Text("Date: ${_datePickerValue}"),
                const SizedBox(
                  height: 20.0,
                ),
                ElevatedButton(
                    onPressed: () => _datePicker(context),
                    child: const Text("Pick a Date")),
                ElevatedButton(
                    onPressed: () => _showBottomSheet(context),
                    child: const Text("Show Bottom Sheet")),
                ElevatedButton(
                    onPressed: () => _showSnackBar(context),
                    child: const Text("Show Snack Bar")),
                ElevatedButton(
                    onPressed: () => _showAlertDialog(context),
                    child: const Text("Show Alert")),
              ],
            ),
          ),
        )));
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Some text here",
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                ),
                ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("Close Me"))
              ],
            ),
          );
        });
  } // _showBottomSheet

  void _showSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Hello, This is snack bar!")));
  } // _showSnackBar

  void _showAlertDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Alert!"),
            content: Text("Hi, This is a message!"),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Cancel")),
              TextButton(
                  onPressed: () =>
                      {Navigator.pop(context), _showSnackBar(context)},
                  child: Text("OK"))
            ],
          );
        });
  } // _showSnackBar



}
