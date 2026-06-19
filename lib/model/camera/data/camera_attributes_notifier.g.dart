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
    extends $NotifierProvider<CameraAttributesNotifier, ImageAttributes> {
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
  Override overrideWithValue(ImageAttributes value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ImageAttributes>(value),
    );
  }
}

String _$cameraAttributesNotifierHash() =>
    r'9a28bb92d66743b0c98acaffa5db790655b2d692';

abstract class _$CameraAttributesNotifier extends $Notifier<ImageAttributes> {
  ImageAttributes build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<ImageAttributes, ImageAttributes>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ImageAttributes, ImageAttributes>,
              ImageAttributes,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
