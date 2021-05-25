import 'package:flutter/material.dart';
import 'package:fp_calculator/FunctionPoint.dart';
import 'package:fp_calculator/FunctionalUnits/ExternalInputs.dart';
import 'package:fp_calculator/FunctionalUnits/ExternalInquiry.dart';
import 'package:fp_calculator/FunctionalUnits/ExternalOutputs.dart';
import 'package:fp_calculator/FunctionalUnits/ExternalUiFiles.dart';
import 'package:fp_calculator/FunctionalUnits/InternalLogicalFiles.dart';

class UFP extends StatefulWidget {

  final FunctionPoint fp;
  UFP({FunctionPoint fp}) : this.fp = fp;
  _UFPState createState() => _UFPState(fp);
}

class _UFPState extends State<UFP> {

  FunctionPoint fp = FunctionPoint();
  _UFPState(this.fp);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FP Calculator'),
        centerTitle: true,
        backgroundColor: Colors.grey[850],
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: [
          Column(
            children: [
              //External Inputs
              ExternalInputs(fp: fp,),

              SizedBox(height: 4,),
              //External Outputs
              ExternalOutputs(fp: fp,),

              SizedBox(height: 4,),
              //External Inquiries
              ExternalInquiry(fp: fp,),

              SizedBox(height: 4,),
              //Internal Logical Files
              InternalLogicalFiles(fp: fp,),

              SizedBox(height: 4,),
              //External UI Files
              ExternalUiFiles(fp: fp,),

              // UFP Add Button
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.black,
                ),
                margin: EdgeInsets.all(25),
                child: Theme(
                  data: ThemeData(
                    backgroundColor: Colors.black,
                  ),
                  child: OutlineButton(
                    child: Text("Add UFP", style: TextStyle(fontSize: 20.0,color: Colors.blue),),
                    highlightedBorderColor: Colors.blue,
                    // shape: RoundedRectangleBorder(
                    //
                    //      borderRadius: BorderRadius.circular(15)),
                    onPressed: () {
                      setState(() {
                        fp.ufp = fp.calculateUFP(fp.simple, fp.average,fp.complex);
                      });
                    },
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
