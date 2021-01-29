import 'dart:io';
import 'package:travel_agency/travel_agency.dart';

void main(List<String> arguments) {
  print('Welcome to our travel agency! ');

  int choice;
  bool keepChoosing;
  String keepChar;
  do {
    displayOprions();
    print('Please,enter your choice :');
    choice = int.parse(stdin.readLineSync());
    keepChoosing = false;
    switch (choice) {
      case 1:
        addTrip();
        break;
      case 2:
        showTrips(trips);
        editTrip();
        break;
      case 3:
        showTrips(trips);
        deleteTrip();
        break;

      case 4:
        viewSortedByDate();
        break;
      case 5:
        findTrip();
        break;
      case 6:
        //reserve();
        break;
      case 7:
        lastTenTrips();
        break;
      case 8:
        //viewPassengers();
        break;

      default:
    }
    print('Do you want to continue? (y/n)');
    keepChar = stdin.readLineSync();
    if (keepChar == 'y' || keepChar == 'Y') {
      keepChoosing = true;
    }
  } while (keepChoosing);
}
