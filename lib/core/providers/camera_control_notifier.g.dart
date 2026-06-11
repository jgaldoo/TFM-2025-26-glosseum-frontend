// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'camera_control_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CameraNotifier)
final cameraProvider = CameraNotifierProvider._();

final class CameraNotifierProvider
    extends $NotifierProvider<CameraNotifier, CameraState> {
  CameraNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cameraProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cameraNotifierHash();

  @$internal
  @override
  CameraNotifier create() => CameraNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CameraState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CameraState>(value),
    );
  }
}

String _$cameraNotifierHash() => r'4738373f4928581a9c19f75338fdb31b71e1e997';

abstract class _$CameraNotifier extends $Notifier<CameraState> {
  CameraState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<CameraState, CameraState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<CameraState, CameraState>,
              CameraState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
