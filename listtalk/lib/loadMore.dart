
import 'package:flutter/material.dart';

class LoadMore extends StatefulWidget {
  @override
  State<LoadMore> createState() => _LoadMoreState();
}

class _LoadMoreState extends State<LoadMore> {
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
  int rowCount = 1;
  //int rowsToAdd = 1;
  int buttonPressCount = 0;


  void _handleButtonPress() {
    setState(() {
      buttonPressCount++;

      if (buttonPressCount == 3) {
        buttonPressCount = 0;
        rowCount++;
        // count = rowCount ;

        if (rowCount > 100) {
          rowCount = 1;
        }
      }
      else if (buttonPressCount == 4) {
        buttonPressCount = 0;
      }


    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> rows = [];

    for (int i = 1; i <= rowCount; i++) {
      rows.add(
        Padding(
          padding: const EdgeInsets.only(right: 15),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Text(
                  i.toString(),
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

    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification scrollInfo) {
        if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
          buttonPressCount = 0;
          print('test1');
          rowCount = 1;
        }
        print('test');
        return true;
      },
      child: ListView(
        children: rows,
      ),
    );
  }
}