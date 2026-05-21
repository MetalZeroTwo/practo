import 'package:practo/location/location_model.dart';
import 'package:flutter/services.dart';
import 'package:csv/csv.dart';


class LocationController {

  List<LocationModel> locations = [];

  Future<void> loadLocations() async {

    // Load CSV file as string
    final rawData = await rootBundle.loadString(
      'lib/features/location/data/in.csv',
    );

    // Convert CSV string into List
    List<List<dynamic>> csvTable =
    const CsvToListConverter().convert(rawData);

    // Skip header row
    for (int i = 1; i < csvTable.length; i++) {

      final row = csvTable[i];

      locations.add(
        LocationModel(
          city: row[0].toString(),
          adminName: row[1].toString(),
        ),
      );
    }
  }
}