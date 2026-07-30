// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'navbar_control_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(NavbarControlNotifier)
final navbarControlProvider = NavbarControlNotifierProvider._();

final class NavbarControlNotifierProvider
    extends $NotifierProvider<NavbarControlNotifier, NavbarState> {
  NavbarControlNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'navbarControlProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$navbarControlNotifierHash();

  @$internal
  @override
  NavbarControlNotifier create() => NavbarControlNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(NavbarState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<NavbarState>(value),
    );
  }
}

String _$navbarControlNotifierHash() =>
    r'5521f337f6367b646ab783bc4a4e69f2ab909b0b';

abstract class _$NavbarControlNotifier extends $Notifier<NavbarState> {
  NavbarState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<NavbarState, NavbarState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<NavbarState, NavbarState>,
              NavbarState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
