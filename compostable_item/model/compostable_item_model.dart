import 'package:equatable/equatable.dart';

class CompostableItemModel extends Equatable {
  final String uid;
  final String name;
  final bool compostable;
  final String description;
  final String imageUrl;
  final num co2Saved;
  final num landfillSaved;

  const CompostableItemModel({
    required this.uid,
    required this.name,
    required this.compostable,
    required this.description,
    required this.imageUrl,
    required this.co2Saved,
    required this.landfillSaved,
  });

  @override
  List<Object> get props => [
        uid,
        name,
        compostable,
        description,
        imageUrl,
        co2Saved,
        landfillSaved,
      ];

  // create an empty item
  factory CompostableItemModel.empty() {
    return const CompostableItemModel(
      uid: '',
      name: '',
      compostable: false,
      description: '',
      imageUrl: '',
      co2Saved: 0,
      landfillSaved: 0,
    );
  }

  factory CompostableItemModel.fromJson(Map<String, dynamic> json) {
    return CompostableItemModel(
      uid: json['uid'],
      name: json['name'],
      compostable: json['compostable'],
      description: json['description'],
      imageUrl: json['imageUrl'],
      co2Saved: json['co2Saved'],
      landfillSaved: json['landfillSaved'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'name': name,
      'compostable': compostable,
      'description': description,
      'imageUrl': imageUrl,
      'co2Saved': co2Saved,
      'landfillSaved': landfillSaved,
    };
  }
}
