import 'package:flutter/material.dart';

class MyCircularProgress extends StatefulWidget {
  final int dietsThisWeek;
  final int dietsToday;
  const MyCircularProgress({
    super.key,
    required this.dietsThisWeek,
    required this.dietsToday,
  });

  @override
  State<MyCircularProgress> createState() => _MyCircularProgressState();
}

class _MyCircularProgressState extends State<MyCircularProgress> {

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Guías de la semana',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 8),
        Stack(
          alignment: Alignment.center,
          children: [
            const SizedBox(
              width: 80,
              height: 80,
              child: CircularProgressIndicator(
                value: 540 / 900,
                strokeWidth: 8,
                strokeCap: StrokeCap.round,
                backgroundColor: Color(0xff6189c6),
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xff0F4CA9)),
              ),
            ),
            Text(
              widget.dietsThisWeek.toString(),
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        RichText(
          maxLines: 2,
          text: TextSpan(
            children: [
              TextSpan(
                text: widget.dietsToday.toString(),
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins'),
              ),
              const TextSpan(
                text: ' guías al día ',
                style: TextStyle(
                    color: Color(0xff8f939a),
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
