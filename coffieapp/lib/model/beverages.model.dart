import 'package:uuid/uuid.dart';

enum ChoiceOfCupFilling { full, half, threeQuarters, quatre }

enum ChoiceOfMilk {
  skimMilk,
  almondMilk,
  soyMilk,
  lactoseFreeMilk,
  fullCreamMilk,
  oatMilk,
  milk
}

enum ChoiceOfSugar { twice, once, half, no }

final choiceOfCupFillingMap = {
  ChoiceOfCupFilling.full: "Full",
  ChoiceOfCupFilling.half: "1/2 Full",
  ChoiceOfCupFilling.quatre: "1/4 Full",
  ChoiceOfCupFilling.threeQuarters: "3/4 Full",
};

final choiceOfSugarMap = {
  ChoiceOfSugar.no: "No Sugar",
  ChoiceOfSugar.once: "Sugar X1",
  ChoiceOfSugar.twice: "Sugar X2",
  ChoiceOfSugar.half: "½ Sugar",
};

class Beverage {
  final String _id;
  String _name;
  String _description;
  String _oneLiner;
  String _imagePath;
  String _rating;
  bool _isVeg;
  ChoiceOfCupFilling _choiceOfCupFilling;
  ChoiceOfMilk _choiceOfMilk;
  ChoiceOfSugar _choiceOfSugar;

  // Constructor with required parameters using initializer list
  Beverage({
    required String name,
    required String oneLiner,
    required String description,
    required String imagePath,
    required String rating,
    required bool isVeg,
  })  : _id = const Uuid().v4(), // Auto-generate the ID
        _name = name,
        _oneLiner = oneLiner,
        _description = description,
        _imagePath = imagePath,
        _rating = rating,
        _isVeg = isVeg,
        _choiceOfCupFilling = ChoiceOfCupFilling.full,
        _choiceOfMilk = ChoiceOfMilk.milk,
        _choiceOfSugar = ChoiceOfSugar.once;

  // Getters
  String get id => _id;
  String get name => _name;
  String get oneLiner => _oneLiner;
  String get description => _description;
  String get imagePath => _imagePath;
  String get rating => _rating;
  bool get isVeg => _isVeg;
  ChoiceOfCupFilling get choiceOfCupFilling => _choiceOfCupFilling;
  ChoiceOfMilk get choiceOfMilk => _choiceOfMilk;
  ChoiceOfSugar get choiceOfSugar => _choiceOfSugar;

  // Setters
  set name(String value) => _name = value;
  set oneLiner(String value) => _oneLiner = value;
  set description(String value) => _description = value;
  set imagePath(String value) => _imagePath = value;
  set rating(String value) => _rating = value;
  set isVeg(bool value) => _isVeg = value;
  set choiceOfCupFilling(ChoiceOfCupFilling value) =>
      _choiceOfCupFilling = value;
  set choiceOfMilk(ChoiceOfMilk value) => _choiceOfMilk = value;
  set choiceOfSugar(ChoiceOfSugar value) => _choiceOfSugar = value;
}
