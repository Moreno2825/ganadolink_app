import 'package:flutter/material.dart';

class ListViewHorizontal extends StatefulWidget {
  const ListViewHorizontal({super.key});

  @override
  State<ListViewHorizontal> createState() => _ListViewHorizontalState();
}

class _ListViewHorizontalState extends State<ListViewHorizontal> {
  final List<Map<String, String>> items = [
    {
      'folio': 'JU37S6DS45',
      'placas': 'WD3RF4',
      'modelo': 'Hereford',
    },
    {
      'folio': 'JU37S6DS46',
      'placas': 'WD3RF4',
      'modelo': 'Hereford',
    },
    {
      'folio': 'JU37S6DS46',
      'placas': 'WD3RF4',
      'modelo': 'Hereford',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: items.map((item) {
          return Container(
            width: 150,
            margin: const EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item['folio'] ?? '',
                      style: const TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                          fontSize: 21,
                          fontFamily: 'Poppins'),
                    ),
                     SizedBox(
                      height: 5,
                    ),
                    Text(
                      item['placas'] ?? '',
                      style: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 19,
                          fontFamily: 'Poppins'
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      item['modelo'] ?? '',
                      style: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                          fontSize: 14,
                          fontFamily: 'Poppins'
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
