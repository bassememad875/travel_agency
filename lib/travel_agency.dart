import 'package:travel_agency/Trip.dart';
//import 'package:travel_agency/Passenger.dart';
import 'dart:io';

List<Trip> trips = [];

void displayOprions() {
  print('Choose by entering the number of option :');
  print('1) Add Trip                  5) Find a trip by price  ');
  print('2) Edit Trip                 6) Reserve');
  print('3) Delete Trip               7) View latest trips');
  print('4) View ordered by Date      8) View passengers');
}

void showTrips(List<Trip> trips) {
  print(
      'ID   |  Location  |    Date    |  Passenger Limit  |   Price   |  After Discount  ');
  print(
      '__________________________________________________________________________________');
  if (trips.isNotEmpty) {
    for (var i = 0; i < trips.length; i++) {
      print(trips[i].id.toString() +
          '        ' +
          trips[i].location +
          '       ' +
          trips[i].date +
          '         ' +
          trips[i].passengerLimit.toString() +
          '            ' +
          trips[i].price.toString() +
          '           ' +
          trips[i].priceAfterDiscount.toString());
    }
  }
}

void showTrip(Trip trip) {
  print(
      'ID   |  Location  |    Date    |  Passenger Limit  |   Price   |  After Discount  ');
  print(
      '__________________________________________________________________________________');
  print(trip.id.toString() +
      '        ' +
      trip.location +
      '       ' +
      trip.date +
      '         ' +
      trip.passengerLimit.toString() +
      '            ' +
      trip.price.toString() +
      '           ' +
      trip.priceAfterDiscount.toString());
}

void lastTenTrips() {
  print(
      'ID   |  Location  |    Date    |  Passenger Limit  |   Price   |  After Discount  ');
  print(
      '__________________________________________________________________________________');
  if (trips.isNotEmpty) {
    var j = 10;
    for (var i = trips.length - 1; i > -1 && j > 0; i--, j--) {
      print(trips[i].id.toString() +
          '        ' +
          trips[i].location +
          '       ' +
          trips[i].date +
          '         ' +
          trips[i].passengerLimit.toString() +
          '            ' +
          trips[i].price.toString() +
          '           ' +
          trips[i].priceAfterDiscount.toString());
    }
  }
}

void addTrip() {
  bool flag;
  int id;
  int passengerLimit;
  String location;
  String date;
  double price;
  print('Enter Trip Data');
  do {
    flag = false;
    print('ID:');
    id = int.parse(stdin.readLineSync());

    if (trips.isNotEmpty) {
      for (var i = 0; i < trips.length; i++) {
        if (id == trips[i].id) {
          print('ID already exists, please enter another one');
          flag = true;
          break;
        }
      }
    }
  } while (flag);
  print('Location :');
  location = stdin.readLineSync();
  print('Date (yyyy-mm-dd):');
  date = stdin.readLineSync();
  print('Passenger Limit :');
  passengerLimit = int.parse(stdin.readLineSync());
  print('Price :');
  price = double.parse(stdin.readLineSync());

  var t = Trip(id, location, passengerLimit, price, date);
  trips.add(t);
}

void editTrip() {
  if (trips.isEmpty) {
    print('There no trips to edit. please, Add some trips first');
    return;
  }

  var flag = true;
  int id;
  int index;
  String choice;
  do {
    print('Enter ID of the trip you want to edit :');
    id = int.parse(stdin.readLineSync());

    for (var i = 0; i < trips.length; i++) {
      if (trips[i].id == id) {
        index = i;
        flag = false;
        break;
      }
    }
  } while (flag);
  print('Bingo, you can put your new values');
  print('Do you want to change ID ? (y/n)');
  choice = stdin.readLineSync();
  if (choice == 'y' || choice == 'Y') {
    do {
      flag = true;
      print('ID (Must be unique) : ');
      id = int.parse(stdin.readLineSync());
      for (var i = 0; i < trips.length; i++) {
        if (trips[i].id == id) {
          flag = false;
          break;
        }
      }
    } while (!flag);
  }
  trips[index].id = id;
  print('Loction : ');
  trips[index].location = stdin.readLineSync();
  print('Date : ');
  trips[index].date = stdin.readLineSync();
  print('Passenger Limit : ');
  trips[index].passengerLimit = int.parse(stdin.readLineSync());
  print('Price : ');
  trips[index].price = double.parse(stdin.readLineSync());
  print('Done');
}

void deleteTrip() {
  if (trips.isEmpty) {
    print('There is no Trips to delete.');
    return;
  } else {
    print('Enter ID of Trip to delete it :');
    var id = int.parse(stdin.readLineSync());
    var flag = false;
    for (var i = 0; i < trips.length; i++) {
      if (trips[i].id == id) {
        trips.removeAt(i);
        flag = true;
      }
    }
    if (flag) {
      print('Deleted successfully!');
    } else {
      print('Could not delete it, Not found');
    }
  }
}

void findTrip() {
  if (trips.isEmpty) {
    print('There is no Trips to find.');
    return;
  } else {
    print('Enter price of Trip to find it :');
    var price = double.parse(stdin.readLineSync());
    var flag = false;
    for (var i = 0; i < trips.length; i++) {
      if (trips[i].price == price) {
        showTrip(trips[i]);
        flag = true;
      }
    }
    if (flag) {
      print('Found successfully!');
    } else {
      print('Trip was not found');
    }
  }
}

void viewSortedByDate() {
  var sortedTrips = trips;
  var tempTrip;
  for (var i = 0; i < sortedTrips.length; i++) {
    for (var j = 0; j < sortedTrips.length - 1; j++) {
      if (sortedTrips[j].date.compareTo(sortedTrips[j + 1].date) > 0) {
        tempTrip = sortedTrips[j];
        sortedTrips[j] = sortedTrips[j + 1];
        sortedTrips[j + 1] = tempTrip;
      }
    }
  }
  showTrips(sortedTrips);
}
