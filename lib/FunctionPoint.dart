class FunctionPoint {

  static double tcf,fp,ufp,avc;

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

  //Complexity Factors ratings & number of factors for every rating
  Map factorRating = {'incidental':1, 'moderate':2, 'average':3, 'significant':4, 'essential':5};
  List<int> ratedFactors = [0,0,0,0,0];

  double calculateUFP(List<int> simple ,List<int> average, List<int> complex){

    double simpleElements = 0;
    double averageElements = 0;
    double complexElements = 0;

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
      complexElements += complex[i]*functionUnits[i]["complex"];
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
    return ufp*tcf;
  }

  double calculateLOC()
  {
    return avc*fp;
  }
}
