import 'package:flutter/material.dart';
class ListSecond extends StatefulWidget {

  @override
  State<ListSecond> createState() => _ListSecondState();
}

class _ListSecondState extends State<ListSecond> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Welcome',
            style: TextStyle(
              color: Colors.red,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: ListItemWidget(),
    );
  }
}

class ListItemWidget extends StatefulWidget {
  const ListItemWidget({Key? key}) : super(key: key);

  @override
  State<ListItemWidget> createState() => _ListItemWidgetState();
}

class _ListItemWidgetState extends State<ListItemWidget> {

  int buttonPressCount = 0;
  int rowCount = 1;

  void _handleButtonPress() {
    setState(() {
      buttonPressCount++;

      if (buttonPressCount == 3) {
        buttonPressCount = 0;
        rowCount++;

        if (rowCount > 100) {
          rowCount = 1;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> rows = [];

    for (int i = 0; i < rowCount; i++) {
      rows.add(
        Padding(
          padding: const EdgeInsets.only(right: 15),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Text(
                  i < rowCount ? rowCount.toString() : '',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 45,
                  ),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  onPressed: _handleButtonPress,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return ListView(
      children: rows,
    );
  }
}