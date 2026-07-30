import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:glosseum_frontend/core/widgets/navbar/nav_entry.dart';

part 'navbar_state.freezed.dart';

@freezed
abstract class NavbarState with _$NavbarState {
  const factory NavbarState({
    @Default(false) bool showTopNavbar,
    @Default([]) List<NavEntry> topNavLeftEntries,
    @Default([]) List<NavEntry> topNavRightEntries,

    @Default(false) bool showBottomNavbar,
    @Default([]) List<NavEntry> bottomNavEntries,
  }) = _NavbarState;
}
