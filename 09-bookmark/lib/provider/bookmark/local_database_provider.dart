// todo-02-provider-01: create a new provider that handle dependency injection
import 'package:flutter/widgets.dart';
import 'package:tourism_app/data/local/local_database_service.dart';
import 'package:tourism_app/data/model/tourism.dart';

class LocalDatabaseProvider extends ChangeNotifier {
  // todo-02-provider-02: inject sqlite service
  final LocalDatabaseService _service;

  LocalDatabaseProvider(this._service);

  // todo-02-provider-03: add a state to load a saving process and load a getting value process
  String _message = "";
  String get message => _message;

  List<Tourism>? _tourismList;
  List<Tourism>? get tourismList => _tourismList;

  Tourism? _tourism;
  Tourism? get tourism => _tourism;

  // todo-02-provider-04: add a function to save a tourism value
  Future<void> saveTourismValue(Tourism value) async {
    try {
      final result = await _service.insertItem(value);

      final isError = result == 0;
      if (isError) {
        _message = "Failed to save your data";
        notifyListeners();
      } else {
        _message = "Your data is saved";
        notifyListeners();
      }
    } catch (e) {
      _message = "Failed to save your data";
      notifyListeners();
    }
  }

  // todo-02-provider-05: add a function to load all tourism value
  Future<void> loadAllTourismValue() async {
    try {
      _tourismList = await _service.getAllItems();
      _message = "All of your data is loaded";
      notifyListeners();
    } catch (e) {
      _message = "Failed to load your all data";
      notifyListeners();
    }
  }

  // todo-02-provider-06: add a function to load tourism value based on id
  Future<void> loadTourismValueById(int id) async {
    try {
      _tourism = await _service.getItemById(id);
      _message = "Your data is loaded";
      notifyListeners();
    } catch (e) {
      _message = "Failed to load your data";
      notifyListeners();
    }
  }

  // todo-02-provider-07: add a function to remove tourism value based on id
  Future<void> removeTourismValueById(int id) async {
    try {
      await _service.removeItem(id);

      _message = "Your data is removed";
      notifyListeners();
    } catch (e) {
      _message = "Failed to remove your data";
      notifyListeners();
    }
  }
}
