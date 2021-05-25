import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ComplexityFactors extends StatefulWidget {
  const ComplexityFactors({Key key}) : super(key: key);

  @override
  _ComplexityFactorsState createState() => _ComplexityFactorsState();
}

class _ComplexityFactorsState extends State<ComplexityFactors> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FP Calculator'),
      centerTitle: true,
      backgroundColor: Colors.grey[850],
      ),
      body: RatingBar.builder(
            initialRating: 0,
            minRating: 0,
            direction: Axis.horizontal,
            allowHalfRating: false,
            itemCount: 5,
            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {
              print(rating);
            },
      ),
    );
  }
}
