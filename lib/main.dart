import 'package:flutter/material.dart';
import 'package:fp_calculator/ComplexityFactors/ComplexityFactors.dart';
import 'package:fp_calculator/FunctionPoint.dart';
// import 'package:fp_calculator/FunctionalUnits/UFP.dart';



void main() {
  FunctionPoint fp = FunctionPoint();
  runApp(MaterialApp(
    routes: {
      '/': (context) => ComplexityFactors(fp: fp,),
    },
  ));
}

