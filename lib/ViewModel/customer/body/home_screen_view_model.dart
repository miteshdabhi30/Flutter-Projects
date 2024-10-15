// import 'package:flutter/cupertino.dart';
// import '../../../API/driver_getdriver_api/api_model_get_driver.dart';
// import '../../../API/driver_getdriver_api/api_service.dart';
//
// class HomeScreenViewModel extends ChangeNotifier {
//   final ApiServiceGetDriver _apiServiceGetDriver = ApiServiceGetDriver();
//   List<Data>? _driverList;
//
//   List<Data>? get driverList => _driverList;
//
//   Future<void> fetchData() async {
//     _driverList = await _apiServiceGetDriver.getData();
//     notifyListeners(); // Notify listeners when data is updated
//   }
// }



import 'package:flutter/cupertino.dart';
import '../../../API/driver_getdriver_api/api_model_get_driver.dart';
import '../../../API/driver_getdriver_api/api_service.dart';

class HomeScreenViewModel extends ChangeNotifier {
  final ApiServiceGetDriver _apiServiceGetDriver = ApiServiceGetDriver();

  List<Data>? _driverList;
  bool _isLoading = false;
  String? _errorMessage;

  /// Getters
  List<Data>? get driverList => _driverList;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchData() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      List<Data>? fetchedData = await _apiServiceGetDriver.getData();
      if (fetchedData != null) {
        _driverList = fetchedData;
      } else {
        _errorMessage = "No drivers found.";
      }
    } catch (e) {
      _errorMessage = "Failed to fetch data: $e";
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
