class Passenger {
  int _nationalID;
  String _name;
  String _number;
  String _email;

  Passenger(
    int _nationalID,
    String _name,
    String _number,
    String _email,
  ) {
    this._nationalID = _nationalID;
    this._name = _name;
    this._number = _number;
    this._email = _email;
  }
  int get nationalID {
    return _nationalID;
  }

  String get name {
    return _name;
  }

  String get number {
    return _number;
  }

  String get email {
    return _email;
  }
}
