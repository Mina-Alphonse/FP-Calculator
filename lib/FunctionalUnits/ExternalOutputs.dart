import 'package:flutter/material.dart';
import 'package:fp_calculator/FunctionPoint.dart';
import 'package:flutter/services.dart';

class ExternalOutputs extends StatefulWidget {
  
  final FunctionPoint fp;
  ExternalOutputs({FunctionPoint fp}) : this.fp = fp;
  _ExternalOutputsState createState() => _ExternalOutputsState(fp);
}

class _ExternalOutputsState extends State<ExternalOutputs> {

  FunctionPoint fp = FunctionPoint();
  _ExternalOutputsState(this.fp);
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
          //External Outputs
          Row(
            children: <Widget>[
              Text(
                'External Outputs:',
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
              labelText: '$hinttext External Outputs',
              border: OutlineInputBorder(),
            ),
            onChanged: (value) {
              if (weight == "Simple")
                fp.simple[1] = int.parse(value);
              else if (weight == "Average")
                fp.average[1] = int.parse(value);
              else if (weight == 'Complex')
                fp.complex[1] = int.parse(value);
            },
          ),
        ],),
    );
  }
}
