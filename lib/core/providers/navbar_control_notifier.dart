import 'package:glosseum_frontend/core/models/navbar_state.dart';
import 'package:glosseum_frontend/core/widgets/navbar/nav_entry.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'navbar_control_notifier.g.dart';

@riverpod
class NavbarControlNotifier extends _$NavbarControlNotifier {
  @override
  NavbarState build() => const NavbarState();

  void showTopNavbar(bool show) {
    state = state.copyWith(showTopNavbar: show);
  }

  void showBottomNavbar(bool show) {
    state = state.copyWith(showBottomNavbar: show);
  }

  void setNavbarState(NavbarState navState) {
    state = navState;
  }

  void setTopLeftEntries(List<NavEntry> entries) {
    state = state.copyWith(topNavLeftEntries: entries);
  }

  void setTopRightEntries(List<NavEntry> entries) {
    state = state.copyWith(topNavRightEntries: entries);
  }

  void setBottomEntries(List<NavEntry> entries) {
    state = state.copyWith(bottomNavEntries: entries);
  }
}
