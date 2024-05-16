import 'package:flutter/material.dart';
import 'package:ganadolink_app/utils/constant.dart' as global;

class ErrorPage extends StatelessWidget {
  ///!
  // final String routName;

  ///!
  static const String routeName = '/ErrorPageRoute';
  const ErrorPage({
    super.key,
    // required this.routName,
  });

  @override
  Widget build(BuildContext context) {
    ///
    var mQ = MediaQuery.of(context);
    double space = mQ.size.width.round() < global.WIDTH_MIN ? 8 : 15;
    bool overflowed =
        (mQ.size.width.round() < global.WIDTH_MIN || mQ.size.height.round() < global.HEIGHT_MIN)
            ? true
            : false;

    ///
    return Material(
      child: Container(
        width: double.infinity,
        height: mQ.size.height,
        color: Colors.teal[100],
        child: Center(
          child: ListView(
            children: [
              ///!  Icon
              SizedBox(height: space),
              overflowed
                  ? const Icon(
                      Icons.warning_amber_rounded,
                      color: Colors.red,
                      size: 50,
                    )
                  : Icon(
                      Icons.check,
                      color: Colors.green[700],
                      size: 70,
                    ),

              ///!  Image
              SizedBox(height: space),
              ///!  "Your Resolution !" label
              SizedBox(height: space),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                child: Column(
                  children: [
                    Text(
                      'This App is best viewed on a device with a minimum resolution of ${global.WIDTH_MIN} pixels wide x ${global.HEIGHT_MIN} pixels tall.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: overflowed ? 13 : 17,
                      ),
                    ),
                    overflowed
                        ? Column(
                            children: [
                              const SizedBox(height: 10),
                              Text(
                                'Please, rotate device for higher resolution horizontally.',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: overflowed ? 13 : 17,
                                ),
                              ),
                            ],
                          )
                        : Container(),
                    Text(
                      '\nYour current resolution is:\n Width: ${mQ.size.width.round().toString()}, high: ${mQ.size.height.toInt().toString()}',
                      style: TextStyle(
                        fontSize: overflowed ? 11 : 15,
                        color: overflowed ? Colors.red : Colors.green[900],
                      ),
                    ),
                  ],
                ),
              ),

              ///!  "Retry" label
              SizedBox(height: space),
              overflowed
                  ? Container()
                  : Container(
                      width: 50,
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      color: Colors.indigo[800],
                      child: TextButton(
                        onPressed: () {
                          //
                          global.responsiveScreenOk = true;
                          //
                          Navigator.pop(context);

                          /// Navigator.pushAndRemoveUntil(
                          ///   context,
                          ///   MaterialPageRoute(
                          ///     builder: (context) => const LoginPage(),
                          ///   ),
                          ///   (_) => false,
                          /// );
                        },
                        child: const Text(
                          'Retry',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
              SizedBox(height: overflowed ? 2 : space),
            ],
          ),
        ),
      ),
    );
  }
}
