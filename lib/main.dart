import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({required this.title});

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  final inm = "12345678901234123456789012341234567890123412345678901234";
  String exampleText =
      "12345678901234123456789012341234567890123412345678901234";
  TextEditingController controller = TextEditingController();
  FocusNode node = FocusNode();
  ScrollController scrollController = ScrollController();

  Widget _buildBody() {
    return GestureDetector(
      onTap: () => node.requestFocus(),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
        margin: EdgeInsets.all(30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(
            color: Colors.grey,
          ),
        ),
        child: SingleChildScrollView(
          controller: scrollController,
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              IntrinsicWidth(
                child: TextField(
                  focusNode: node,
                  controller: controller,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.zero,
                  ),
                  autocorrect: false,
                  onChanged: (val) {
                    exampleText =
                        inm.substring(controller.text.length, inm.length);
                    setState(() {});
                  },
                ),
              ),
              if (controller.text.length > 0)
                Text(
                  exampleText,
                  style: TextStyle(color: Colors.black26),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
