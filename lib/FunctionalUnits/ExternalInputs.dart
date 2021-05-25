import 'package:flutter/material.dart';
import 'package:fp_calculator/FunctionPoint.dart';
import 'package:flutter/services.dart';

class ExternalInputs extends StatefulWidget {

  final FunctionPoint fp;
  ExternalInputs({FunctionPoint fp}) : this.fp = fp;
  _ExternalInputsState createState() => _ExternalInputsState(fp);

}

class _ExternalInputsState extends State<ExternalInputs> {

  FunctionPoint fp = FunctionPoint();
  _ExternalInputsState(this.fp);
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

    print(fp.ufp);
    print(fp.average);

    return Container(
        child: Column(children: [
          //External Inputs
          Row(
            children: <Widget>[
              Text(
                'External Inputs:',
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
              labelText: '$hinttext External Inputs',
              border: OutlineInputBorder(),
            ),
            onChanged: (value) {
              if (weight == "Simple")
                fp.simple[0] = int.parse(value);
              else if (weight == "Average")
                fp.average[0] = int.parse(value);
              else if (weight == 'Complex')
                fp.complex[0] = int.parse(value);
            },
          ),
        ],),
      );
  }
}

