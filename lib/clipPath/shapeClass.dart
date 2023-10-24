import 'package:flutter/material.dart';

class RPSCustomPainter extends CustomPainter{
  
  @override
  void paint(Canvas canvas, Size size) {
    

  // Layer 1
  
  Paint paint_fill_0 = Paint()
      ..color = const Color.fromARGB(255, 255, 255, 255)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width*0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;
     
         
    Path path_0 = Path();

    canvas.drawPath(path_0, paint_fill_0);
  

  // Layer 1
  
  Paint paint_stroke_0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width*0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;
     
         
    
    canvas.drawPath(path_0, paint_stroke_0);
  

  // Square
  
  Paint paint_fill_1 = Paint()
      ..color = const Color.fromARGB(255,20, 33, 61)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width*0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;
     
         
    Path path_1 = Path();
    path_1.moveTo(size.width*-0.0472000,size.height*0.3460000);
    path_1.quadraticBezierTo(size.width*0.4994600,size.height*0.8538148,size.width*1.0472200,size.height*0.3460000);
    path_1.quadraticBezierTo(size.width*1.0472200,size.height*0.5095000,size.width*1.0472200,size.height);
    path_1.lineTo(size.width*-0.0472000,size.height);
    path_1.lineTo(size.width*-0.0472000,size.height*0.3460000);
    path_1.close();

    canvas.drawPath(path_1, paint_fill_1);
  

  // Square
  
  Paint paint_stroke_1 = Paint()
      ..color = const Color.fromARGB(0, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;
     
         
    
    canvas.drawPath(path_1, paint_stroke_1);
  
    
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
  
}
