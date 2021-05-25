import 'package:flutter/material.dart';
import 'package:fp_calculator/FunctionPoint.dart';
import 'package:flutter/services.dart';

class ExternalUiFiles extends StatefulWidget {

  final FunctionPoint fp;
  ExternalUiFiles({FunctionPoint fp}) : this.fp = fp;
  _ExternalUiFilesState createState() => _ExternalUiFilesState(fp);

}

class _ExternalUiFilesState extends State<ExternalUiFiles> {
  FunctionPoint fp = FunctionPoint();
  _ExternalUiFilesState(this.fp);
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
              'External Ui Files:',
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
            labelText: '$hinttext External Ui Files',
            border: OutlineInputBorder(),
          ),
          onChanged: (value) {
            if (weight == "Simple")
              fp.simple[4] = int.parse(value);
            else if (weight == "Average")
              fp.average[4] = int.parse(value);
            else if (weight == 'Complex')
              fp.complex[4] = int.parse(value);
          },
        ),
      ],),
    );
  }
}

