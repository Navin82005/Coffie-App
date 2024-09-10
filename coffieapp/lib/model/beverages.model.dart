class Beverage {
  int _id;
  String _name;
  String _description;
  String _oneLiner;
  String _imagePath;
  String _rating;
  bool _isVeg;

  // Constructor with required parameters using initializer list
  Beverage({
    required int id,
    required String name,
    required String oneLiner,
    required String description,
    required String imagePath,
    required String rating,
    required bool isVeg,
  })  : _id = id,
        _name = name,
        _oneLiner = oneLiner,
        _description = description,
        _imagePath = imagePath,
        _rating = rating,
        _isVeg = isVeg;

  // Getters to access the private fields
  int get id => _id;
  String get name => _name;
  String get oneLiner => _oneLiner;
  String get description => _description;
  String get imagePath => _imagePath;
  String get rating => _rating;
  bool get isVeg => _isVeg;
}
