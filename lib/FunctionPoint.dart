class FunctionPoint {

  double tcf ;
  int ufp;

  List<Map> functionUnits = [
      {'simple': 3, 'average': 4, 'complex': 6},
      {'simple': 4, 'average': 5, 'complex': 7},
      {'simple': 3, 'average': 4, 'complex': 6},
      {'simple': 7, 'average': 10,'complex': 15},
      {'simple': 5, 'average': 7, 'complex': 10},
  ];
  final List<int> simple = [0,0,0,0,0];
  final List<int> average = [0,0,0,0,0];
  final List<int> complex = [0,0,0,0,0];

  final Map functionalUnits = {};

  Map factorRating = {'incidental':1, 'moderate':2, 'average':3, 'significant':4, 'essential':5};

  int calculateUFP(List<int> simple ,List<int> average, List<int> complex){

    int simpleElements = 0;
    int averageElements = 0;
    int complexElements = 0;

    for(int i = 0; i < 5; i++)
      {
        simpleElements += simple[i]*functionUnits[i]["simple"];
      }

    for (int i = 0; i < 5; i++)
    {
      averageElements += average[i] * functionUnits[i]["average"];
    }

    for(int i = 0; i < 5; i++)
    {
      complexElements = complex[i]*functionUnits[i]["complex"];
    }


    return (simpleElements+averageElements+complexElements);
  }
  double calculateTCF(List<int> ratedFactors)
  {
    double di = 0;
    di += ratedFactors[0]*factorRating['incidental'];
    di += ratedFactors[1]*factorRating['moderate'];
    di += ratedFactors[2]*factorRating['average'];
    di += ratedFactors[3]*factorRating['significant'];
    di += ratedFactors[4]*factorRating['essential'];
    return 0.65+0.01*di;
  }

  double calculateFP()
  {
    return tcf*ufp;
  }

}
