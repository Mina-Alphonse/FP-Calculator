import 'package:flutter/material.dart';
import 'package:fp_calculator/AVCValues/AVC.dart';
import 'package:fp_calculator/ComplexityFactors/ComplexityFactors.dart';
import 'package:fp_calculator/FunctionPoint.dart';
import 'package:fp_calculator/FunctionalUnits/UFP.dart';
import 'package:fp_calculator/FunctionalUnits/Welcome.dart';



void main() {
  FunctionPoint fp = FunctionPoint();
  runApp(MaterialApp(
    routes: {
      '/': (context) => Welcome(fp: fp,),
      '/UFP': (context) => UFP(fp: fp,),
      '/ComplexityFactprs': (context) => ComplexityFactors(fp: fp,),
      '/AVC': (context) => AVC(fp: fp,)
    },
  ));
}

