import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fp_calculator/FunctionPoint.dart';
import 'package:fp_calculator/FunctionalUnits/UFP.dart';
import 'package:google_fonts/google_fonts.dart';


class Welcome extends StatefulWidget {
  FunctionPoint fp;
  Welcome({FunctionPoint fp}) : this.fp = fp;

  @override
  _WelcomeState createState() => _WelcomeState(fp);
}

class _WelcomeState extends State<Welcome> {

  FunctionPoint fp = FunctionPoint();
  _WelcomeState(fp);

  @override
  Widget build(BuildContext context) {
    Timer(
        Duration(seconds: 2),
            () =>
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                    builder:(BuildContext context) => UFP(fp: fp,)
                )
            )

    );
    return Scaffold(

      backgroundColor:Colors.black,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            heightFactor: 6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Function Point',
                    style: GoogleFonts.righteous(
                      color: Colors.blue,
                      fontSize: 42,
                    )
                  ),
                  Text(
                      'Calculator',
                      style: GoogleFonts.righteous(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                        fontSize: 42,
                      )
                  ),
                ],
              )
          ),
        ),
      ),
    );
  }
}
