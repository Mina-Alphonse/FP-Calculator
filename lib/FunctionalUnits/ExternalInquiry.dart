import 'package:flutter/material.dart';
import 'package:fp_calculator/FunctionPoint.dart';
import 'package:flutter/services.dart';

class ExternalInquiry extends StatefulWidget {

  final FunctionPoint fp;
  ExternalInquiry({FunctionPoint fp}) : this.fp = fp;
  _ExternalInquiryState createState() => _ExternalInquiryState(fp);
}

class _ExternalInquiryState extends State<ExternalInquiry> {
  FunctionPoint fp = FunctionPoint();
  _ExternalInquiryState(this.fp);
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
              'External Inquiry:',
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
            labelText: '$hinttext External Inquiries',
            border: OutlineInputBorder(),
          ),
          onChanged: (value) {
            if (weight == "Simple")
              fp.simple[2] = int.parse(value);
            else if (weight == "Average")
              fp.average[2] = int.parse(value);
            else if (weight == 'Complex')
              fp.complex[2] = int.parse(value);
          },
        ),

      ],),
    );
  }
}
