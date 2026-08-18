import 'package:glosseum_frontend/core/enums/app_screen_enum.dart';
import 'package:glosseum_frontend/core/theme/icons/glosseum_icons.dart';
import 'package:glosseum_frontend/core/widgets/navbar/nav_entry.dart';
import 'package:go_router/go_router.dart';

final mainTopLeftNavbarEntries = [
  NavEntry(
    icon: GlosseumIcons.back,
    onTap: (context, _) async => context.pop(),
  ),
];

final mainTopRightNavbarEntries = [
  NavEntry(
    icon: GlosseumIcons.settings,
    onTap: (context, _) => context.push(AppScreenEnum.settings.route),
  ),
];

final mainBottomNavbarEntries = [
  NavEntry(
    icon: GlosseumIcons.menu,
    label: 'Menú',
    onTap: (context, _) => context.push(AppScreenEnum.home.route),
  ),
  NavEntry(
    icon: GlosseumIcons.qr_code_scanner,
    label: 'Escanear QR',
    onTap: (context, _) =>
        context.push('/information/dummy'), //AppScreenEnum.qrScanner.route),
  ),
  NavEntry(
    icon: GlosseumIcons.camera,
    label: 'Transcribir',
    onTap: (context, _) => context.push(AppScreenEnum.camera.route),
  ),
];
