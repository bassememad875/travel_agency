import 'package:travel_agency/Passenger.dart';

class Trip {
  int _id;
  String _location;
  int _passengerLimit;
  int _passengerNum;
  double _price;
  double _priceAfterDiscount;
  String _date;
  List<Passenger> passengers;

  Trip(
    int id,
    String location,
    int passengerLimit,
    double price,
    String date,
  ) {
    // ignore: unnecessary_this
    _id = id;
    _location = location;
    _passengerLimit = passengerLimit;
    _passengerNum = 0;
    _price = price;
    if (price > 10000) {
      _priceAfterDiscount = price * 0.80;
    } else {
      _priceAfterDiscount = price;
    }
    _date = date;
  }

  int get id {
    return _id;
  }

  set id(int id) {
    _id = id;
  }

  int get passengerLimit {
    return _passengerLimit;
  }

  set passengerLimit(int passengerLimit) {
    _passengerLimit = passengerLimit;
  }

  int get passengerNum {
    return _passengerNum;
  }

  set passengerNum(int passengerNum) {
    _passengerNum = passengerNum;
  }

  String get location {
    return _location;
  }

  set location(String location) {
    _location = location;
  }

  String get date {
    return _date;
  }

  set date(String date) {
    _date = date;
  }

  double get price {
    return _price;
  }

  set price(double price) {
    _price = price;
    if (price > 10000) {
      _priceAfterDiscount = price * 0.8;
    } else {
      _priceAfterDiscount = price;
    }
  }

  double get priceAfterDiscount {
    return _priceAfterDiscount;
  }

  bool isAvalible() {
    if (_passengerNum == _passengerLimit) {
      return false;
    }
    return true;
  }

  void addPassenger(Passenger passenger) {
    _passengerNum++;
    passengers.add(passenger);
  }
}
