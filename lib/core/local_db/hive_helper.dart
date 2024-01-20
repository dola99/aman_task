import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

class HiveDBHelper<T> {
  late Box<T> _box;

  Future<bool> openBox(String boxName) async {
    try {
      _box = await Hive.openBox<T>(boxName);
      return true; // Box opened successfully
    } catch (e) {
      debugPrint('Error opening box: $e');
      return false; // Failed to open box
    }
  }

  Future<void> closeBox() async {
    await _box.close();
  }

  Future<int> addItem(T item) async {
    if (_box.isOpen) {
      return await _box.add(item);
    } else {
      debugPrint('Box is not open. Cannot add item.');
      return -1; // Return a value indicating failure
    }
  }

  Future<void> updateItem(int index, T newItem) async {
    if (_box.isOpen) {
      await _box.put(index, newItem);
    } else {
      debugPrint('Box is not open. Cannot update item.');
      // Handle the case where the box is not open
    }
  }

  Future<void> deleteItem(int index) async {
    if (_box.isOpen) {
      await _box.delete(index);
    } else {
      debugPrint('Box is not open. Cannot delete item.');
    }
  }

  List<T> getAllItems() {
    if (_box.isOpen) {
      return _box.values.toList();
    } else {
      debugPrint('Box is not open. Cannot retrieve items.');
      return [];
    }
  }

  T getItem(int index) {
    if (_box.isOpen) {
      return _box.get(index)!;
    } else {
      debugPrint('Box is not open. Cannot retrieve item.');
      throw Exception('Box is not open');
    }
  }

  int get itemCount => _box.length;

  Future<void> clear() async {
    if (_box.isOpen) {
      await _box.clear();
    } else {
      debugPrint('Box is not open. Cannot clear items.');
      // Handle the case where the box is not open
    }
  }
}
