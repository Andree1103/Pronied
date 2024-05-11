import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';

class ImagePainter extends CustomPainter {
  final List<Offset> points;
  final ui.Image image;

  ImagePainter(this.points, this.image);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawImage(image, Offset.zero, Paint());
    Paint paint = Paint()
      ..color = Colors.black
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5.0;

    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null) {
        canvas.drawLine(points[i], points[i + 1], paint);
      } else if (points[i] != null && points[i + 1] == null) {
        canvas.drawPoints(ui.PointMode.points, [points[i]], paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class DrawingPage extends StatefulWidget {
  final Uint8List imageBytes;

  const DrawingPage({Key? key, required this.imageBytes}) : super(key: key);

  @override
  _DrawingPageState createState() => _DrawingPageState();
}

class _DrawingPageState extends State<DrawingPage> {
  List<Offset> points = [];
  late ui.Image image;

  @override
  void initState() {
    super.initState();
    _loadImage();
  }

  void _loadImage() async {
    final codec = await ui.instantiateImageCodec(widget.imageBytes);
    final frame = await codec.getNextFrame();
    setState(() {
      image = frame.image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dibuja en la Imagen'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () async {
              // Implementa la lógica de guardado aquí
            },
          ),
        ],
      ),
      body: GestureDetector(
        onPanUpdate: (details) {
          setState(() {
            RenderBox renderBox = context.findRenderObject() as RenderBox;
            points.add(renderBox.globalToLocal(details.localPosition));
          });
        },
        onPanEnd: (details) {
          points.add(ui.Offset.zero);
        },
        child: CustomPaint(
          painter: ImagePainter(points, image),
          child: Container(),
        ),
      ),
    );
  }
}
