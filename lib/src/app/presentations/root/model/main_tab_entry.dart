import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'main_tab_entry.g.dart';

@JsonSerializable()
class MainTabEntry extends Equatable {
  const MainTabEntry({
    required this.id,
    required this.icon,
    this.type,
    this.name = '',
    this.visible = true,
    this.visibleTitle = true,
  });

  factory MainTabEntry.fromJson(Map<String, dynamic> json) => _$MainTabEntryFromJson(json);

  /// The id for this entry.
  ///
  /// Represent a default view (e.g. 'home', 'search') or the id of a list
  /// when [type] is `list`.
  final String id;

  /// The type of this entry.
  ///
  /// Can be `default` for default views (e.g. 'home', 'search') or `list`
  /// when this entry is a list.
  final String? type;

  /// The name of the icon that is used for the associated tab.
  final String? icon;

  /// The name of this tab.
  ///
  /// Can be empty if the tab should not built text with the icon.
  final String? name;

  /// Whether this tab should be visible or hidden.
  ///
  /// Only `default` tabs can be hidden. Lists can only be removed.
  final bool? visible;

  /// Whether this tab title should be visible or hidden.
  ///
  /// Only `default` tabs can be hidden. Lists can only be removed.
  final bool? visibleTitle;

  @override
  List<Object?> get props => <Object?>[
        id,
        type,
        icon,
        name,
        visible,
        visibleTitle,
      ];

  bool get checkName => _hasName && _showName;

  bool get _hasName => name != null && name!.isNotEmpty;
  bool get _showName => visibleTitle != null && visibleTitle!;

  Map<String, dynamic> toJson() => _$MainTabEntryToJson(this);

  MainTabEntry copyWith({
    String? id,
    String? type,
    String? icon,
    String? name,
    bool? visible,
    bool? visibleTitle,
  }) {
    return MainTabEntry(
      id: id ?? this.id,
      type: type ?? this.type,
      icon: icon ?? this.icon,
      name: name ?? this.name,
      visible: visible ?? this.visible,
      visibleTitle: visibleTitle ?? this.visibleTitle,
    );
  }
}
