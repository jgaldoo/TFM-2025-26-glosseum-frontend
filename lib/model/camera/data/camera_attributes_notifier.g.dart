// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'camera_attributes_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CameraAttributesNotifier)
final cameraAttributesProvider = CameraAttributesNotifierProvider._();

final class CameraAttributesNotifierProvider
    extends $NotifierProvider<CameraAttributesNotifier, CameraAttributes> {
  CameraAttributesNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cameraAttributesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cameraAttributesNotifierHash();

  @$internal
  @override
  CameraAttributesNotifier create() => CameraAttributesNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CameraAttributes value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CameraAttributes>(value),
    );
  }
}

String _$cameraAttributesNotifierHash() =>
    r'9024ce88760317abb988880d32b26586a965fe37';

abstract class _$CameraAttributesNotifier extends $Notifier<CameraAttributes> {
  CameraAttributes build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<CameraAttributes, CameraAttributes>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<CameraAttributes, CameraAttributes>,
              CameraAttributes,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
