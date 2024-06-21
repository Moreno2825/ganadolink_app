import 'package:flutter/material.dart';

class CustomListview extends StatefulWidget {
  final double height;
  const CustomListview({
    super.key,
    this.height = 450,
  });

  @override
  State<CustomListview> createState() => _CustomListviewState();
}

///! TODO: Solicitar ticket
///! ejemplo del body para la petición de la api
final List<Map<String, String>> people = [
  {
    'folio': 'JU37S6DS45',
    'animal': 'Bovino',
    'direccion': 'Calle 101 #590 Los Heroes',
    'comprador': 'Jesús Trujillo Lizama',
    'estatus': 'En camino',
  },
  {
    'folio': 'JU37S6DS45',
    'animal': 'Bovino',
    'direccion': 'Calle 101 #590 Los Heroes',
    'comprador': 'Jesús Trujillo Lizama',
    'estatus': 'En proceso',
  },
  {
    'folio': 'JU37S6DS45',
    'animal': 'Bovino',
    'direccion': 'Calle 101 #590 Los Heroes',
    'comprador': 'Jesús Trujillo Lizama',
    'estatus': 'En proceso',
  },
];

class _CustomListviewState extends State<CustomListview> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      padding: const EdgeInsets.only(right: 20),
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: people.length,
        itemBuilder: (context, i) {
          return Container(
            height: 120,
            padding: const EdgeInsets.only(left: 20),
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            decoration: BoxDecoration(
              color: const Color(0xffF1F1F1),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${people[i]['folio']}',
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Poppins'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Container(
                        width: 66,
                        height: 23,
                        decoration: BoxDecoration(
                          color: people[i]['estatus'] == 'En camino'
                              ? const Color(0xff00B200)
                              : const Color(0xff387ADF),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            '${people[i]['estatus']}',
                            style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins',
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Text(
                  '${people[i]['animal']}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontFamily: 'Poppins',
                    color: Color(0xff666565),
                  ),
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                      color: Color(0xff9a9a9a),
                    ),
                    Text(
                      '${people[i]['direccion']}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontFamily: 'Poppins',
                        color: Color(0xff9a9a9a),
                      ),
                    ),
                  ],
                ),
                Text(
                  '${people[i]['comprador']}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontFamily: 'Poppins',
                    color: Color(0xff9a9a9a),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
