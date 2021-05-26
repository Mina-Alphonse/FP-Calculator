import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fp_calculator/AVCValues/AVC.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:rating_dialog/rating_dialog.dart';
import '../FunctionPoint.dart';

class ComplexityFactors extends StatefulWidget {
  final FunctionPoint fp;
  ComplexityFactors({FunctionPoint fp}) : this.fp = fp;
  _ComplexityFactorsState createState() => _ComplexityFactorsState(fp);
}

class _ComplexityFactorsState extends State<ComplexityFactors> {

  FunctionPoint fp = FunctionPoint();
  _ComplexityFactorsState(fp);
  String factor;
  bool allFactorsflag = true;


  void factorHandler(String val)
  {
    setState(() {
      factor = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('FP Calculator'),
          centerTitle: true,
          backgroundColor: Colors.grey[850],
        ),
        body: Center(
          child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(10.0),
                  alignment: Alignment.centerLeft,
                  child: Text('TCF Calculations' ,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                ),
                DropdownButton(
                  onChanged: (val) {
                    factorHandler(val);
                    showrate(factor, fp, context);
                  },
                  icon: Icon(Icons.keyboard_arrow_down),
                  iconEnabledColor: Colors.black,
                  dropdownColor: Colors.white,
                  value: factor,
                  hint: Text(
                    'Technical Factors',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  items: <String>[
                    'All Factors',
                    'Data Communication',
                    'Distributed Data Processing',
                    'Performance Criteria',
                    'Heavily Utilized Hardware',
                    'High Transaction Rates',
                    'Online Data Entry',
                    'Online Updating',
                    'End-user Efficiency',
                    'Complex Computations',
                    'Reusability',
                    'Ease of Installation',
                    'Ease of Operation',
                    'Portability',
                    'Maintainability']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(height: 40,),
                //TCF Calculation Button
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
                      child: Text("Calculate TCF", style: TextStyle(fontSize: 20.0,color: Colors.blue),),
                      highlightedBorderColor: Colors.blue,
                      onPressed: () {
                        setState(() {
                          FunctionPoint.tcf = fp.calculateTCF(fp.ratedFactors);
                        });
                          return showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: const Text(''),
                              content: Text('TCF value is ${FunctionPoint.tcf}'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () => Navigator.pop(context, 'OK'),
                                  child: const Text('OK'),
                                ),
                              ],
                            ),
                          );
                      },
                    ),
                  ),
                ),
                SizedBox(height: 50.0,),
                Container(
                  padding: EdgeInsets.all(20.0),
                  alignment: Alignment.centerLeft,
                  child: Text('UFP value is: ${FunctionPoint.ufp}' ,style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                ),
                Container(
                  padding: EdgeInsets.all(20.0),
                  alignment: Alignment.centerLeft,
                  child: Text('TCF value is: ${FunctionPoint.tcf}' ,style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                ),

                SizedBox(height: 90,),
                //FP Calculation Button
                Container(
                  alignment: Alignment.bottomCenter,
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
                      child: Text("Calculate FP", style: TextStyle(fontSize: 20.0,color: Colors.blue),),
                      highlightedBorderColor: Colors.blue,
                      onPressed: () {
                        setState(() {
                          FunctionPoint.fp = fp.calculateFP();
                        });
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => AVC(fp: fp,)));
                          return showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: const Text(''),
                              content: Text('Value of FP is ${FunctionPoint.fp}'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () => Navigator.pop(context, 'OK'),
                                  child: const Text('OK'),
                                ),
                              ],
                            ),
                          );
                      },
                    ),
                  ),
                ),
              ]
          ),
        )
    );
  }
}

void showrate(String factor,FunctionPoint fp,BuildContext context)
{
  bool allFactorsFlag = true;
  showDialog(
      context: context,
      barrierDismissible: false, // set to false if you want to force a rating
      builder: (context) {
        return RatingDialog(
          icon: const Icon(
            Icons.flag,
            size: 100,
            color: Colors.blue,
          ), // set your own image/icon widget
          title: "Factor rating",
          description: "Tap a star to give your rating.",
          submitButton: "SUBMIT",
          accentColor: Colors.blueGrey, // optional
          onSubmitPressed: (int rating) {
            int index = rating.toInt()-1;
            if(factor == 'All Factors' && allFactorsFlag)
            {
              fp.ratedFactors[index] += 14;
              allFactorsFlag = false;
            }
            else if(allFactorsFlag)
            {
              allFactorsFlag = false;
              fp.ratedFactors[index] += 1;
            }
            },
        );
      });
  }