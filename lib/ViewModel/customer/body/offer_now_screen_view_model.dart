import 'package:day_night_time_picker/lib/state/time.dart';
import 'package:flutter/material.dart';

import '../../../API/autocomplete_place_api.dart';

class OfferNowScreenViewModel extends ChangeNotifier {
  late Time _startTime;
  late Time _endTime;
  int _selectedValue = 1;
  DateTime _startDate = DateTime.now();
  DateTime _endDate = DateTime.now();
  List<dynamic> _suggestionsFrom = [];
  List<dynamic> _suggestionsTo = [];
  final TextEditingController _fromLocationController = TextEditingController();
  final TextEditingController _toLocationController = TextEditingController();
  final TextEditingController _kmController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  /// getters

  int get selectedValue => _selectedValue;

  Time get startTime => _startTime;

  Time get endTime => _endTime;

  DateTime get startDate => _startDate;

  DateTime get endDate => _endDate;

  List<dynamic> get suggestionsFrom => _suggestionsFrom;

  List<dynamic> get suggestionsTo => _suggestionsTo;

  TextEditingController get fromLocationController => _fromLocationController;

  TextEditingController get toLocationController => _toLocationController;

  TextEditingController get kmLocationController => _kmController;

  TextEditingController get priceLocationController => _priceController;

  TextEditingController get descriptionLocationController =>
      _descriptionController;

  /// Functions

  OfferNowScreenViewModel() {
    DateTime now = DateTime.now();
    _startTime = Time(hour: now.hour, minute: now.minute, second: now.second);
    _endTime = Time(hour: now.hour, minute: now.minute, second: now.second);
  }

  onChangedFromController(String value) async {
    if (value.isNotEmpty) {
      final data = await AutoCompletePlaceApi().fetchSuggestions(value);
      _suggestionsFrom = data;
      print('Suggestions updated: $_suggestionsFrom');
      notifyListeners();
    } else {
      clearSuggestions();
      print('Suggestions cleared');
      notifyListeners();
    }
  }

  onChangedToController(String value) async {
    if (value.isNotEmpty) {
      final data = await AutoCompletePlaceApi().fetchSuggestions(value);
      _suggestionsTo = data;
      notifyListeners();
    } else {
      _suggestionsTo.clear();
      notifyListeners();
    }
  }

  void clearSuggestions() {
    _suggestionsFrom.clear();
    _suggestionsTo.clear();
    notifyListeners();
  }

  @override
  void dispose() {
    _fromLocationController.dispose();
    _toLocationController.dispose();
    _kmController.dispose();
    _priceController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void onStartTimeChanged(Time newTime) {
    _startTime = newTime;
    notifyListeners();
  }

  void onEndTimeChanged(Time newTime) {
    _endTime = newTime;
    notifyListeners();
  }

  void onStartDateChanged(DateTime newDate) {
    _startDate = newDate;
    notifyListeners();
  }

  void onEndDateChanged(DateTime newDate) {
    _endDate = newDate;
    notifyListeners();
  }

  String formatTime(Time time) {
    return "${time.hour.toString()}:${time.minute.toString()}";
  }

  String formatDate(DateTime date) {
    return "${date.year.toString()} - ${date.month.toString()} - ${date.day.toString()}";
  }

  void radioValueChange(value) {
    _selectedValue = value;
    notifyListeners();
  }

  onTappedOfferButton(context, String controller1, String controller2,
      String controller3, Map<String, dynamic> map) {
    DateTime startDateTime = DateTime(
      _startDate.year,
      _startDate.month,
      _startDate.day,
      _startTime.hour,
      _startTime.minute,
    );

    DateTime endDateTime = DateTime(
      _endDate.year,
      _endDate.month,
      _endDate.day,
      _endTime.hour,
      _endTime.minute,
    );

    Duration difference = endDateTime.difference(
      startDateTime,
    );
    if (difference.inMinutes < 120) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
              'The time difference between start and end time should be at least 2 hours.'),
          duration: Duration(seconds: 3),
        ),
      );
    } else if (controller1.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please Enter From Location'),
          duration: Duration(seconds: 3),
        ),
      );
    } else if (controller2.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please Enter To Location'),
          duration: Duration(seconds: 3),
        ),
      );
    } else if (controller3.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please Enter Price'),
          duration: Duration(seconds: 3),
        ),
      );

    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(map.toString())));
    }

  }
}
