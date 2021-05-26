import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
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
  bool allFactorsflag = true, resetFlag = true;


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
                    resetFlag = false;
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
                RatingBar.builder(
                  initialRating: 0,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: false,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) =>
                      Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),

                  onRatingUpdate: (rating) {
                    int index = rating.toInt()-1;
                      if(factor == 'All Factors')
                      {
                        fp.ratedFactors[index] += 14;
                        allFactorsflag = false;
                        return showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text(''),
                            content: const Text('All Factors ratings are added'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'OK'),
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        );
                      }
                    else if(allFactorsflag)
                      {
                        fp.ratedFactors[index] += 1;
                        return showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text(''),
                            content: const Text('Factor rating is added'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'OK'),
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        );
                      }
                    print(fp.ratedFactors);
                  },
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
                          fp.tcf = fp.calculateTCF(fp.ratedFactors);
                          return showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: const Text(''),
                              content: Text('Value of TCF is ${fp.tcf}'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () => Navigator.pop(context, 'OK'),
                                  child: const Text('OK'),
                                ),
                              ],
                            ),
                          );
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(height: 50.0,),
                Container(
                  padding: EdgeInsets.all(20.0),
                  alignment: Alignment.centerLeft,
                  child: Text('UFP value is: ${fp.ufp}' ,style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                ),

                SizedBox(height: 120,),
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
                          fp.fp = fp.calculateFP();
                          return showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: const Text(''),
                              content: Text('Value of FP is ${fp.fp}'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () => Navigator.pop(context, 'OK'),
                                  child: const Text('OK'),
                                ),
                              ],
                            ),
                          );
                        });
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