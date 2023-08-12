import 'package:flutter/material.dart';

class ListFirst extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Welcome',style: TextStyle(color: Colors.red,fontSize: 25,fontWeight: FontWeight.bold),)),
      ),
      body: ListWidget(),
    );
  }
}





class ListWidget extends StatelessWidget {
  const ListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 100,
      itemBuilder: (context, index) => ListItemWidget(index: index),
    );
  }
}
final Map<int, int> _counterMap = {};

class ListItemWidget extends StatefulWidget {
  final int index;

  const ListItemWidget({Key? key, required this.index}) : super(key: key);

  @override
  State<ListItemWidget> createState() => _ListItemWidgetState();
}

class _ListItemWidgetState extends State<ListItemWidget> {
  late int count;

  @override
  void initState() {
    super.initState();
    count = _counterMap[widget.index] ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(right: 15),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Text(count.toString(),style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 45),),
            ),
            Expanded(
              child: MaterialButton(
                onPressed: () {
                  setState(() {
                    count++;
                    _counterMap[widget.index] = count;
                  });
                },
              ),
            )
          ],
        ),
    );
  }
}




