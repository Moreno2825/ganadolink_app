import 'package:flutter/material.dart';

class MyGrid extends StatelessWidget {
  MyGrid({
    super.key,
  });

  final List<Map<String, String>> items = [
    {
      'folio': 'SED34DF4RF',
      'placas': 'WD3RF4',
      'modelo': 'Hereford',
    },
       {
      'folio': 'SED34DF4RF',
      'placas': 'WD3RF4',
      'modelo': 'Hereford',
    },
       {
      'folio': 'SED34DF4RF',
      'placas': 'WD3RF4',
      'modelo': 'Hereford',
    },
    
       {
      'folio': 'SED34DF4RF',
      'placas': 'WD3RF4',
      'modelo': 'Hereford',
    },
    
       {
      'folio': 'SED34DF4RF',
      'placas': 'WD3RF4',
      'modelo': 'Hereford',
    },
    
       {
      'folio': 'SED34DF4RF',
      'placas': 'WD3RF4',
      'modelo': 'Hereford',
    },
    
    
    
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 12.0,
        childAspectRatio: 1.2,
      ),
      itemCount: items.length, // Usar items.length
      itemBuilder: (context, index) {
        final item = items[index]; // Acceder al item

        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
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
                      fontFamily: 'Poppins',
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    item['placas'] ?? '',
                    style: const TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 19,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    item['modelo'] ?? '',
                    style: const TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
