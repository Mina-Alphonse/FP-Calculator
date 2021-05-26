import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fp_calculator/FunctionPoint.dart';

class AVC extends StatefulWidget {

  FunctionPoint fp ;
  AVC({FunctionPoint fp}) : this.fp = fp;

  @override
  _AVCState createState() => _AVCState(fp);
}

class _AVCState extends State<AVC> {

  FunctionPoint fp = FunctionPoint();
  _AVCState(fp);
  Color color;
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FP Calculator'),
        centerTitle: true,
        backgroundColor: Colors.grey[850],
      ),
      body: ListView(
        children: [ DataTable(
          dividerThickness: 4.0,
          showCheckboxColumn: false,
          columns: [
            DataColumn(label: Text('Programming Language')),
            DataColumn(label: Text('LOC/FP (Average)'), numeric: true)
          ],
          rows: [
            DataRow(cells: [
              DataCell(Text('Assembly Language')),
              DataCell(Text('320')),
            ], selected: 0 == selectedIndex,
              onSelectChanged: (val) {
              setState(() {
              selectedIndex = 0;
              FunctionPoint.avc = 320;
              });
              },
            ),
            DataRow(cells: [
              DataCell(Text('C')),
              DataCell(Text('128')),
            ], selected: 1 == selectedIndex,
              onSelectChanged: (val) {
                setState(() {
                  selectedIndex = 1;
                  FunctionPoint.avc = 128;
                });
              },
            ),
            DataRow(cells: [
              DataCell(Text('COBOL/Fortan')),
              DataCell(Text('105')),
            ], selected: 2 == selectedIndex,
              onSelectChanged: (val) {
                setState(() {
                  selectedIndex = 2;
                  FunctionPoint.avc = 105;
                });
              },
            ),
            DataRow(cells: [
              DataCell(Text('Pascal')),
              DataCell(Text('90')),
            ], selected: 3 == selectedIndex,
              onSelectChanged: (val) {
                setState(() {
                  selectedIndex = 3;
                  FunctionPoint.avc = 90;
                });
              },
            ),
            DataRow(cells: [
              DataCell(Text('Ada')),
              DataCell(Text('70')),
            ], selected: 4 == selectedIndex,
              onSelectChanged: (val) {
                setState(() {
                  selectedIndex = 4;
                  FunctionPoint.avc = 70;
                });
              },
            ),
            DataRow(cells: [
              DataCell(Text('C++')),
              DataCell(Text('64')),
            ], selected: 5 == selectedIndex,
              onSelectChanged: (val) {
                setState(() {
                  selectedIndex = 5;
                  FunctionPoint.avc = 64;
                });
              },
            ),
            DataRow(cells: [
              DataCell(Text('Visual Basic')),
              DataCell(Text('32')),
            ], selected: 6 == selectedIndex,
              onSelectChanged: (val) {
                setState(() {
                  selectedIndex = 6;
                  FunctionPoint.avc = 32;
                });
              },
            ),
            DataRow(cells: [
              DataCell(Text('Objected-Oriented Languages')),
              DataCell(Text('30')),
            ], selected: 7 == selectedIndex,
              onSelectChanged: (val) {
                setState(() {
                  selectedIndex = 7;
                  FunctionPoint.avc = 30;
                });
              },
            ),
            DataRow(cells: [
              DataCell(Text('Smalltalk')),
              DataCell(Text('22')),
            ], selected: 8 == selectedIndex,
              onSelectChanged: (val) {
                setState(() {
                  selectedIndex = 8;
                  FunctionPoint.avc = 22;
                });
              },
            ),
            DataRow(cells: [
              DataCell(Text('Code Generators (PowerBuilder)')),
              DataCell(Text('15')),
            ], selected: 9 == selectedIndex,
              onSelectChanged: (val) {
                setState(() {
                  selectedIndex = 9;
                  FunctionPoint.avc = 15;
                });
              },
            ),
            DataRow(cells: [
              DataCell(Text('SQL/Oracle')),
              DataCell(Text('12')),
            ], selected: 10 == selectedIndex,
              onSelectChanged: (val) {
                setState(() {
                  selectedIndex = 10;
                  FunctionPoint.avc = 12;
                });
              },
            ),
            DataRow(cells: [
              DataCell(Text('Spreadsheets')),
              DataCell(Text('6')),
            ], selected: 11 == selectedIndex,
              onSelectChanged: (val) {
                setState(() {
                  selectedIndex = 11;
                  FunctionPoint.avc = 6;
                });
              },
            ),
            DataRow(cells: [
              DataCell(Text('Graphical Languages (icons)')),
              DataCell(Text('4'))
            ], selected: 12 == selectedIndex,
              onSelectChanged: (val) {
                setState(() {
                  selectedIndex = 12;
                  FunctionPoint.avc = 4;
                });
              },
            ),
          ],
        ),
          SizedBox(height: 10,),
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
                child: Text("Calculate LOC", style: TextStyle(fontSize: 20.0,color: Colors.blue),),
                highlightedBorderColor: Colors.blue,
                onPressed: () {
                  return showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text(''),
                      content: Text('Value of LOC is ${fp.calculateLOC()}'),
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
    ],
      ),
    );
  }
}
