import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'costom pai',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Offset pos = Offset(0, 0);
  List<Offset> listpos = <Offset>[];
  static Color color = Colors.black;
  List<Color> listColor = <Color>[color];

  static double brusSize = 5;
  List<double> listSize = <double>[brusSize];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: GestureDetector(
              onPanUpdate: (DragUpdateDetails details) {
                setState(() {
                  RenderBox box = context.findRenderObject();
                  pos = box.globalToLocal(details.globalPosition);

                  listpos = List.from(listpos)..add(pos);
                  listColor = List.from(listColor)..add(color);
                  listSize = List.from(listSize)..add(brusSize);
                });
              },
              child: Container(
                child: CustomPaint(
                  painter: Draw(listpos, listColor, listSize),
                  child: Container(),
                ),
              ),
            ),
          ),
          Container(

            color: Colors.brown,
            child: Row(
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.brush,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    setState(() {
                      color = Colors.red;
                    });
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.brush,
                    color: Colors.yellow,
                  ),
                  onPressed: () {
                    setState(() {
                      color = Colors.yellow;
                    });
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.brush,
                    color: Colors.blue,
                  ),
                  onPressed: () {
                    setState(() {
                      color = Colors.blue;
                    });
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.brightness_1,
                    color: Colors.black,
                    size: 10,
                  ),
                  onPressed: () {
                    setState(() {
                      brusSize = 5;
                    });
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.brightness_1,
                    color: Colors.black,
                    size: 15,
                  ),
                  onPressed: () {
                    setState(() {
                      brusSize = 7;
                    });
                  },
                ),

                 IconButton(
                  icon: Icon(
                    Icons.brightness_1,
                    color: Colors.black,
                    size: 20,
                  ),
                  onPressed: () {
                    setState(() {
                      brusSize = 10;
                    });
                  },
                ),

                
                

                IconButton(
                  icon: Icon(
                    Icons.refresh,
                    color: Colors.black,
                    size: 30,
                  ),
                  onPressed: () {
                    setState(() {
                      pos = Offset(0, 0);
                      listpos = <Offset>[];
                      color = Colors.black;
                      listColor = <Color>[color];

                      brusSize = 5;
                      listSize = <double>[brusSize];
                    });
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Draw extends CustomPainter {
  Draw(this.listpost, this.listColor, this.listSize);
  final List<Offset> listpost;
  final List<Color> listColor;
  final List<double> listSize;
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = Colors.red;

    for (var i = 0; i < listpost.length; i++) {
      paint.color = listColor[i];
      canvas.drawCircle(listpost[i], listSize[i], paint);
    }
  }

  @override
  bool shouldRepaint(Draw old) {
    // TODO: implement shouldRepaint
    return old.listpost != listpost;
  }
}
