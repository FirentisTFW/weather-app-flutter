import 'package:app/commons/collections.dart';
import 'package:app/data/enums/comparison_object.dart';
import 'package:app/data/models/single_location_data.dart';
import 'package:app/networking/models/location_weather_data.dart';

abstract class ComparisonFactory {
  const ComparisonFactory._();

  static CollectionOf2<SingleLocationData> prepareWeatherDataForComparison({
    required ComparisonObject comparisonObject,
    required CollectionOf2<LocationWeatherData> weatherData,
  }) {
    // TODO Implement, remove mocks
    return CollectionOf2(
      SingleLocationData(
        data: weatherData.item1.currentWeather?.temperature,
        dataDisplay: '5°C',
        locationName: 'Poznań',
      ),
      SingleLocationData(
        data: weatherData.item2.currentWeather?.temperature,
        dataDisplay: '16°C',
        locationName: 'Malaga',
      ),
    );
  }
}
