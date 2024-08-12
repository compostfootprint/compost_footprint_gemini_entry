import 'dart:convert';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:compost_footprint/compostable_item/model/compostable_item_model.dart';
import 'package:flutter/material.dart';

class SearchRepository {
  final FirebaseFunctions _firebaseFunctions;
  const SearchRepository(this._firebaseFunctions);

  Future<CompostableItemModel> searchItem(String itemName) async {
    try {
      final HttpsCallable callable = _firebaseFunctions.httpsCallable(
          'get_compost_results',
          options: HttpsCallableOptions());
      final HttpsCallableResult result = await callable.call(<String, dynamic>{
        'item': itemName,
      });
      final resultDecoded = jsonDecode(result.data.toString());
      return CompostableItemModel.fromJson(resultDecoded);
    } catch (e) {
      debugPrint('Error calling function: $e');

      throw Exception('$e');
    }
  }
}
