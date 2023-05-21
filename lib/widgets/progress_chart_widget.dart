import 'package:flutter/material.dart';


class Score{
  late double value;
  late DateTime time;
  Score(this.value,this.time);
}

class ProgressChartWidget extends StatefulWidget {
  final List<Score> scores;
  ProgressChartWidget(this.scores);
  @override
  State<ProgressChartWidget> createState() => _ProgressChartWidgetState();
}

class _ProgressChartWidgetState extends State<ProgressChartWidget> {

  late double _min,_max;
  late List<double> _Y;
  late List<String> _X;


  @override
  void initState() {
    // TODO: implement initState
    var min = double.maxFinite;
    var max = -double.maxFinite;
    widget.scores.forEach((p) {
      min = min> p.value ? p.value:min;
      max = max < p.value ? p.value:min;
    });
    setState(() {
      _min = min;
      _max = max;
      _Y = widget.scores.map((p) => p.value).toList();
      _X = widget.scores.map((p) => '${p.time.weekday}').toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomPaint(
        child:Container(),
        painter: ChartPainter(_X,_Y,_min,_max),
      ),
    );
  }
}


class ChartPainter extends CustomPainter {
  ChartPainter(List<String> x, y, double min, double max);

  @override
  void paint(Canvas canvas, Size size) {
    final c =Offset(size.width/2, size.height/2);
    final r = 50.0;
    final paint = Paint()..color = Colors.black;
    canvas.drawCircle(c, r, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
  
}
