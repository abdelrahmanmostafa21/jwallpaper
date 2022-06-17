import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'app_theme_data.g.dart';

@JsonSerializable()
class AppThemeData extends Equatable {
  const AppThemeData({
    required this.name,
    required this.backgroundColors,
    required this.primaryColor,
    required this.secondaryColor,
    required this.cardColor,
    required this.statusBarColor,
    required this.navBarColor,
  });

  factory AppThemeData.fromJson(Map<String, dynamic> json) =>
      _$AppThemeDataFromJson(json);

  final String name;
  final List<int> backgroundColors;
  final int primaryColor;
  final int secondaryColor;
  final int cardColor;
  final int statusBarColor;
  final int navBarColor;

  @override
  List<Object?> get props => [
        name,
        backgroundColors,
        primaryColor,
        secondaryColor,
        cardColor,
        statusBarColor,
        navBarColor,
      ];

  Map<String, dynamic> toJson() => _$AppThemeDataToJson(this);

  AppThemeData copyWith({
    String? name,
    List<int>? backgroundColors,
    int? primaryColor,
    int? secondaryColor,
    int? cardColor,
    int? statusBarColor,
    int? navBarColor,
  }) {
    return AppThemeData(
      name: name ?? this.name,
      backgroundColors: backgroundColors ?? this.backgroundColors,
      primaryColor: primaryColor ?? this.primaryColor,
      secondaryColor: secondaryColor ?? this.secondaryColor,
      cardColor: cardColor ?? this.cardColor,
      statusBarColor: statusBarColor ?? this.statusBarColor,
      navBarColor: navBarColor ?? this.navBarColor,
    );
  }
}
