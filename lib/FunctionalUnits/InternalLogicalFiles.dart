import 'package:flutter/material.dart';
import 'package:fp_calculator/FunctionPoint.dart';
import 'package:flutter/services.dart';

class InternalLogicalFiles extends StatefulWidget {
  final FunctionPoint fp;
  InternalLogicalFiles({FunctionPoint fp}) : this.fp = fp;
  _InternalLogicalFilesState createState() => _InternalLogicalFilesState(fp);
}

class _InternalLogicalFilesState extends State<InternalLogicalFiles> {
  FunctionPoint fp = FunctionPoint();
  _InternalLogicalFilesState(this.fp);
  String weight, hinttext = 'Complexity of';
  var _textController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void weightHandler(String val)
  {
    setState(() {
      hinttext = weight = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Row(
          children: <Widget>[
            Text(
              'Internal Logical Files:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        SizedBox(height: 6,),
        TextField(
          keyboardType: TextInputType.number,
          inputFormatters:  [FilteringTextInputFormatter.digitsOnly],
          controller: _textController,
          decoration: InputDecoration(
            suffix: DropdownButton(
              onChanged: (val) {
                weightHandler(val);
                _textController.clear();
              },
              icon: Icon(Icons.keyboard_arrow_down),
              iconEnabledColor: Colors.black,
              dropdownColor: Colors.white,
              value: weight,
              hint: Text(
                'Complexity',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w300,
                ),
              ),
              items: <String>['Simple', 'Average', 'Complex'].map<DropdownMenuItem<String>>((String value) {
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
            labelText: '$hinttext Internal Logical Files',
            border: OutlineInputBorder(),
          ),
          onChanged: (value) {
            if (weight == "Simple")
              fp.simple[3] = int.parse(value);
            else if (weight == "Average")
              fp.average[3] = int.parse(value);
            else if (weight == 'Complex')
              fp.complex[3] = int.parse(value);
          },
        ),
      ],),
    );
  }
}
